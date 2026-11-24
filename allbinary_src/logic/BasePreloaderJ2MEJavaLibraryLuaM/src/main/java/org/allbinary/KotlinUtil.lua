-- Generated Code Do Not Modify
-- package org.allbinary

local KotlinUtil = {}
package.loaded["org.allbinary.KotlinUtil"] = KotlinUtil

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table KotlinUtil is declared before the requires
KotlinUtil.__index = KotlinUtil
KotlinUtil.className = "KotlinUtil"
KotlinUtil.javaClassName = "org.allbinary.KotlinUtil"

function KotlinUtil._jinit(self)
    return self
end

function KotlinUtil.new()
    return KotlinUtil._jinit(setmetatable({}, KotlinUtil))
end


function KotlinUtil.isKotlin()
        return false
end


function KotlinUtil.getShortName()
        return StringUtil.getInstance().EMPTY_STRING
end

return KotlinUtil

