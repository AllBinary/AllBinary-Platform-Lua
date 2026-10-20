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
-- package org.allbinary.business.user.modules.admin.configuration

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local ContextConfiguration = require("org.allbinary.business.context.configuration.ContextConfiguration")
local ContextConfigurationData = require("org.allbinary.business.context.configuration.ContextConfigurationData")
local ContextConfigurationDomDocumentMapping = require("org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping")
local ContextConfigurationInterface = require("org.allbinary.business.context.configuration.ContextConfigurationInterface")
local ContextConfigurationInterfaceFactory = require("org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory")
local ContextConfigurationPathUtil = require("org.allbinary.business.context.configuration.ContextConfigurationPathUtil")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileWriter = require("org.allbinary.logic.control.crypt.file.CryptFileWriter")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local AdminConfigurationInterface = require("org.allbinary.business.user.modules.admin.configuration.AdminConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdminConfiguration = {}
AdminConfiguration.__index = AdminConfiguration
AdminConfiguration.className = "AdminConfiguration"

function AdminConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.contextConfigurationInterface = nil
end

function AdminConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return AdminConfiguration._new0(...)
    elseif count == 1 then return AdminConfiguration._new1(...)
    elseif count == 1 then return AdminConfiguration._new1(...)
    end
end


function AdminConfiguration._new0()
    local self = setmetatable({}, AdminConfiguration)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.contextConfigurationInterface = ContextConfigurationInterfaceFactory.getInstance():getInstance(AdminConfigurationData.CONTEXTNAME)
    return self
end


function AdminConfiguration._new1(request)
    local self = setmetatable({}, AdminConfiguration)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:getFormData(RequestParams.new(request):toHashMap())
    return self
end


function AdminConfiguration._new1(storeHashMap)
    local self = setmetatable({}, AdminConfiguration)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:getFormData(storeHashMap)
    return self
end


-- throws Exception
function AdminConfiguration:getFormData(storeHashMap)
        self.logUtil:putF(self.commonStrings.START, self, "getFormData")
        self:setContextConfigurationInterface(ContextConfiguration.new(storeHashMap))
end


-- throws Exception
function AdminConfiguration:write()
        local contextConfigurationDomDocumentMapping = ContextConfigurationDomDocumentMapping.new(self:getContextConfigurationInterface())
        local cryptFileWriter = CryptFileWriter.new(ContextConfigurationData.getInstance().UNCRYPTED_EXTENSION, ContextConfigurationData.getInstance().ENCRYPTED_EXTENSION)
        cryptFileWriter:write(ContextConfigurationPathUtil.getAbPath(AdminConfigurationData.CONTEXTNAME), contextConfigurationDomDocumentMapping:toXmlDoc())
end


function AdminConfiguration:getContextConfigurationInterface()
        return self.contextConfigurationInterface
end


function AdminConfiguration:setContextConfigurationInterface(contextConfigurationInterface)
        self.contextConfigurationInterface = contextConfigurationInterface
end

return AdminConfiguration

