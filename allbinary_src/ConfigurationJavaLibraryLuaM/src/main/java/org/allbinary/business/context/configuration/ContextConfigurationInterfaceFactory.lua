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

local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
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

local ContextConfigurationInterfaceFactory = {}
ContextConfigurationInterfaceFactory.__index = ContextConfigurationInterfaceFactory
ContextConfigurationInterfaceFactory.className = "ContextConfigurationInterfaceFactory"


function ContextConfigurationInterfaceFactory.getInstance()
        return ContextConfigurationInterfaceFactory.instance
end


function ContextConfigurationInterfaceFactory.new()
    local self = setmetatable({}, ContextConfigurationInterfaceFactory)
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ContextConfigurationInterfaceFactory:getInstance(document)
        local contextConfigurationData = ContextConfigurationData.getInstance()
        local contextConfigurationNode = DomSearchHelper.getNode(contextConfigurationData.NAME, document:getChildNodes())
        return ContextConfigurationView.new(contextConfigurationNode):getContextConfigurationInterface()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ContextConfigurationInterfaceFactory:getInstance(contextName)
        local abPath = ContextConfigurationPathUtil.getAbPath(contextName)
        local contextConfigurationData = ContextConfigurationData.getInstance()
        local documentString = CryptFileReader.new(contextConfigurationData.UNCRYPTED_EXTENSION, contextConfigurationData.ENCRYPTED_EXTENSION):get(abPath)
        local document = DomDocumentHelper.create(documentString)
        return self:getInstance(document)
end

ContextConfigurationInterfaceFactory.instance = ContextConfigurationInterfaceFactory.new()

return ContextConfigurationInterfaceFactory

