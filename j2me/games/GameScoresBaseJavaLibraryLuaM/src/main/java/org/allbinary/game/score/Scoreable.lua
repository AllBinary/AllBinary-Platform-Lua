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
-- package org.allbinary.game.score

local Scoreable = {}
package.loaded["org.allbinary.game.score.Scoreable"] = Scoreable

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
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")

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

-- class table Scoreable is declared before the requires
Scoreable.__index = Scoreable
Scoreable.className = "Scoreable"
Scoreable.javaClassName = "org.allbinary.game.score.Scoreable"
Scoreable.java_implements = " ScoreableInterface "
Scoreable.java_interfaces = function() return {ScoreableInterface} end

function Scoreable:_init_fields()
    if self.points == nil then self.points = nil end
end


function Scoreable._jinit(self, points)
    Scoreable._init_fields(self)
        self.points = points
    return self
end

function Scoreable.new(...)
    local self = setmetatable({}, Scoreable)
    Scoreable._jinit(self, ...)
    return self
end


function Scoreable:addPoints(points)
        self.points = self.points + (points)
end


function Scoreable:removePoints(points)
        self.points = self.points - (points)
end


function Scoreable:setPoints(points)
        self.points = points
end


function Scoreable:getPoints()
        return self.points
end

Scoreable.ID = SmallIntegerSingletonFactory.getInstance():getAt(3)

return Scoreable

