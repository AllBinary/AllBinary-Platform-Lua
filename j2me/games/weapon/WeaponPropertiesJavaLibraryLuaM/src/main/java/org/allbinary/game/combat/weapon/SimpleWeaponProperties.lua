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

local SimpleWeaponProperties = {}
package.loaded["org.allbinary.game.combat.weapon.SimpleWeaponProperties"] = SimpleWeaponProperties

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table SimpleWeaponProperties is declared before the requires
SimpleWeaponProperties.__index = SimpleWeaponProperties
SimpleWeaponProperties.className = "SimpleWeaponProperties"
SimpleWeaponProperties.javaClassName = "org.allbinary.game.combat.weapon.SimpleWeaponProperties"

function SimpleWeaponProperties:_init_fields()
    if self.damage == nil then self.damage = 0 end
    if self.dissipation == nil then self.dissipation = 0 end
    if self.range == nil then self.range = 0 end
end

function SimpleWeaponProperties._jinit(self)
    SimpleWeaponProperties._init_fields(self)
    return self
end

function SimpleWeaponProperties.new()
    return SimpleWeaponProperties._jinit(setmetatable({}, SimpleWeaponProperties))
end


function SimpleWeaponProperties:set(simpleWeaponProperties)
        self:setDamage(simpleWeaponProperties:getDamage())
        self:setDissipation(simpleWeaponProperties:getDissipation())
        self:setRange(simpleWeaponProperties:getRange())
end


function SimpleWeaponProperties:setDamage(damage)
        self.damage = damage
end


function SimpleWeaponProperties:getDamage()
        return self.damage
end


function SimpleWeaponProperties:setDissipation(dissipation)
        self.dissipation = dissipation
end


function SimpleWeaponProperties:getDissipation()
        return self.dissipation
end


function SimpleWeaponProperties:getRange()
        return self.range
end


function SimpleWeaponProperties:setRange(range)
        self.range = range
end

return SimpleWeaponProperties

