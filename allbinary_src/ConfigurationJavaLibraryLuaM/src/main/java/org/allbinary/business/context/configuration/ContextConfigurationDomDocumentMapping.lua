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

local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local DomDocumentMappingInterface = require("org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface")
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

local ContextConfigurationDomDocumentMapping = {}
ContextConfigurationDomDocumentMapping.__index = ContextConfigurationDomDocumentMapping
ContextConfigurationDomDocumentMapping.className = "ContextConfigurationDomDocumentMapping"

function ContextConfigurationDomDocumentMapping:_init_fields()
    self.contextConfigurationInterface = nil
end


function ContextConfigurationDomDocumentMapping.new(contextConfigurationInterface)
    local self = setmetatable({}, ContextConfigurationDomDocumentMapping)
    self:_init_fields()
        self.contextConfigurationInterface = contextConfigurationInterface
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

