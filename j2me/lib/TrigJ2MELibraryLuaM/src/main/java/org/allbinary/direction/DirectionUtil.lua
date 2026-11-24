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
-- package org.allbinary.direction

local DirectionUtil = {}
package.loaded["org.allbinary.direction.DirectionUtil"] = DirectionUtil

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

local Angle = java_lazy("org.allbinary.math.Angle")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")

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

-- class table DirectionUtil is declared before the requires
DirectionUtil.__index = DirectionUtil
DirectionUtil.className = "DirectionUtil"
DirectionUtil.javaClassName = "org.allbinary.direction.DirectionUtil"

function DirectionUtil:_init_fields()
    self.directionArray = java_new_array(nil, 10)
    self.directionArray2 = java_new_array(nil, 10)
end


function DirectionUtil.getInstance()
        return DirectionUtil.instance_f
end


function DirectionUtil._jinit(self)
    DirectionUtil._init_fields(self)
        local angleFactory = AngleFactory.getInstance()
        local directionFactory = DirectionFactory.getInstance()
        self.directionArray[directionFactory.LEFT:getValue() + 1] = angleFactory.LEFT
        self.directionArray[directionFactory.RIGHT:getValue() + 1] = angleFactory.RIGHT
        self.directionArray[directionFactory.UP:getValue() + 1] = angleFactory.UP
        self.directionArray[directionFactory.DOWN:getValue() + 1] = angleFactory.DOWN
        self.directionArray2[directionFactory.LEFT:getValue() + 1] = angleFactory.LEFT
        self.directionArray2[directionFactory.RIGHT:getValue() + 1] = angleFactory.RIGHT
        self.directionArray2[directionFactory.UP:getValue() + 1] = angleFactory.UP
        self.directionArray2[directionFactory.DOWN:getValue() + 1] = angleFactory.DOWN
    return self
end

function DirectionUtil.new(...)
    local self = setmetatable({}, DirectionUtil)
    DirectionUtil._jinit(self, ...)
    return self
end


function DirectionUtil:getAngle(direction)
        return self.directionArray2[direction:getValue() + 1]
end


function DirectionUtil:getFrameAngle(direction)
        return self.directionArray[direction:getValue() + 1]
end

DirectionUtil.instance_f = DirectionUtil.new()

return DirectionUtil

