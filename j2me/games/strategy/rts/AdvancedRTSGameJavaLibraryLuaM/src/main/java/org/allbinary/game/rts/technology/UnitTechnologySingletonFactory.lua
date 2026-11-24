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

local UnitTechnologySingletonFactory = {}
package.loaded["org.allbinary.game.rts.technology.UnitTechnologySingletonFactory"] = UnitTechnologySingletonFactory

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

-- class table UnitTechnologySingletonFactory is declared before the requires
UnitTechnologySingletonFactory.__index = UnitTechnologySingletonFactory
UnitTechnologySingletonFactory.className = "UnitTechnologySingletonFactory"
UnitTechnologySingletonFactory.javaClassName = "org.allbinary.game.rts.technology.UnitTechnologySingletonFactory"

function UnitTechnologySingletonFactory:_init_fields()
    if self.damage == nil then self.damage = 0 end
    if self.health == nil then self.health = 0 end
    if self.reload == nil then self.reload = 0 end
    if self.repair == nil then self.repair = 0 end
    if self.speed == nil then self.speed = 0 end
end


function UnitTechnologySingletonFactory.getInstance()
        return UnitTechnologySingletonFactory.instance_f
end


function UnitTechnologySingletonFactory._jinit(self)
    UnitTechnologySingletonFactory._init_fields(self)
    return self
end

function UnitTechnologySingletonFactory.new(...)
    local self = setmetatable({}, UnitTechnologySingletonFactory)
    UnitTechnologySingletonFactory._jinit(self, ...)
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

UnitTechnologySingletonFactory.instance_f = UnitTechnologySingletonFactory.new()

return UnitTechnologySingletonFactory

