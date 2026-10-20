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

local FrictionProperties = require("org.allbinary.game.physics.FrictionProperties")
local FrictionData = require("org.allbinary.game.physics.friction.FrictionData")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VehicleFrictionProperties = {}
VehicleFrictionProperties.__index = VehicleFrictionProperties
VehicleFrictionProperties.className = "VehicleFrictionProperties"
setmetatable(VehicleFrictionProperties, {__index = FrictionProperties})

function VehicleFrictionProperties:_init_fields()
    self.TIRE_FRICTION_NOMINATOR = nil
    self.BRAKE_FRICTION_NOMINATOR = nil
    self.AIR_FRICTION_NOMINATOR = nil
    self.CRASH_FRICTION_NOMINATOR = nil
end


function VehicleFrictionProperties.new(tireFriction, brakeFriction, airFriction, crashFriction)
    local self = setmetatable(FrictionProperties.new(), VehicleFrictionProperties)
    self:_init_fields()
        self.TIRE_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - tireFriction
        self.BRAKE_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - brakeFriction
        self.AIR_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - airFriction
        self.CRASH_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - crashFriction
    return self
end


function VehicleFrictionProperties:getTireFrictionNominator()
        return self.TIRE_FRICTION_NOMINATOR
end


function VehicleFrictionProperties:getBrakeFrictionNominator()
        return self.BRAKE_FRICTION_NOMINATOR
end


function VehicleFrictionProperties:getAirFrictionNominator()
        return self.AIR_FRICTION_NOMINATOR
end


function VehicleFrictionProperties:getCrashFrictionNominator()
        return self.CRASH_FRICTION_NOMINATOR
end

return VehicleFrictionProperties

