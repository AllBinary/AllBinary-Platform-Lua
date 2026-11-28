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
-- package org.allbinary.input.automation

local PointFactory = {}
package.loaded["org.allbinary.input.automation.PointFactory"] = PointFactory

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

-- local Point = require("java.awt.Point")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table PointFactory is declared before the requires
PointFactory.__index = PointFactory
PointFactory.className = "PointFactory"
PointFactory.javaClassName = "org.allbinary.input.automation.PointFactory"


function PointFactory._jinit(self)
    return self
end

function PointFactory.new(...)
    local self = setmetatable({}, PointFactory)
    PointFactory._jinit(self, ...)
    return self
end


function PointFactory.getInstance(x, y)
        local point = PointFactory.pointArray[x + 1][y + 1]
        if rawequal(point, nil) then
            PointFactory.pointArray[x + 1][y + 1] = Point.new(x, y)
            point = PointFactory.pointArray[x + 1][y + 1]
        end
        return point
end

PointFactory.pointArray = java_new_array(nil, 3000, 3000)

return PointFactory

