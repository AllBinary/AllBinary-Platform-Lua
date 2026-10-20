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
-- package org.allbinary.physics.movement

local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")
local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicConstantVelocityMovement = require("org.allbinary.physics.movement.BasicConstantVelocityMovement")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DelayedConstantVelocityMovement = {}
DelayedConstantVelocityMovement.__index = DelayedConstantVelocityMovement
DelayedConstantVelocityMovement.className = "DelayedConstantVelocityMovement"
setmetatable(DelayedConstantVelocityMovement, {__index = BasicConstantVelocityMovement})

function DelayedConstantVelocityMovement:_init_fields()
    self.timeDelayHelper = TimeDelayHelper.new(60)
end


function DelayedConstantVelocityMovement.new(basicDecimal, velocityProperties)
    local self = setmetatable(BasicConstantVelocityMovement.new(basicDecimal, velocityProperties), DelayedConstantVelocityMovement)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function DelayedConstantVelocityMovement:init(speedBasicDecimal, angle, otherAngle)
end


-- throws Exception
function DelayedConstantVelocityMovement:process(layer)
        if self.timeDelayHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            BasicConstantVelocityMovement.process(self, layer)
        end
end

return DelayedConstantVelocityMovement

