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

local PointHelper = {}
package.loaded["org.allbinary.input.automation.PointHelper"] = PointHelper

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
-- local Rectangle = require("java.awt.Rectangle")
local PointFactory = java_lazy("org.allbinary.input.automation.PointFactory")

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

-- class table PointHelper is declared before the requires
PointHelper.__index = PointHelper
PointHelper.className = "PointHelper"
PointHelper.javaClassName = "org.allbinary.input.automation.PointHelper"


function PointHelper._jinit(self)
    return self
end

function PointHelper.new(...)
    local self = setmetatable({}, PointHelper)
    PointHelper._jinit(self, ...)
    return self
end


function PointHelper.getCenterPoint(rectangle)
        local x = rectangle:getX() + rectangle:getWidth() / PointHelper.two
        local y = rectangle:getY() + rectangle:getHeight() / PointHelper.two
        return PointFactory.getInstance(java_int(x), java_int(y))
end

PointHelper.two = 2.0

return PointHelper

