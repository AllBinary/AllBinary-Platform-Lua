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
-- package org.allbinary.math

local DistanceUtil = {}
package.loaded["org.allbinary.math.DistanceUtil"] = DistanceUtil

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

local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")

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

-- class table DistanceUtil is declared before the requires
DistanceUtil.__index = DistanceUtil
DistanceUtil.className = "DistanceUtil"
DistanceUtil.javaClassName = "org.allbinary.math.DistanceUtil"

function DistanceUtil:_init_fields()
    self.mathUtil = MathUtil.getInstance()
end

function DistanceUtil._jinit(self)
    DistanceUtil._init_fields(self)
    return self
end

function DistanceUtil.new()
    return DistanceUtil._jinit(setmetatable({}, DistanceUtil))
end


function DistanceUtil.getInstance()
        return DistanceUtil.instance_f
end


function DistanceUtil:getDistance(x1, y1, x2, y2)
        local dx = x1 - x2
        local dy = y1 - y2
        return java_int(self.mathUtil:sqrt((dx * dx) + (dy * dy)))
end

DistanceUtil.instance_f = DistanceUtil.new()

return DistanceUtil

