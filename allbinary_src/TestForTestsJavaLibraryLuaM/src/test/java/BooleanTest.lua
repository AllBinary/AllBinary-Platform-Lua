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

local BooleanTest = {}
BooleanTest.__index = BooleanTest
BooleanTest.className = "BooleanTest"

function BooleanTest.new()
    local self = setmetatable({}, BooleanTest)
    return self
end

return BooleanTest

