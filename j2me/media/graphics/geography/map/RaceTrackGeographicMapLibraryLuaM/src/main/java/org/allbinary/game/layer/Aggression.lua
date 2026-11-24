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

local Aggression = {}
package.loaded["org.allbinary.game.layer.Aggression"] = Aggression

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

local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")

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

-- class table Aggression is declared before the requires
Aggression.__index = Aggression
Aggression.className = "Aggression"
Aggression.javaClassName = "org.allbinary.game.layer.Aggression"

function Aggression:_init_fields()
    self.ram = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.projectile = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.drops = SmallIntegerSingletonFactory.getInstance():getAt(0)
end


function Aggression._jinit(self, ram, projectile, drops)
    Aggression._init_fields(self)
        self:setRam(ram)
        self:setProjectile(projectile)
        self:setDrops(drops)
    return self
end

function Aggression.new(...)
    local self = setmetatable({}, Aggression)
    Aggression._jinit(self, ...)
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

