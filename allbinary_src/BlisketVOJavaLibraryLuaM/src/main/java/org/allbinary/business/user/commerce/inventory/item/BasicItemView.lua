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

local BasicItemView = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.BasicItemView"] = BasicItemView

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
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table BasicItemView is declared before the requires
BasicItemView.__index = BasicItemView
BasicItemView.className = "BasicItemView"
BasicItemView.javaClassName = "org.allbinary.business.user.commerce.inventory.item.BasicItemView"
BasicItemView.java_implements = " DomNodeInterface "
BasicItemView.java_interfaces = function() return {DomNodeInterface} end

function BasicItemView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    if self.itemInterface == nil then self.itemInterface = nil end
    if self.vector == nil then self.vector = nil end
end


function BasicItemView._jinit(self, itemInterface, vector)
    BasicItemView._init_fields(self)
        self.itemInterface = itemInterface
        self.vector = vector
    return self
end

function BasicItemView.new(...)
    local self = setmetatable({}, BasicItemView)
    BasicItemView._jinit(self, ...)
    return self
end


-- throws Exception
function BasicItemView:toXmlNode(document)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING) then
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

