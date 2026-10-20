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
-- package org.allbinary.logic.communication.log.config


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogConfigData = {}
LogConfigData.__index = LogConfigData
LogConfigData.className = "LogConfigData"

function LogConfigData:_init_fields()
    self.NAME = "LOG_CONFIG_NAME"
    self.DESCRIPTION = "LOG_CONFIG_DESCRIPTION"
    self.FILE = "LOG_CONFIG_FILE"
end


function LogConfigData.getInstance()
        return LogConfigData.instance
end


function LogConfigData.new()
    local self = setmetatable({}, LogConfigData)
    self:_init_fields()
    return self
end

LogConfigData.instance = LogConfigData.new()

return LogConfigData

