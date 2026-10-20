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

local Aggression = {}
Aggression.__index = Aggression
Aggression.className = "Aggression"

function Aggression:_init_fields()
    self.ram = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.projectile = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.drops = SmallIntegerSingletonFactory.getInstance():getAt(0)
end


function Aggression.new(ram, projectile, drops)
    local self = setmetatable({}, Aggression)
    self:_init_fields()
        self:setRam(ram)
        self:setProjectile(projectile)
        self:setDrops(drops)
    return self
end


function Aggression:getRam()
        return self.ram
end


function Aggression:setRam(ram)
        self.ram = ram
end


function Aggression:getProjectile()
        return self.projectile
end


function Aggression:setProjectile(projectile)
        self.projectile = projectile
end


function Aggression:getDrops()
        return self.drops
end


function Aggression:setDrops(drops)
        self.drops = drops
end

return Aggression

