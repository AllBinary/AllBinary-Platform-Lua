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
-- package org.allbinary.logic.system.hardware.components.linux

local HardDriveControllerInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardDriveControllerInterface")
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

local HardDriveController = {}
HardDriveController.__index = HardDriveController
HardDriveController.className = "HardDriveController"

function HardDriveController:_init_fields()
    self.data = nil
end


function HardDriveController.new(data)
    local self = setmetatable({}, HardDriveController)
    self:_init_fields()
        self.data = data
    return self
end


function HardDriveController:compareTo(componentInterface)
        return true
end


function HardDriveController:toString()
        return self.data
end
HardDriveController.__tostring = function(self) return self:toString() end

return HardDriveController

