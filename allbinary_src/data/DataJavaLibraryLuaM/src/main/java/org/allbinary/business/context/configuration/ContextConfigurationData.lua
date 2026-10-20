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

local CommonDataFileStrings = require("org.allbinary.logic.io.file.CommonDataFileStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ContextConfigurationData = {}
ContextConfigurationData.__index = ContextConfigurationData
ContextConfigurationData.className = "ContextConfigurationData"

function ContextConfigurationData:_init_fields()
    self.NAME = "CONTEXT_CONFIGURATION_NAME"
    self.UNCRYPTED_EXTENSION = CommonDataFileStrings.getInstance().UNCRYPTED_EXTENSION
    self.ENCRYPTED_EXTENSION = CommonDataFileStrings.getInstance().ENCRYPTED_EXTENSION
end


function ContextConfigurationData.getInstance()
        return ContextConfigurationData.instance
end


function ContextConfigurationData.new()
    local self = setmetatable({}, ContextConfigurationData)
    self:_init_fields()
    return self
end

ContextConfigurationData.instance = ContextConfigurationData.new()

return ContextConfigurationData

