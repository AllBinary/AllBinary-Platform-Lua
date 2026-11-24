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
-- package org.allbinary.logic.java

local PrimitiveArrayToString = {}
package.loaded["org.allbinary.logic.java.PrimitiveArrayToString"] = PrimitiveArrayToString

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table PrimitiveArrayToString is declared before the requires
PrimitiveArrayToString.__index = PrimitiveArrayToString
PrimitiveArrayToString.className = "PrimitiveArrayToString"
PrimitiveArrayToString.javaClassName = "org.allbinary.logic.java.PrimitiveArrayToString"

function PrimitiveArrayToString._jinit(self)
    return self
end

function PrimitiveArrayToString.new()
    return PrimitiveArrayToString._jinit(setmetatable({}, PrimitiveArrayToString))
end


function PrimitiveArrayToString.toString(floats)
        local stringBuffer = StringMaker.new()
        for index = 0, (floats.n or #floats) - 1 do
            stringBuffer:appendfloat(floats[index + 1])
        end
        return tostring(stringBuffer)
end

return PrimitiveArrayToString

