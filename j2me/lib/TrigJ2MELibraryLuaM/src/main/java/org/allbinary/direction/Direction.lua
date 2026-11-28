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

local Direction = {}
package.loaded["org.allbinary.direction.Direction"] = Direction

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

-- class table Direction is declared before the requires
Direction.__index = Direction
Direction.className = "Direction"
Direction.javaClassName = "org.allbinary.direction.Direction"

function Direction:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.otherName == nil then self.otherName = nil end
    if self.value == nil then self.value = 0 end
    if self.frameFactor == nil then self.frameFactor = 0 end
end


function Direction._jinit(self, name, otherName, value, frameFactor)
    Direction._init_fields(self)
        self.name_f = name
        self.otherName = otherName
        self.value = value
        self.frameFactor = frameFactor
        Direction.directionArray[value + 1] = self
    return self
end

function Direction.new(...)
    local self = setmetatable({}, Direction)
    Direction._jinit(self, ...)
    return self
end


function Direction.getInstance(direction)
        return Direction.directionArray[direction + 1]
end


function Direction:getValue()
        return self.value
end


function Direction:getFrameFactor()
        return self.frameFactor
end


function Direction:getOtherName()
        return self.otherName
end


function Direction:getName()
        return self.name_f
end


function Direction:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Direction: ")
        stringBuffer:append(self:getName())
        stringBuffer:append(" Or: ")
        stringBuffer:append(self:getOtherName())
        stringBuffer:append(" Value: ")
        stringBuffer:appendint(self.value)
        return tostring(stringBuffer)
end
Direction.__tostring = function(self) return self:toString() end

Direction.directionArray = java_new_array(nil, 13)

return Direction

