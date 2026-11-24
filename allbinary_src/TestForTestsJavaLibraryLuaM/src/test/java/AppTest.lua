-- Generated Code Do Not Modify

local AppTest = {}
package.loaded["AppTest"] = AppTest

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

local Assertions = java_lazy("org.junit.jupiter.api.Assertions")
local DisplayName = java_lazy("org.junit.jupiter.api.DisplayName")
local Test = java_lazy("org.junit.jupiter.api.Test")

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

-- class table AppTest is declared before the requires
AppTest.__index = AppTest
AppTest.className = "AppTest"
AppTest.javaClassName = "AppTest"

function AppTest._jinit(self)
    return self
end

function AppTest.new()
    return AppTest._jinit(setmetatable({}, AppTest))
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

