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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UnitTechnologySingletonFactory = {}
UnitTechnologySingletonFactory.__index = UnitTechnologySingletonFactory
UnitTechnologySingletonFactory.className = "UnitTechnologySingletonFactory"

function UnitTechnologySingletonFactory:_init_fields()
    self.damage = 0
    self.health = 0
    self.reload = 0
    self.repair = 0
    self.speed = 0
end


function UnitTechnologySingletonFactory.getInstance()
        return UnitTechnologySingletonFactory.instance
end


function UnitTechnologySingletonFactory.new()
    local self = setmetatable({}, UnitTechnologySingletonFactory)
    self:_init_fields()
    return self
end


function UnitTechnologySingletonFactory:init()
        self:setDamage(0)
        self:setHealth(0)
        self:setReload(0)
        self:setRepair(0)
        self:setSpeed(0)
end


function UnitTechnologySingletonFactory:getDamage()
        return self.damage
end


function UnitTechnologySingletonFactory:setDamage(damage)
        self.damage = damage
end


function UnitTechnologySingletonFactory:getHealth()
        return self.health
end


function UnitTechnologySingletonFactory:setHealth(health)
        self.health = health
end


function UnitTechnologySingletonFactory:getReload()
        return self.reload
end


function UnitTechnologySingletonFactory:setReload(reload)
        self.reload = reload
end


function UnitTechnologySingletonFactory:getRepair()
        return self.repair
end


function UnitTechnologySingletonFactory:setRepair(repair)
        self.repair = repair
end


function UnitTechnologySingletonFactory:getSpeed()
        return self.speed
end


function UnitTechnologySingletonFactory:setSpeed(speed)
        self.speed = speed
end

UnitTechnologySingletonFactory.instance = UnitTechnologySingletonFactory.new()

return UnitTechnologySingletonFactory

