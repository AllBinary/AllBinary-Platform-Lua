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
-- package org.allbinary.media.audio

local BaseSoundsFactory = {}
package.loaded["org.allbinary.media.audio.BaseSoundsFactory"] = BaseSoundsFactory

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

local SoundsFactoryInterface = require("org.allbinary.media.audio.SoundsFactoryInterface")
local Sound = java_lazy("org.allbinary.media.audio.Sound")

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

-- class table BaseSoundsFactory is declared before the requires
BaseSoundsFactory.__index = BaseSoundsFactory
BaseSoundsFactory.className = "BaseSoundsFactory"
BaseSoundsFactory.javaClassName = "org.allbinary.media.audio.BaseSoundsFactory"
BaseSoundsFactory.java_implements = " SoundsFactoryInterface "
BaseSoundsFactory.java_interfaces = function() return {SoundsFactoryInterface} end

function BaseSoundsFactory:_init_fields()
    if self.initialized == nil then self.initialized = false end
end

function BaseSoundsFactory._jinit(self)
    BaseSoundsFactory._init_fields(self)
    return self
end

function BaseSoundsFactory.new()
    return BaseSoundsFactory._jinit(setmetatable({}, BaseSoundsFactory))
end


function BaseSoundsFactory:init()
end


-- throws Exception
function BaseSoundsFactory:getSoundInterfaceArray()
        return java_new_array(nil, 0)
end


function BaseSoundsFactory:setInitialized(initialized)
        self.initialized = initialized
end


function BaseSoundsFactory:isInitialized()
        return self.initialized
end

return BaseSoundsFactory

