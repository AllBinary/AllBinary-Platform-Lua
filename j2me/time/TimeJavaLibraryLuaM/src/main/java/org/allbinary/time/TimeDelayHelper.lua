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
-- package org.allbinary.time

local TimeDelayHelper = {}
package.loaded["org.allbinary.time.TimeDelayHelper"] = TimeDelayHelper

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")

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

-- class table TimeDelayHelper is declared before the requires
TimeDelayHelper.__index = TimeDelayHelper
TimeDelayHelper.className = "TimeDelayHelper"
TimeDelayHelper.javaClassName = "org.allbinary.time.TimeDelayHelper"

function TimeDelayHelper:_init_fields()
    self.startTime = -1
    self.elapsedTimeAtPause = require("java.lang.Long").MIN_VALUE
    if self.delay == nil then self.delay = 0 end
end


function TimeDelayHelper._jinit(self, delay)
    TimeDelayHelper._init_fields(self)
        self.delay = delay
        self:setStartTimeTNT()
    return self
end

function TimeDelayHelper.new(...)
    local self = setmetatable({}, TimeDelayHelper)
    TimeDelayHelper._jinit(self, ...)
    return self
end


function TimeDelayHelper:isTimeTNT()
        local currentTime = math.floor(os.time() * 1000)
        if currentTime - self.startTime > self.delay then
            self.startTime = currentTime
            return true
        end
        return false
end


function TimeDelayHelper:isTimeSinceTNT(delay)
        local currentTime = math.floor(os.time() * 1000)
        if currentTime - self.startTime > delay then
            self.startTime = currentTime
            return true
        end
        return false
end


function TimeDelayHelper:isTime(currentTime)
        if currentTime - self.startTime > self.delay then
            self.startTime = currentTime
            return true
        end
        return false
end


function TimeDelayHelper:isTimeWithoutReset(currentTime)
        if currentTime - self.startTime > self.delay then
            return true
        end
        return false
end


function TimeDelayHelper:isTimeSince(delay, currentTime)
        if currentTime - self.startTime > self.delay then
            self.startTime = currentTime
            return true
        end
        return false
end


function TimeDelayHelper:getElapsedTNT()
        return math.floor(os.time() * 1000) - self.startTime
end


function TimeDelayHelper:getElapsed(currentTime)
        return currentTime - self.startTime
end


function TimeDelayHelper:isElapsed(currentTime, time)
        if self:getElapsed(currentTime) > time then
            return true
        else
            return false
        end
end


function TimeDelayHelper:isElapsedTNT(time)
        if self:getElapsedTNT() > time then
            return true
        else
            return false
        end
end


function TimeDelayHelper:setStartTime(startTime)
        self.startTime = startTime
end


function TimeDelayHelper:getStartTime()
        return self.startTime
end


function TimeDelayHelper:setStartTimeTNT()
        self.startTime = math.floor(os.time() * 1000)
end


function TimeDelayHelper:pause()
        self.elapsedTimeAtPause = self:getElapsedTNT()
        self.startTime = require("java.lang.Long").MAX_VALUE
end


function TimeDelayHelper:resume()
        if not rawequal(self.elapsedTimeAtPause, require("java.lang.Long").MIN_VALUE) then
            self.startTime = math.floor(os.time() * 1000) + self.elapsedTimeAtPause
            self.elapsedTimeAtPause = require("java.lang.Long").MIN_VALUE
            self:setStartTimeTNT()
            return true
        end
        return false
end


function TimeDelayHelper:toStringAt(currentTime)
        local elapsed = self:getElapsed(currentTime)
        if elapsed > 0 then
            local commonLabels = CommonLabels.getInstance()
            local elapsedAsString = tostring(elapsed)
            return tostring(StringMaker.new():append(commonLabels.START):appendlong(self.startTime):append(commonLabels.CURRENT):appendlong(currentTime):append(commonLabels.ELAPSED):append(elapsedAsString))
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end


function TimeDelayHelper:toString()
        local currentTime = math.floor(os.time() * 1000)
        local elapsed = self:getElapsed(currentTime)
        if elapsed > 0 then
            local commonLabels = CommonLabels.getInstance()
            local elapsedAsString = tostring(elapsed)
            return tostring(StringMaker.new():append(commonLabels.START):appendlong(self.startTime):append(commonLabels.CURRENT):appendlong(currentTime):append(commonLabels.ELAPSED):append(elapsedAsString))
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end
TimeDelayHelper.__tostring = function(self) return self:toString() end

return TimeDelayHelper

