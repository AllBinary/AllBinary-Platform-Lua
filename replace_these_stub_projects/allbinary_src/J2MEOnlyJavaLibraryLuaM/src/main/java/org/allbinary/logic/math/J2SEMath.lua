-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.logic.math

local J2SEMath = {}
package.loaded["org.allbinary.logic.math.J2SEMath"] = J2SEMath

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

-- class table J2SEMath is declared before the requires
J2SEMath.__index = J2SEMath
J2SEMath.className = "J2SEMath"
J2SEMath.javaClassName = "org.allbinary.logic.math.J2SEMath"

function J2SEMath._jinit(self)
    return self
end

function J2SEMath.new()
    return J2SEMath._jinit(setmetatable({}, J2SEMath))
end


function J2SEMath.getInstance()
        return J2SEMath.instance_f
end


function J2SEMath:round(value)
        return java_int(value)
end


function J2SEMath:abs(value)
        return (function() if (value < 0.0) then return -value else return value end end)()
end


function J2SEMath:absdouble(value)
        return (function() if (value < 0.0) then return -value else return value end end)()
end

J2SEMath.instance_f = J2SEMath.new()

return J2SEMath

