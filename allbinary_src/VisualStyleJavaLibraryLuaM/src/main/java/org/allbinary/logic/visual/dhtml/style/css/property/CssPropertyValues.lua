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
-- package org.allbinary.logic.visual.dhtml.style.css.property

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomData = require("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local CssPropertyValues = {}
CssPropertyValues.__index = CssPropertyValues
CssPropertyValues.className = "CssPropertyValues"

function CssPropertyValues:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.propertyValueVector = nil
end

function CssPropertyValues.new(...)
    local count = select("#", ...)
    if count == 0 then return CssPropertyValues._new0(...)
    elseif count == 1 then return CssPropertyValues._new1(...)
    end
end


function CssPropertyValues._new0()
    local self = setmetatable({}, CssPropertyValues)
    self:_init_fields()
        self.propertyValueVector = BasicArrayListD.new()
    return self
end


function CssPropertyValues._new1(node)
    local self = setmetatable({}, CssPropertyValues)
    self:_init_fields()
        local indexPropertyValueHashMap = StdUtil.getInstance():createHashMap()
        self.propertyValueVector = BasicArrayListD.new()
        local cssPropertyNodeVector = DomSearchHelper.getAllNodes(CssPropertyValueData.getInstance().NAME, node:getChildNodes())
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().STYLE) then
            self.logUtil:putF("Number Of Properties: " .. tostring(cssPropertyNodeVector:size()), self, "CssProperties()")
        end
        local size = cssPropertyNodeVector:size()
        for index = 0, size - 1 do
            local cssPropertyValueNode = cssPropertyNodeVector:get(index)
            local valueNode = DomSearchHelper.getNode(DomData.VALUE, cssPropertyValueNode:getChildNodes())
            local propertyValue = DomNodeHelper.getTextNodeValue(valueNode)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().STYLE) then
                self.logUtil:putF("Property Value: " .. propertyValue, self, "CssProperties()")
            end
            local indexNode = DomSearchHelper.getNode(DomData.INDEX, cssPropertyValueNode:getChildNodes())
            local indexValue = DomNodeHelper.getTextNodeValue(indexNode)
            indexPropertyValueHashMap:put(indexValue, propertyValue)
        end
        local size2 = indexPropertyValueHashMap:keySet():size()
        for index = 0, size2 - 1 do
            local indexInt = index
            local propertyValue = indexPropertyValueHashMap:get(tostring(indexInt))
            self.propertyValueVector:add(propertyValue)
        end
    return self
end


function CssPropertyValues:toHashMap()
        local commonSeps = CommonSeps.getInstance()
        local cssPropertyValueData = CssPropertyValueData.getInstance()
        local hashMap = StdUtil.getInstance():createHashMap()
        local stringBuffer = StringMaker.new()
        local size = self.propertyValueVector:size()
        do
            local index = 0
            while index < size do
            local value = self.propertyValueVector:get(index)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(cssPropertyValueData.NAME)
            stringBuffer:append(commonSeps.BRACKET_OPEN)
            stringBuffer:appendint(index)
            stringBuffer:append(commonSeps.BRACKET_CLOSE)
            hashMap:put(tostring(stringBuffer), value)
            index = index + 1
            index = index + 1
            end
        end
        return hashMap
end


-- throws Exception
function CssPropertyValues:toXmlNode(document)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local hashMap = self:toHashMap()
            self.logUtil:putF("CssPropertyValues HashMap: " .. tostring(hashMap), self, "toXmlNode()")
        end
        return ModDomHelper.createNameValueIndexNodes(document, CssPropertyData.getInstance().VALUES, CssPropertyValueData.getInstance().NAME, self.propertyValueVector)
end

return CssPropertyValues

