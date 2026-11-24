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

local HudTimer = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.time.HudTimer"] = HudTimer

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

local PrimitiveLongSingleton = java_lazy("org.allbinary.logic.math.PrimitiveLongSingleton")
local PrimitiveLongUtil = java_lazy("org.allbinary.logic.math.PrimitiveLongUtil")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")

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

-- class table HudTimer is declared before the requires
HudTimer.__index = HudTimer
HudTimer.className = "HudTimer"
HudTimer.javaClassName = "org.allbinary.game.ag.layer.hud.basic.time.HudTimer"

function HudTimer:_init_fields()
    self.startTime = -1
    if self.hundredthTime == nil then self.hundredthTime = 0 end
    if self.maxTime == nil then self.maxTime = nil end
    if self.modifier == nil then self.modifier = 0 end
    self.hundrethsString = PrimitiveLongSingleton.getInstance().ZERO
    self.totalDigits = 1
    if self.primitiveLongUtil == nil then self.primitiveLongUtil = nil end
    self.MAX = {"L", "O", "L"}
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
end


function HudTimer._jinit(self, maxTime)
    HudTimer._init_fields(self)
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(maxTime)
        self.maxTime = maxTime
    return self
end

function HudTimer.new(...)
    local self = setmetatable({}, HudTimer)
    HudTimer._jinit(self, ...)
    return self
end


function HudTimer:start()
        self.hundredthTime = 0
        self.startTime = self.gameTickTimeDelayHelper.startTime
end


function HudTimer:get()
        return self.hundredthTime
end


function HudTimer:update()
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


function HudTimer:reduce(value)
        self.modifier = self.modifier - (value)
end


function HudTimer:add(value)
        self.modifier = self.modifier + (value)
end


function HudTimer:getTimeChars()
        return self.hundrethsString
end


function HudTimer:getCurrentTotalDigits()
        return self.totalDigits
end

return HudTimer

