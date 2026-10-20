-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.behavior.topview

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

local CharacterFrictionProperties = {}
CharacterFrictionProperties.__index = CharacterFrictionProperties
CharacterFrictionProperties.className = "CharacterFrictionProperties"
setmetatable(CharacterFrictionProperties, {__index = FrictionProperties})

function CharacterFrictionProperties:_init_fields()
    self.WATER_FRICTION_NOMINATOR = nil
    self.AIR_FRICTION_NOMINATOR = nil
    self.COLLISION_FRICTION_NOMINATOR = nil
end


function CharacterFrictionProperties.new(airFriction, waterFriction, collisionFriction)
    local self = setmetatable(FrictionProperties.new(), CharacterFrictionProperties)
    self:_init_fields()
        self.AIR_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - airFriction
        self.COLLISION_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - collisionFriction
        self.WATER_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - waterFriction
    return self
end


function CharacterFrictionProperties:getWATER_FRICTION_NOMINATOR()
        return self.WATER_FRICTION_NOMINATOR
end


function CharacterFrictionProperties:getAIR_FRICTION_NOMINATOR()
        return self.AIR_FRICTION_NOMINATOR
end


function CharacterFrictionProperties:getCOLLISION_FRICTION_NOMINATOR()
        return self.COLLISION_FRICTION_NOMINATOR
end

return CharacterFrictionProperties

