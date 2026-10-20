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
-- package org.allbinary.game.physics.acceleration

local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GravityUtil = {}
GravityUtil.__index = GravityUtil
GravityUtil.className = "GravityUtil"

function GravityUtil:_init_fields()
    self.GAME_GRAVITY_VELOCITY = 1800
    self.MAX_GAME_VELOCITY = 18000
end

function GravityUtil.new()
    local self = setmetatable({}, GravityUtil)
    self:_init_fields()
    return self
end


function GravityUtil.getInstance()
        return GravityUtil.instance
end


function GravityUtil:process(velocityProperties, customGravity)
        velocityProperties:getVelocityYBasicDecimalP():addint(customGravity)
end

GravityUtil.instance = GravityUtil.new()

return GravityUtil

