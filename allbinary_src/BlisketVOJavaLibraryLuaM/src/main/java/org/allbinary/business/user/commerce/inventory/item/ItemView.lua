--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.business.user.commerce.inventory.item

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StreetAddressData = require("org.allbinary.business.user.address.StreetAddressData")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ItemView = {}
ItemView.__index = ItemView
ItemView.className = "ItemView"

function ItemView:_init_fields()
    self.itemInterface = nil
    self.vector = nil
end


function ItemView.new(itemInterface, vector)
    local self = setmetatable({}, ItemView)
    self:_init_fields()
        self.itemInterface = itemInterface
        self.vector = vector
    return self
end


-- throws Exception
function ItemView:toXmlNode(document)
        local hashMap = self.itemInterface:toHashMap()
        local keySet = hashMap:keySet()
        local node = document:createElement(ItemData.ITEM)
        local basicItemView = BasicItemView.new(self.itemInterface, self.vector)
        node:appendChild(basicItemView:toXmlNode(document))
        local stringUtil = StringUtil.getInstance()
        local nameArray = keySet:toArray()
        local size = (nameArray.n or #nameArray)
        for index = 0, size - 1 do
            local name = nameArray[index + 1]
            local value = hashMap:get(name)
            value = stringUtil:getNonNull(value)
            node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
        end
        local shippingAddressNode = document:createElement(StreetAddressData.NAME)
        shippingAddressNode:appendChild(self.itemInterface:getShippingAddress():toXmlNode(document))
        return node
end

return ItemView

