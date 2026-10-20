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
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local BasicItemView = {}
BasicItemView.__index = BasicItemView
BasicItemView.className = "BasicItemView"

function BasicItemView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.itemInterface = nil
    self.vector = nil
end


function BasicItemView.new(itemInterface, vector)
    local self = setmetatable({}, BasicItemView)
    self:_init_fields()
        self.itemInterface = itemInterface
        self.vector = vector
    return self
end


-- throws Exception
function BasicItemView:toXmlNode(document)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, "toXmlNode")
        end
        local hashMap = self.itemInterface:toHashMap()
        local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
        hashMap:put(self.basicItemData.IMAGE, EMPTY_STRING)
        local stringUtil = StringUtil.getInstance()
        local keySet = hashMap:keySet()
        local node = document:createElement(self.basicItemData.ITEM)
        local nameArray = keySet:toArray()
        local size2 = (nameArray.n or #nameArray)
        for index = 0, size2 - 1 do
            local name = nameArray[index + 1]
            local value = hashMap:get(name)
            value = stringUtil:getNonNull(value)
            node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
        end
        local totalNode = ModDomHelper.createNameValueNodes(document, self.basicItemData.TOTAL, tostring(self.itemInterface:getTotal()))
        node:appendChild(totalNode)
        local size = self.vector:size()
        for index = 0, size - 1 do
            local domNodeInterface = self.vector:get(index)
            local customNode = domNodeInterface:toXmlNode(document)
            node:appendChild(customNode)
        end
        return node
end


function BasicItemView:toXmlDoc()
        return nil
end


function BasicItemView:view()
        return nil
end

return BasicItemView

