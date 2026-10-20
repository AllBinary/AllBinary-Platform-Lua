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
-- package org.allbinary.game.layer

local VelocityProperties = require("org.allbinary.game.physics.velocity.VelocityProperties")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VehicleProperties = {}
VehicleProperties.__index = VehicleProperties
VehicleProperties.className = "VehicleProperties"

function VehicleProperties:_init_fields()
    self.velocityProperties = nil
    self.vehicleFrictionProperties = nil
end


function VehicleProperties.new(velocityProperties, vehicleFrictionProperties)
    local self = setmetatable({}, VehicleProperties)
    self:_init_fields()
        self.velocityProperties = velocityProperties
        self.vehicleFrictionProperties = vehicleFrictionProperties
    return self
end


function VehicleProperties:getVehicleFrictionProperties()
        return self.vehicleFrictionProperties
end


function VehicleProperties:setVehicleFrictionProperties(vehicleFrictionProperties)
        self.vehicleFrictionProperties = vehicleFrictionProperties
end


function VehicleProperties:getVelocityProperties()
        return self.velocityProperties
end

return VehicleProperties

