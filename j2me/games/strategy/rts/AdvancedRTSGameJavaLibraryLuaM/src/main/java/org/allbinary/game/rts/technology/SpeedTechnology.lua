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
-- package org.allbinary.game.rts.technology

local RTSInterface = require("org.allbinary.game.layer.RTSInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpeedTechnology = {}
SpeedTechnology.__index = SpeedTechnology
SpeedTechnology.className = "SpeedTechnology"

function SpeedTechnology:_init_fields()
    self.level = 0
    self.maxLevel = nil
end


function SpeedTechnology.new(maxLevel)
    local self = setmetatable({}, SpeedTechnology)
    self:_init_fields()
        self.maxLevel = maxLevel
    return self
end


function SpeedTechnology:isCompleted()
        return false
end


function SpeedTechnology:getPercentComplete()
        return 0
end


function SpeedTechnology:getLevel()
        return self.level
end


function SpeedTechnology:getMaxLevel()
        return self.maxLevel
end


function SpeedTechnology:getCost()
        return 0
end


function SpeedTechnology:downgrade()
end


function SpeedTechnology:getDowngradeCost()
        return 0
end


function SpeedTechnology:isDowngradeable()
        return false
end


function SpeedTechnology:getUpgradeCost()
        return (self:getLevel() * self:getLevel()) * 1000
end


function SpeedTechnology:isUpgradeable()
        if self:getLevel() < self:getMaxLevel() then
            return true
        else
            return false
        end
end


function SpeedTechnology:upgrade()
        self.level = self.level + 1
        local unitTechnologySingletonFactory = UnitTechnologySingletonFactory.getInstance()
        unitTechnologySingletonFactory:setSpeed(unitTechnologySingletonFactory:getSpeed() + (self:getLevel() * 100))
end


function SpeedTechnology:isSelfUpgradeable()
        return false
end

return SpeedTechnology

