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
-- package org.allbinary.logic.math.vector

local AxisMathVectorUtil = {}
package.loaded["org.allbinary.logic.math.vector.AxisMathVectorUtil"] = AxisMathVectorUtil

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

local NoDecimalTrigTable = java_lazy("org.allbinary.math.NoDecimalTrigTable")

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

-- class table AxisMathVectorUtil is declared before the requires
AxisMathVectorUtil.__index = AxisMathVectorUtil
AxisMathVectorUtil.className = "AxisMathVectorUtil"
AxisMathVectorUtil.javaClassName = "org.allbinary.logic.math.vector.AxisMathVectorUtil"

function AxisMathVectorUtil:_init_fields()
    self.noDecimalTrigTable = NoDecimalTrigTable.getInstance()
end

function AxisMathVectorUtil._jinit(self)
    AxisMathVectorUtil._init_fields(self)
    return self
end

function AxisMathVectorUtil.new()
    return AxisMathVectorUtil._jinit(setmetatable({}, AxisMathVectorUtil))
end


function AxisMathVectorUtil.getInstance()
        return AxisMathVectorUtil.instance_f
end


function AxisMathVectorUtil:calculateX(magnitude, angle)
        return magnitude * self.noDecimalTrigTable:cos(angle) / 10
end


function AxisMathVectorUtil:calculateY(magnitude, angle)
        return magnitude * self.noDecimalTrigTable:sin(angle) / 10
end


function AxisMathVectorUtil:calculateZ(magnitude, otherAngle)
        return magnitude * self.noDecimalTrigTable:sin(otherAngle) / 10
end

AxisMathVectorUtil.instance_f = AxisMathVectorUtil.new()

return AxisMathVectorUtil

