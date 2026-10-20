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

local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Driver = {}
Driver.__index = Driver
Driver.className = "Driver"

function Driver:_init_fields()
    self.turnSpeed = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.trackPathSelectionSkill = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.aggression = nil
end


function Driver.new(turnSpeed, trackPathSelectionSkill, aggression)
    local self = setmetatable({}, Driver)
    self:_init_fields()
        self:setTurnSpeed(turnSpeed)
        self:setTrackPathSelectionSkill(trackPathSelectionSkill)
        self.aggression = aggression
    return self
end


function Driver:getTurnSpeed()
        return self.turnSpeed
end


function Driver:setTurnSpeed(turnSpeed)
        self.turnSpeed = turnSpeed
end


function Driver:getTrackPathSelectionSkill()
        return self.trackPathSelectionSkill
end


function Driver:setTrackPathSelectionSkill(trackPathSelectionSkill)
        self.trackPathSelectionSkill = trackPathSelectionSkill
end


function Driver:getAggression()
        return self.aggression
end


function Driver:setAggression(aggression)
        self.aggression = aggression
end

Driver.NULL_DRIVER = Driver.new(SmallIntegerSingletonFactory.getInstance():getAt(0), SmallIntegerSingletonFactory.getInstance():getAt(0), Aggression.new(SmallIntegerSingletonFactory.getInstance():getAt(0), SmallIntegerSingletonFactory.getInstance():getAt(0), SmallIntegerSingletonFactory.getInstance():getAt(0)))

return Driver

