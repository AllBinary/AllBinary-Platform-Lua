-- Generated Code Do Not Modify

local Assertions = require("org.junit.jupiter.api.Assertions")
local DisplayName = require("org.junit.jupiter.api.DisplayName")
local Test = require("org.junit.jupiter.api.Test")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AppTest = {}
AppTest.__index = AppTest
AppTest.className = "AppTest"

function AppTest.new()
    local self = setmetatable({}, AppTest)
    return self
end


function AppTest:testAddition()
        Assertions.assertEquals(2, 1 + 1)
end


function AppTest:testStringEquality()
        local expected = "Hello World!"
        local actual = "Hello World!"
        Assertions.assertEquals(expected, actual)
end


function AppTest:testBooleanAssertions()
        Assertions.assertTrue(true)
        Assertions.assertFalse(false)
end

return AppTest

