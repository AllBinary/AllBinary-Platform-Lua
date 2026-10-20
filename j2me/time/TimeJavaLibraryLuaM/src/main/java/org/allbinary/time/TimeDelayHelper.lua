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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimeDelayHelper = {}
TimeDelayHelper.__index = TimeDelayHelper
TimeDelayHelper.className = "TimeDelayHelper"

function TimeDelayHelper:_init_fields()
    self.startTime = -1
    self.elapsedTimeAtPause = Long.MIN_VALUE
    self.delay = nil
end


function TimeDelayHelper.new(delay)
    local self = setmetatable({}, TimeDelayHelper)
    self:_init_fields()
        self.delay = delay
        self:setStartTimeTNT()
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
        self.startTime = Long.MAX_VALUE
end


function TimeDelayHelper:resume()
        if self.elapsedTimeAtPause ~= Long.MIN_VALUE then
            self.startTime = math.floor(os.time() * 1000) + self.elapsedTimeAtPause
            self.elapsedTimeAtPause = Long.MIN_VALUE
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

