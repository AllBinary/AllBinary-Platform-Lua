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
-- package org.allbinary.media.graphics.geography.map.racetrack

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

local RaceTrackFrictionProperties = {}
RaceTrackFrictionProperties.__index = RaceTrackFrictionProperties
RaceTrackFrictionProperties.className = "RaceTrackFrictionProperties"

function RaceTrackFrictionProperties:_init_fields()
    self.ROAD_FRICTION_NOMINATOR = nil
    self.GROUND_FRICTION_NOMINATOR = nil
end


function RaceTrackFrictionProperties.new(roadFriction, groundFriction)
    local self = setmetatable({}, RaceTrackFrictionProperties)
    self:_init_fields()
        self.ROAD_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - roadFriction
        self.GROUND_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - groundFriction
    return self
end


function RaceTrackFrictionProperties:getRoadFrictionNominator()
        return self.ROAD_FRICTION_NOMINATOR
end


function RaceTrackFrictionProperties:getGroundFrictionNominator()
        return self.GROUND_FRICTION_NOMINATOR
end

return RaceTrackFrictionProperties

