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
-- package org.allbinary.business.user.modules.configuration

local UserRole = require("org.allbinary.business.user.role.UserRole")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
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

local UserConfigurationInterfaceFactory = {}
UserConfigurationInterfaceFactory.__index = UserConfigurationInterfaceFactory
UserConfigurationInterfaceFactory.className = "UserConfigurationInterfaceFactory"


function UserConfigurationInterfaceFactory.new()
    local self = setmetatable({}, UserConfigurationInterfaceFactory)
    return self
end


-- throws Exception
function UserConfigurationInterfaceFactory.getInstance(document)
        local configurationNode = DomSearchHelper.getNode(UserConfigurationData.NAME, document:getChildNodes())
        return UserConfigurationView.new(configurationNode):getUserConfigurationInterface()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function UserConfigurationInterfaceFactory.getInstance(userRole)
        local abPath = AbPath.new(self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().USERCONFIGURATIONPATH, tostring(UserConfigurationInterfaceFactory.configurationName) .. tostring(userRole) .. tostring(AbPathData.getInstance().EXTENSION_SEP) .. tostring(UserConfigurationData.UNCRYPTED_EXTENSION))
        local documentString = CryptFileReader.new(UserConfigurationData.UNCRYPTED_EXTENSION, UserConfigurationData.ENCRYPTED_EXTENSION):get(abPath)
        local document = DomDocumentHelper.create(documentString)
        return UserConfigurationInterfaceFactory.getInstance(document)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function UserConfigurationInterfaceFactory.getInstance()
        return UserConfiguration.new()
end

UserConfigurationInterfaceFactory.configurationName = "DefaultUserConfiguration"

return UserConfigurationInterfaceFactory

