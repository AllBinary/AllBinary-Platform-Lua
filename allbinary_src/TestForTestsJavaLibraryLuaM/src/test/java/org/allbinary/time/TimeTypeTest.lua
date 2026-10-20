-- Generated Code Do Not Modify
-- package org.allbinary.time

-- local Calendar = require("java.util.Calendar")
local Assertions = require("org.junit.jupiter.api.Assertions")
local DisplayName = require("org.junit.jupiter.api.DisplayName")
local Test = require("org.junit.jupiter.api.Test")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimeTypeTest = {}
TimeTypeTest.__index = TimeTypeTest
TimeTypeTest.className = "TimeTypeTest"
local TestableTimeTypeUtil = {}
    TestableTimeTypeUtil.__index = TestableTimeTypeUtil
    TestableTimeTypeUtil.className = "TestableTimeTypeUtil"
    setmetatable(TestableTimeTypeUtil, {__index = TimeTypeUtil})
    TimeTypeTest.TestableTimeTypeUtil = TestableTimeTypeUtil

    function TestableTimeTypeUtil:_init_fields()
        self.hour = nil
    end
    

    function TimeTypeTest.new(hour)
        local self = setmetatable(TimeTypeUtil.new(), TimeTypeTest)
        self:_init_fields()
            self.hour = hour
        return self
    end
    

    function TimeTypeTest:getHourOfDay()
            return self.hour
    end


function TimeTypeTest.new()
    local self = setmetatable({}, TimeTypeTest)
    return self
end


function TimeTypeTest.millisForHourLocal(hour)
        local cal = Calendar.getInstance()
        cal:set(Calendar.HOUR_OF_DAY, hour)
        cal:set(Calendar.MINUTE, 0)
        cal:set(Calendar.SECOND, 0)
        cal:set(Calendar.MILLISECOND, 0)
        return cal:getTimeInMillis()
end


function TimeTypeTest:isNight_returnsTrue_for_hours_less_than_6()
        --[[ Otherwise - statement - ForEachStmt ]]
end


function TimeTypeTest:isNight_returnsTrue_for_hours_greater_than_18()
        --[[ Otherwise - statement - ForEachStmt ]]
end


function TimeTypeTest:isNight_returnsFalse_for_boundary_hours_6_and_18()
        --[[ Otherwise - statement - ForEachStmt ]]
end


function TimeTypeTest:getNightOrDay_returns_expected_label()
        local nightUtil = TestableTimeTypeUtil.new(0)
        Assertions.assertEquals(nightUtil.NIGHT, nightUtil:getNightOrDay())
        local dayUtil = TestableTimeTypeUtil.new(12)
        Assertions.assertEquals(dayUtil.DAY, dayUtil:getNightOrDay())
end


function TimeTypeTest:getHourOfDay_long_converts_epoch_to_local_hour()
        local util = TimeTypeUtil.new()
        --[[ Otherwise - statement - ForEachStmt ]]
end


function TimeTypeTest:isNight_long_expected_ranges()
        local util = TimeTypeUtil.new()
        --[[ Otherwise - statement - ForEachStmt ]]
        --[[ Otherwise - statement - ForEachStmt ]]
end


function TimeTypeTest:getNightOrDay_long_consistency()
        local util = TimeTypeUtil.new()
        local nightMillis = TimeTypeTest.millisForHourLocal(0)
        local dayMillis = TimeTypeTest.millisForHourLocal(12)
        Assertions.assertEquals(util.NIGHT, util:getNightOrDay(nightMillis))
        Assertions.assertEquals(util.DAY, util:getNightOrDay(dayMillis))
end


function TimeTypeTest:boundaries_day_for_long_based_api()
        local util = TimeTypeUtil.new()
        --[[ Otherwise - statement - ForEachStmt ]]
end


function TimeTypeTest:constants_accessible_and_stable()
        local util = TimeTypeUtil.new()
        Assertions.assertEquals("Night", util.NIGHT)
        Assertions.assertEquals("Day", util.DAY)
end


function TimeTypeTest:getInstance_returns_same_singleton()
        local a = TimeTypeUtil.getInstance()
        local b = TimeTypeUtil.getInstance()
        Assertions.assertSame(a, b)
end

return TimeTypeTest

