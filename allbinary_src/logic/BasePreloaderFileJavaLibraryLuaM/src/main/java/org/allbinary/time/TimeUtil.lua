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

local TimeUtil = {}
package.loaded["org.allbinary.time.TimeUtil"] = TimeUtil

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

local Calendar = java_lazy("java.util.Calendar")

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

-- class table TimeUtil is declared before the requires
TimeUtil.__index = TimeUtil
TimeUtil.className = "TimeUtil"
TimeUtil.javaClassName = "org.allbinary.time.TimeUtil"

function TimeUtil._jinit(self)
    return self
end

function TimeUtil.new()
    return TimeUtil._jinit(setmetatable({}, TimeUtil))
end


function TimeUtil.getInstance()
        return TimeUtil.instance_f
end


function TimeUtil:setCalendar(calendar, yearString, monthString, dayString, hourString)
        local year = math.tointeger(yearString // 1)
        local month = math.tointeger(monthString // 1)
        local day = math.tointeger(dayString // 1)
        local hour = math.tointeger(hourString // 1)
        calendar:set(year, month, day, hour, 0)
end


function TimeUtil:setCalendarWithTime(calendar, yearString, monthString, dayString, hourString, minuteString, secondString)
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

TimeUtil.instance_f = TimeUtil.new()
TimeUtil.calendar = Calendar.getInstance()

return TimeUtil

