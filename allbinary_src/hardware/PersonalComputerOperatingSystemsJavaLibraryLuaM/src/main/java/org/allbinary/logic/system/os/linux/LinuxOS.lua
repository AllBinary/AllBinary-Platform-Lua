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
-- package org.allbinary.logic.system.os.linux

local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LinuxOS = {}
LinuxOS.__index = LinuxOS
LinuxOS.className = "LinuxOS"
setmetatable(LinuxOS, {__index = GenericOperatingSystem})


function LinuxOS.new()
    local self = setmetatable(GenericOperatingSystem.new(), LinuxOS)
        self.scalable = true
    return self
end


function LinuxOS:isAutoHide()
        return true
end

return LinuxOS

