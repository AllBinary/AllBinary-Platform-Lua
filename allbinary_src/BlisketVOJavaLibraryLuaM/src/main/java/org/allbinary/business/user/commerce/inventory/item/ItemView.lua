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

local ItemView = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.ItemView"] = ItemView

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StreetAddressData = java_lazy("org.allbinary.business.user.address.StreetAddressData")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local BasicItemView = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ItemView is declared before the requires
ItemView.__index = ItemView
ItemView.className = "ItemView"
ItemView.javaClassName = "org.allbinary.business.user.commerce.inventory.item.ItemView"

function ItemView:_init_fields()
    if self.itemInterface == nil then self.itemInterface = nil end
    if self.vector == nil then self.vector = nil end
end


function ItemView._jinit(self, itemInterface, vector)
    ItemView._init_fields(self)
        self.itemInterface = itemInterface
        self.vector = vector
    return self
end

function ItemView.new(...)
    local self = setmetatable({}, ItemView)
    ItemView._jinit(self, ...)
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

