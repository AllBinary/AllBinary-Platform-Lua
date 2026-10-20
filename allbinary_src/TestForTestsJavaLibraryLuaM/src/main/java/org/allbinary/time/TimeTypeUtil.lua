-- Generated Code Do Not Modify
-- package org.allbinary.time

-- local Calendar = require("java.util.Calendar")
-- local TimeZone = require("java.util.TimeZone")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimeTypeUtil = {}
TimeTypeUtil.__index = TimeTypeUtil
TimeTypeUtil.className = "TimeTypeUtil"

function TimeTypeUtil:_init_fields()
    self.NIGHT = "Night"
    self.DAY = "Day"
end

function TimeTypeUtil.new()
    local self = setmetatable({}, TimeTypeUtil)
    self:_init_fields()
    return self
end


function TimeTypeUtil.getInstance()
        return TimeTypeUtil.instance
end


function TimeTypeUtil:isNight()
        local hoursOfDay = self:getHourOfDay()
        return hoursOfDay < 6 or hoursOfDay > 18
end


function TimeTypeUtil:getHourOfDay()
        local calendar = Calendar.getInstance()
        return calendar:get(Calendar.HOUR_OF_DAY)
end


function TimeTypeUtil:getNightOrDay()
        return (function() if self:isNight() then return self.NIGHT else return self.DAY end end)()
end


-- Java overloaded method: Lua keeps the last definition
function TimeTypeUtil:getHourOfDay(timeInMillis)
        local calendar = Calendar.getInstance()
        calendar:setTimeInMillis(timeInMillis)
        return calendar:get(Calendar.HOUR_OF_DAY)
end


-- Java overloaded method: Lua keeps the last definition
function TimeTypeUtil:isNight(timeInMillis)
        local hoursOfDay = self:getHourOfDay(timeInMillis)
        return hoursOfDay < 6 or hoursOfDay > 18
end


-- Java overloaded method: Lua keeps the last definition
function TimeTypeUtil:getNightOrDay(timeInMillis)
        return (function() if self:isNight(timeInMillis) then return self.NIGHT else return self.DAY end end)()
end

TimeTypeUtil.instance = TimeTypeUtil.new()

return TimeTypeUtil

