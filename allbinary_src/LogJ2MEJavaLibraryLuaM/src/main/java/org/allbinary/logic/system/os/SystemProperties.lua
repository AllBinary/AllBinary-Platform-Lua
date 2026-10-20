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
-- package org.allbinary.logic.system.os


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ActualPlatform
local SystemProperties = {}
SystemProperties.__index = SystemProperties
SystemProperties.className = "SystemProperties"

function SystemProperties:_init_fields()
    self.OS_NAME = "os.name"
    self.OS_ARCH = "os.arch"
    self.OS_VERSION = "os.version"
    self.USER_HOME = "user.home"
end


function SystemProperties.getInstance()
        return SystemProperties.instance
end


function SystemProperties.new()
    local self = setmetatable({}, SystemProperties)
    self:_init_fields()
    return self
end


function SystemProperties:getName()
        return System.getProperty(self.OS_NAME)
end


function SystemProperties:getArch()
        return System.getProperty(self.OS_ARCH)
end


function SystemProperties:getVersion()
        return System.getProperty(self.OS_VERSION)
end


function SystemProperties:getUserHomePath()
        return System.getProperty(self.USER_HOME)
end

SystemProperties.instance = SystemProperties.new()

return SystemProperties

