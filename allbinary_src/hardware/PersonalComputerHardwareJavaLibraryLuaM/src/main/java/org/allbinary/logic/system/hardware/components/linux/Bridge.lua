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

local BridgeInterface = require("org.allbinary.logic.system.hardware.components.interfaces.BridgeInterface")
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

local Bridge = {}
Bridge.__index = Bridge
Bridge.className = "Bridge"

function Bridge:_init_fields()
    self.data = nil
end


function Bridge.new(data)
    local self = setmetatable({}, Bridge)
    self:_init_fields()
        self.data = data
    return self
end


function Bridge:compareTo(componentInterface)
        return true
end


function Bridge:toString()
        return self.data
end
Bridge.__tostring = function(self) return self:toString() end

return Bridge

