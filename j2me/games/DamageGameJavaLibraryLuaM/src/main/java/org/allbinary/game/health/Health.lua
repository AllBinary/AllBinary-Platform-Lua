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
-- package org.allbinary.game.health

local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local HealthInterface = require("org.allbinary.game.health.HealthInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Health = {}
Health.__index = Health
Health.className = "Health"

function Health:_init_fields()
    self.health = 0
    self.maxHealth = 0
    self.healthListenerInterface = NullHealthListener.NULL_HEALTH_LISTENER
end


function Health.new(maxHealth)
    local self = setmetatable({}, Health)
    self:_init_fields()
        self:setMaxHealth(maxHealth)
        self:setHealth(maxHealth)
    return self
end


function Health:heal(ahealth)
        local newHealth = self:getHealth() + ahealth
        if newHealth > self:getMaxHealth() then
            self:setHealth(self:getMaxHealth())
        else
            self:setHealth(newHealth)
        end
end


function Health:healMax()
        self:setHealth(self:getMaxHealth())
end


function Health:isDamaged()
        if self:getHealth() ~= self:getMaxHealth() then
            return true
        else
            return false
        end
end


function Health:damage(ahealth)
        if ahealth < 0 then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("******* Trying to heal when damaging. Damage: ")
            stringBuffer:appendint(ahealth)
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            stringBuffer:append(tostring(self))
            ForcedLogUtil.log(tostring(stringBuffer), self)
            return
        end
        local health = self:getHealth() - ahealth
        self:setHealth(health)
end


function Health:isAlive()
        if self:getHealth() <= 0 then
            return false
        else
            return true
        end
end


function Health:getMaxHealth()
        return self.maxHealth
end


function Health:setMaxHealth(maxHealth)
        self.maxHealth = maxHealth
end


function Health:setHealth(health)
        if health > self:getMaxHealth() then
            self.health = self:getMaxHealth()
        elseif health < 0 then
            self.health = 0
        else
            self.health = health
        end
        if self.healthListenerInterface ~= nil then
            self.healthListenerInterface:onHealthChange()
        end
end


function Health:getHealth()
        return self.health
end


function Health:addListener(healthGraphic)
        self.healthListenerInterface = healthGraphic
end


function Health:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(Health.HEALTH_LABEL)
        stringBuffer:appendint(self.health)
        stringBuffer:append(Health.MAX_HEALTH_LABEL)
        stringBuffer:appendint(self.maxHealth)
        return tostring(stringBuffer)
end
Health.__tostring = function(self) return self:toString() end

Health.NULL_HEALTH = Health.new(0)
Health.NAME = "Health Resource"
Health.HEALTH_LABEL = "Health: "
Health.MAX_HEALTH_LABEL = " Max: "

return Health

