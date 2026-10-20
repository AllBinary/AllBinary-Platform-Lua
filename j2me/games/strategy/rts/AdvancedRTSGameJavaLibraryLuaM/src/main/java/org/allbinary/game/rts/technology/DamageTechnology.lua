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

local DamageTechnology = {}
DamageTechnology.__index = DamageTechnology
DamageTechnology.className = "DamageTechnology"

function DamageTechnology:_init_fields()
    self.level = 0
    self.maxLevel = nil
end


function DamageTechnology.new(maxLevel)
    local self = setmetatable({}, DamageTechnology)
    self:_init_fields()
        self.maxLevel = maxLevel
    return self
end


function DamageTechnology:isCompleted()
        return false
end


function DamageTechnology:getPercentComplete()
        return 0
end


function DamageTechnology:getLevel()
        return self.level
end


function DamageTechnology:getMaxLevel()
        return self.maxLevel
end


function DamageTechnology:getCost()
        return 0
end


function DamageTechnology:downgrade()
end


function DamageTechnology:getDowngradeCost()
        return 0
end


function DamageTechnology:isDowngradeable()
        return false
end


function DamageTechnology:getUpgradeCost()
        return (self:getLevel() * self:getLevel()) * 1000
end


function DamageTechnology:isUpgradeable()
        if self:getLevel() < self:getMaxLevel() then
            return true
        else
            return false
        end
end


function DamageTechnology:upgrade()
        self.level = self.level + 1
        local unitTechnologySingletonFactory = UnitTechnologySingletonFactory.getInstance()
        unitTechnologySingletonFactory:setDamage(unitTechnologySingletonFactory:getDamage() + (self:getLevel() * 100))
end


function DamageTechnology:isSelfUpgradeable()
        return false
end

return DamageTechnology

