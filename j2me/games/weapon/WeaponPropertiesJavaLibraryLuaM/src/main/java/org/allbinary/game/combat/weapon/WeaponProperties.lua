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
-- package org.allbinary.game.combat.weapon

local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local SimpleWeaponProperties = require("org.allbinary.game.combat.weapon.SimpleWeaponProperties")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeaponProperties = {}
WeaponProperties.__index = WeaponProperties
WeaponProperties.className = "WeaponProperties"
setmetatable(WeaponProperties, {__index = SimpleWeaponProperties})

function WeaponProperties:_init_fields()
    self.reloadTime = 0
    self.targetingTime = 0
    self.speed = BasicDecimal.ZERO_BIGDECIMAL
    self.MAX = 10240
    self.ZERO = 0
end


function WeaponProperties.new(reloadTime, targetingTime, speed, damage, dissipation)
    local self = setmetatable(SimpleWeaponProperties.new(), WeaponProperties)
    self:_init_fields()
        if speed < self.MAX and speed ~= 0 and not WeaponProperties.messageSent then
            local MESSAGE = "Danger Danger Danger: Speed probably to slow if using 1 degree calculations as velocity for a single axis could be below 1024: "
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.put(tostring(StringMaker.new():append(MESSAGE):appendlong(speed)), self, commonStrings.CONSTRUCTOR)
            WeaponProperties.messageSent = true
        end
        self:setReloadTime(reloadTime)
        self:setTargetingTime(targetingTime)
        self:setDamage(damage)
        self:setDissipation(dissipation)
        self:setSpeed(BasicDecimal.new(speed))
        if dissipation ~= self.ZERO then
            local unscaledDamage = self.speed:getUnscaled() * damage
            local scaledDissipation = dissipation * self.speed:getScaledFactorValue()
            local value = (java_idiv(unscaledDamage, scaledDissipation))
            self:setRange(java_idiv((value * 9), 10))
        end
    return self
end


function WeaponProperties:setReloadTime(reloadTime)
        self.reloadTime = reloadTime
end


function WeaponProperties:getReloadTime()
        return self.reloadTime
end


function WeaponProperties:setTargetingTime(targetingTime)
        self.targetingTime = targetingTime
end


function WeaponProperties:getTargetingTime()
        return self.targetingTime
end


function WeaponProperties:getSpeed()
        return self.speed
end


function WeaponProperties:setSpeed(speed)
        self.speed = speed
end


function WeaponProperties:getDamageI(range)
        return self:getDamage() - ((self:getDissipation() * range) / self.speed:getScaled())
end


function WeaponProperties:toStringArray()
        local index = 0
        local stringArray = java_new_array(nil, 3)
        local stringBuffer = StringMaker.new()
        stringArray[(function() local value = index index = value + 1 return value end)() + 1] = tostring(stringBuffer:append(WeaponProperties.DAMAGE):appendint(java_int(self:getDamage())))
        stringBuffer:delete(0, stringBuffer:length())
        stringArray[(function() local value = index index = value + 1 return value end)() + 1] = tostring(stringBuffer:append(WeaponProperties.RANGE):appendint(java_int(self:getRange())))
        stringBuffer:delete(0, stringBuffer:length())
        stringArray[(function() local value = index index = value + 1 return value end)() + 1] = tostring(stringBuffer:append(WeaponProperties.RELOAD):appendlong(self:getReloadTime()))
        return stringArray
end


function WeaponProperties:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(WeaponProperties.DAMAGE):appendint(java_int(self:getDamage()))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(WeaponProperties.RANGE):appendint(java_int(self:getRange()))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(WeaponProperties.RELOAD):appendlong(self:getReloadTime())
        return tostring(stringBuffer)
end
WeaponProperties.__tostring = function(self) return self:toString() end

WeaponProperties.NULL_WEAPON_PROPERTIES = WeaponProperties.new(0, 0, 0, 0, 0)
WeaponProperties.messageSent = false
WeaponProperties.DAMAGE = "Damage: "
WeaponProperties.RANGE = "Range: "
WeaponProperties.RELOAD = "Reload: "

return WeaponProperties

