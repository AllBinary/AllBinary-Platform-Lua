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
-- package org.allbinary.logic.math

local SmallLongFactory = {}
package.loaded["org.allbinary.logic.math.SmallLongFactory"] = SmallLongFactory

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

-- class table SmallLongFactory is declared before the requires
SmallLongFactory.__index = SmallLongFactory
SmallLongFactory.className = "SmallLongFactory"
SmallLongFactory.javaClassName = "org.allbinary.logic.math.SmallLongFactory"

function SmallLongFactory:_init_fields()
    self.NEGATIVE_MAX = 500
    self.POSITIVE_MAX = 0x2D1
    self.INTEGER_ARRAY = java_new_array(nil, self.NEGATIVE_MAX + self.POSITIVE_MAX)
    self.STRING_ARRAY = java_new_array(nil, self.NEGATIVE_MAX + self.POSITIVE_MAX)
    self.MIN = 0
    self.lastMin = 0
    self.lastNegativeMin = 0
end


function SmallLongFactory.getInstance()
        return SmallLongFactory.instance_f
end


function SmallLongFactory:initWithRange(value, negativeValue)
        for index = value - 1, self.lastMin, -1 do
            self.INTEGER_ARRAY[index + self.NEGATIVE_MAX + 1] = index
        end
        for index = negativeValue - 1, self.lastNegativeMin, -1 do
            self.INTEGER_ARRAY[index + 1] = -index
        end
        if self.lastMin < value then
            self.lastMin = value
            self.MIN = value
        end
        if self.lastNegativeMin < negativeValue then
            self.lastNegativeMin = negativeValue
        end
end


function SmallLongFactory:init()
        if self.INTEGER_ARRAY[1] == nil then
            if self.lastMin < self.POSITIVE_MAX or self.lastNegativeMin < self.NEGATIVE_MAX then
                for index = self.POSITIVE_MAX - 1, self.lastMin, -1 do
                    self.INTEGER_ARRAY[index + self.NEGATIVE_MAX + 1] = index
                end
                for index = self.NEGATIVE_MAX - 1, self.lastNegativeMin, -1 do
                    self.INTEGER_ARRAY[index + 1] = -index
                end
                self.lastMin = self.POSITIVE_MAX
                self.lastNegativeMin = self.NEGATIVE_MAX
            end
        end
end


function SmallLongFactory._jinit(self)
    SmallLongFactory._init_fields(self)
    return self
end

function SmallLongFactory.new(...)
    local self = setmetatable({}, SmallLongFactory)
    SmallLongFactory._jinit(self, ...)
    return self
end


function SmallLongFactory:getInstanceNoThrow(index)
        if index + self.NEGATIVE_MAX > (self.INTEGER_ARRAY.n or #self.INTEGER_ARRAY) - 1 then
            return self.INTEGER_ARRAY[-1 + self.NEGATIVE_MAX + 1]
        end
        return self.INTEGER_ARRAY[(index) + self.NEGATIVE_MAX + 1]
end


function SmallLongFactory:getString(index)
        local i = index + self.NEGATIVE_MAX
        if self.STRING_ARRAY[i + 1] == nil then
            self.STRING_ARRAY[i + 1] = tostring(self.INTEGER_ARRAY[i + 1])
        end
        return self.STRING_ARRAY[i + 1]
end

SmallLongFactory.instance_f = SmallLongFactory.new()

return SmallLongFactory

