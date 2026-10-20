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

local RepairTechnology = {}
RepairTechnology.__index = RepairTechnology
RepairTechnology.className = "RepairTechnology"

function RepairTechnology:_init_fields()
    self.level = 0
    self.maxLevel = nil
end


function RepairTechnology.new(maxLevel)
    local self = setmetatable({}, RepairTechnology)
    self:_init_fields()
        self.maxLevel = maxLevel
    return self
end


function RepairTechnology:isCompleted()
        return false
end


function RepairTechnology:getPercentComplete()
        return 0
end


function RepairTechnology:getLevel()
        return self.level
end


function RepairTechnology:getMaxLevel()
        return self.maxLevel
end


function RepairTechnology:getCost()
        return 0
end


function RepairTechnology:downgrade()
end


function RepairTechnology:getDowngradeCost()
        return 0
end


function RepairTechnology:isDowngradeable()
        return false
end


function RepairTechnology:getUpgradeCost()
        return (self:getLevel() * self:getLevel()) * 1000
end


function RepairTechnology:isUpgradeable()
        if self:getLevel() < self:getMaxLevel() then
            return true
        else
            return false
        end
end


function RepairTechnology:upgrade()
        self.level = self.level + 1
        local unitTechnologySingletonFactory = UnitTechnologySingletonFactory.getInstance()
        unitTechnologySingletonFactory:setRepair(unitTechnologySingletonFactory:getRepair() + (self:getLevel() * 10))
end


function RepairTechnology:isSelfUpgradeable()
        return false
end

return RepairTechnology

