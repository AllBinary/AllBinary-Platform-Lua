-- Generated Code Do Not Modify

local BooleanTest = {}
package.loaded["BooleanTest"] = BooleanTest

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

-- class table BooleanTest is declared before the requires
BooleanTest.__index = BooleanTest
BooleanTest.className = "BooleanTest"
BooleanTest.javaClassName = "BooleanTest"

function BooleanTest._jinit(self)
    return self
end

function BooleanTest.new()
    return BooleanTest._jinit(setmetatable({}, BooleanTest))
end

return BooleanTest

