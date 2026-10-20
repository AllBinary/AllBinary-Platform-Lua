-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.logic.system.hardware.components.interfaces

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local HardwareComponentInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoHardwareComponent = {}
NoHardwareComponent.__index = NoHardwareComponent
NoHardwareComponent.className = "NoHardwareComponent"

function NoHardwareComponent.new()
    local self = setmetatable({}, NoHardwareComponent)
    return self
end


function NoHardwareComponent.getInstance()
        return NoHardwareComponent.instance
end


function NoHardwareComponent:compareTo(componentInterface)
        if self == componentInterface then
            return true
        end
        return false
end


function NoHardwareComponent:toString()
        return StringUtil.getInstance().NULL_STRING
end
NoHardwareComponent.__tostring = function(self) return self:toString() end

NoHardwareComponent.instance = NoHardwareComponent.new()

return NoHardwareComponent

