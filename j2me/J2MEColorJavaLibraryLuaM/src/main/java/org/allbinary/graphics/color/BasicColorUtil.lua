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
-- package org.allbinary.graphics.color

local BasicColorUtil = {}
package.loaded["org.allbinary.graphics.color.BasicColorUtil"] = BasicColorUtil

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

local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")

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

-- class table BasicColorUtil is declared before the requires
BasicColorUtil.__index = BasicColorUtil
BasicColorUtil.className = "BasicColorUtil"
BasicColorUtil.javaClassName = "org.allbinary.graphics.color.BasicColorUtil"

function BasicColorUtil:_init_fields()
    self.ZERO_ARRAY = java_new_array(nil, 0)
    self.ALPHA = (0xFF000000 - 0x100000000)
    self.isAlpha = true
    self.ffOpaque = true
end

function BasicColorUtil._jinit(self)
    BasicColorUtil._init_fields(self)
    return self
end

function BasicColorUtil.new()
    return BasicColorUtil._jinit(setmetatable({}, BasicColorUtil))
end


function BasicColorUtil.getInstance()
        return BasicColorUtil.instance_f
end


function BasicColorUtil:getRGB(red, green, blue)
        local value = 0
        if self.isAlpha then
            if self.ffOpaque then
                value = self.ALPHA
            end
        end
        value = (red << 16) | value
        value = (green << 8) | value
        value = blue | value
        return value
end


function BasicColorUtil:getARGB(alphaValue, r, g, b)
        return ((alphaValue << 24) & self.ALPHA) + ((r << 16) & 0x00FF0000) + ((g << 8) & 0x0000FF00) + (b & 0x000000FF)
end


function BasicColorUtil:get(alphaValue, color)
        return ((alphaValue << 24) & self.ALPHA) + color
end


function BasicColorUtil:invert(color)
        return (0xFFFFFF - color) | self.ALPHA
end

BasicColorUtil.instance_f = BasicColorUtil.new()

return BasicColorUtil

