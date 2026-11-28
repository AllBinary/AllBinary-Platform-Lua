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

local MathVector = {}
package.loaded["org.allbinary.logic.math.vector.MathVector"] = MathVector

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

local BasicDecimal = java_lazy("org.allbinary.logic.math.BasicDecimal")
local MathVectorInterface = require("org.allbinary.logic.math.vector.MathVectorInterface")

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

-- class table MathVector is declared before the requires
MathVector.__index = MathVector
MathVector.className = "MathVector"
MathVector.javaClassName = "org.allbinary.logic.math.vector.MathVector"
MathVector.java_implements = " MathVectorInterface "
MathVector.java_interfaces = function() return {MathVectorInterface} end

function MathVector:_init_fields()
    if self.magnitudeBasicDecimal == nil then self.magnitudeBasicDecimal = nil end
    if self.direction == nil then self.direction = 0 end
    if self.resultBasicDecimal == nil then self.resultBasicDecimal = nil end
end


function MathVector._jinit(self, magnitudeBasicDecimal, direction)
    MathVector._init_fields(self)
        self.magnitudeBasicDecimal = magnitudeBasicDecimal
        self.direction = direction
    return self
end

function MathVector.new(...)
    local self = setmetatable({}, MathVector)
    MathVector._jinit(self, ...)
    return self
end


function MathVector:getMagnitude()
        return self.magnitudeBasicDecimal
end


function MathVector:getDirection()
        return self.direction
end


function MathVector:getResult()
        return self.resultBasicDecimal
end

return MathVector

