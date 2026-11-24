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

local Driver = {}
package.loaded["org.allbinary.game.layer.Driver"] = Driver

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
local Aggression = java_lazy("org.allbinary.game.layer.Aggression")

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

-- class table Driver is declared before the requires
Driver.__index = Driver
Driver.className = "Driver"
Driver.javaClassName = "org.allbinary.game.layer.Driver"

function Driver:_init_fields()
    self.turnSpeed = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.trackPathSelectionSkill = SmallIntegerSingletonFactory.getInstance():getAt(0)
    if self.aggression == nil then self.aggression = nil end
end


function Driver._jinit(self, turnSpeed, trackPathSelectionSkill, aggression)
    Driver._init_fields(self)
        self:setTurnSpeed(turnSpeed)
        self:setTrackPathSelectionSkill(trackPathSelectionSkill)
        self.aggression = aggression
    return self
end

function Driver.new(...)
    local self = setmetatable({}, Driver)
    Driver._jinit(self, ...)
    return self
end


function Driver:getTurnSpeed()
        return self.turnSpeed
end


function Driver:setTurnSpeed(turnSpeed)
        self.turnSpeed = turnSpeed
end


function Driver:getTrackPathSelectionSkill()
        return self.trackPathSelectionSkill
end


function Driver:setTrackPathSelectionSkill(trackPathSelectionSkill)
        self.trackPathSelectionSkill = trackPathSelectionSkill
end


function Driver:getAggression()
        return self.aggression
end


function Driver:setAggression(aggression)
        self.aggression = aggression
end

Driver.NULL_DRIVER = Driver.new(SmallIntegerSingletonFactory.getInstance():getAt(0), SmallIntegerSingletonFactory.getInstance():getAt(0), Aggression.new(SmallIntegerSingletonFactory.getInstance():getAt(0), SmallIntegerSingletonFactory.getInstance():getAt(0), SmallIntegerSingletonFactory.getInstance():getAt(0)))

return Driver

