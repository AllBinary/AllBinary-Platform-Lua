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
-- package org.allbinary.game.ag.layer.hud.basic.time

local PrimitiveLongSingleton = require("org.allbinary.logic.math.PrimitiveLongSingleton")
local PrimitiveLongUtil = require("org.allbinary.logic.math.PrimitiveLongUtil")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Timer = {}
Timer.__index = Timer
Timer.className = "Timer"

function Timer:_init_fields()
    self.startTime = -1
    self.hundredthTime = 0
    self.maxTime = nil
    self.modifier = 0
    self.hundrethsString = PrimitiveLongSingleton.getInstance().ZERO
    self.totalDigits = 1
    self.primitiveLongUtil = nil
    self.MAX = {"L", "O", "L"}
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
end


function Timer.new(maxTime)
    local self = setmetatable({}, Timer)
    self:_init_fields()
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(maxTime)
        self.maxTime = maxTime
    return self
end


function Timer:start()
        self.hundredthTime = 0
        self.startTime = self.gameTickTimeDelayHelper.startTime
end


function Timer:get()
        return self.hundredthTime
end


function Timer:update()
        local lastLowerTime = self.hundredthTime
        local currentTime = ((self.modifier + self.gameTickTimeDelayHelper.startTime) - self.startTime)
        if currentTime < 0 then
            currentTime = 0
        end
        self.hundredthTime = java_idiv(currentTime, 100)
        if self.hundredthTime >= self.maxTime then
            if self.startTime > 0 then
                self.hundrethsString = self.MAX
            end
        elseif lastLowerTime ~= self.hundredthTime then
            self.hundrethsString = self.primitiveLongUtil:getCharArray(self.hundredthTime)
            self.totalDigits = self.primitiveLongUtil:getCurrentTotalDigits()
        end
end


function Timer:reduce(value)
        self.modifier = self.modifier - (value)
end


function Timer:add(value)
        self.modifier = self.modifier + (value)
end


function Timer:getTimeChars()
        return self.hundrethsString
end


function Timer:getCurrentTotalDigits()
        return self.totalDigits
end

return Timer

