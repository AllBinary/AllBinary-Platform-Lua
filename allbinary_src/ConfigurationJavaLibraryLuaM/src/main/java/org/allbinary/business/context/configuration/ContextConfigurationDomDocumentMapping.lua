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
-- package org.allbinary.business.context.configuration

local ContextConfigurationDomDocumentMapping = {}
package.loaded["org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping"] = ContextConfigurationDomDocumentMapping

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

local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local DomDocumentMappingInterface = java_lazy("org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local ContextConfigurationInterface = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationInterface")
local ContextConfigurationView = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationView")

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

-- class table ContextConfigurationDomDocumentMapping is declared before the requires
ContextConfigurationDomDocumentMapping.__index = ContextConfigurationDomDocumentMapping
ContextConfigurationDomDocumentMapping.className = "ContextConfigurationDomDocumentMapping"
ContextConfigurationDomDocumentMapping.javaClassName = "org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping"
ContextConfigurationDomDocumentMapping.java_implements = " DomDocumentMappingInterface "
ContextConfigurationDomDocumentMapping.java_interfaces = function() return {DomDocumentMappingInterface} end

function ContextConfigurationDomDocumentMapping:_init_fields()
    if self.contextConfigurationInterface == nil then self.contextConfigurationInterface = nil end
end


function ContextConfigurationDomDocumentMapping._jinit(self, contextConfigurationInterface)
    ContextConfigurationDomDocumentMapping._init_fields(self)
        self.contextConfigurationInterface = contextConfigurationInterface
    return self
end

function ContextConfigurationDomDocumentMapping.new(...)
    local self = setmetatable({}, ContextConfigurationDomDocumentMapping)
    ContextConfigurationDomDocumentMapping._jinit(self, ...)
    return self
end


-- throws Exception
function ContextConfigurationDomDocumentMapping:toXmlDoc()
        local document = DomDocumentHelper.create()
        local node = ContextConfigurationView.new(self.contextConfigurationInterface):toXmlNode(document)
        document:appendChild(node)
        return document
end


-- throws Exception
function ContextConfigurationDomDocumentMapping:toDomDocumentString()
        return XmlDocumentHelper.toString(self:toXmlDoc())
end

return ContextConfigurationDomDocumentMapping

