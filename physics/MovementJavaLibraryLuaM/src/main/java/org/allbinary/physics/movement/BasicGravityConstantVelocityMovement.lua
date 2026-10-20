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
local GravityUtil = require("org.allbinary.game.physics.acceleration.GravityUtil")
local VelocityProperties = require("org.allbinary.game.physics.velocity.VelocityProperties")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
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

local BasicGravityConstantVelocityMovement = {}
BasicGravityConstantVelocityMovement.__index = BasicGravityConstantVelocityMovement
BasicGravityConstantVelocityMovement.className = "BasicGravityConstantVelocityMovement"
setmetatable(BasicGravityConstantVelocityMovement, {__index = BasicConstantVelocityMovement})

function BasicGravityConstantVelocityMovement:_init_fields()
    self.gravityUtil = GravityUtil.getInstance()
end


function BasicGravityConstantVelocityMovement.new(speedBasicDecimal)
    local self = setmetatable(BasicConstantVelocityMovement.new(speedBasicDecimal, VelocityProperties.new(java_int(speedBasicDecimal:getUnscaled()), java_int(speedBasicDecimal:getUnscaled()))), BasicGravityConstantVelocityMovement)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function BasicGravityConstantVelocityMovement:process(layer)
        BasicConstantVelocityMovement.process(self, layer)
        self.gravityUtil:process(self:getVelocityProperties(), self.gravityUtil.GAME_GRAVITY_VELOCITY)
end

return BasicGravityConstantVelocityMovement

