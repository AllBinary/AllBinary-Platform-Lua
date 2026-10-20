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
local DomData = require("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local CssProperty = {}
CssProperty.__index = CssProperty
CssProperty.className = "CssProperty"

function CssProperty:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.propertyName = nil
    self.cssPropertyValues = nil
end

function CssProperty.new(...)
    local count = select("#", ...)
    if count == 1 then return CssProperty._new1(...)
    elseif count == 1 then return CssProperty._new1(...)
    end
end


function CssProperty._new1(name)
    local self = setmetatable({}, CssProperty)
    self:_init_fields()
        self.propertyName = name
        self.cssPropertyValues = CssPropertyValues.new()
    return self
end


function CssProperty._new1(node)
    local self = setmetatable({}, CssProperty)
    self:_init_fields()
        local propertyNode = DomSearchHelper.getNode(DomData.VALUE, node:getChildNodes())
        self.propertyName = DomNodeHelper.getTextNodeValue(propertyNode)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().STYLE) then
            self.logUtil:putF("Name: " .. self:getName(), self, "CssProperty()")
        end
        local propertyValuesNode = DomSearchHelper.getNode(CssPropertyData.getInstance().VALUES, node:getChildNodes())
        self.cssPropertyValues = CssPropertyValues.new(propertyValuesNode)
    return self
end


function CssProperty:getName()
        return self.propertyName
end


function CssProperty:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(CssPropertyData.getInstance().NAME, self.propertyName)
        return hashMap
end


-- throws Exception
function CssProperty:toXmlNode(document)
        local hashMap = self:toHashMap()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("CssView HashMap: " .. tostring(hashMap), self, "toXmlNode()")
        end
        local node = ModDomHelper.createNameValueNodes(document, CssPropertyData.getInstance().NAME, self.propertyName)
        node:appendChild(self.cssPropertyValues:toXmlNode(document))
        return node
end

return CssProperty

