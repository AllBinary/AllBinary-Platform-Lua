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

-- local Calendar = require("java.util.Calendar")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimeUtil = {}
TimeUtil.__index = TimeUtil
TimeUtil.className = "TimeUtil"

function TimeUtil.new()
    local self = setmetatable({}, TimeUtil)
    return self
end


function TimeUtil.getInstance()
        return TimeUtil.instance
end


function TimeUtil:setCalendar(calendar, yearString, monthString, dayString, hourString)
        local year = math.tointeger(yearString // 1)
        local month = math.tointeger(monthString // 1)
        local day = math.tointeger(dayString // 1)
        local hour = math.tointeger(hourString // 1)
        calendar:set(year, month, day, hour, 0)
end


-- Java overloaded method: Lua keeps the last definition
function TimeUtil:setCalendar(calendar, yearString, monthString, dayString, hourString, minuteString, secondString)
        local year = math.tointeger(yearString // 1)
        local month = math.tointeger(monthString // 1)
        local day = math.tointeger(dayString // 1)
        local hour = math.tointeger(hourString // 1)
        local minute = math.tointeger(minuteString // 1)
        local second = math.tointeger(secondString // 1)
        calendar:set(year, month, day, hour, minute, second)
end


function TimeUtil:setExpirationCalendar(calendar, yearsString, monthsString, daysString, hoursString, minutesString, secondsString)
        local year = calendar:get(Calendar.YEAR) + math.tointeger(yearsString // 1)
        local month = calendar:get(Calendar.MONTH) + math.tointeger(monthsString // 1)
        local day = calendar:get(Calendar.DAY_OF_MONTH) + math.tointeger(daysString // 1)
        local hour = calendar:get(Calendar.HOUR) + math.tointeger(hoursString // 1)
        local minute = calendar:get(Calendar.MINUTE) + math.tointeger(minutesString // 1)
        local second = calendar:get(Calendar.SECOND) + math.tointeger(secondsString // 1)
        calendar:set(year, month, day, hour, minute, second)
end


function TimeUtil:getTotalTime(yearString, monthString, dayString, hourString, minuteString, secondString)
        local time = TimeUtil.calendar:getTimeInMillis()
        self:setExpirationCalendar(TimeUtil.calendar, yearString, monthString, dayString, hourString, minuteString, secondString)
        local timeDelta = TimeUtil.calendar:getTimeInMillis()
        return timeDelta - time
end

TimeUtil.instance = TimeUtil.new()
TimeUtil.calendar = Calendar.getInstance()

return TimeUtil

