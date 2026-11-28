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
-- package org.allbinary.media.image.cache

local BufferedImageInfoFactory = {}
package.loaded["org.allbinary.media.image.cache.BufferedImageInfoFactory"] = BufferedImageInfoFactory

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

local HashMap = java_lazy("java.util.HashMap")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BufferedImageInfo = java_lazy("org.allbinary.media.image.cache.BufferedImageInfo")

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

-- class table BufferedImageInfoFactory is declared before the requires
BufferedImageInfoFactory.__index = BufferedImageInfoFactory
BufferedImageInfoFactory.className = "BufferedImageInfoFactory"
BufferedImageInfoFactory.javaClassName = "org.allbinary.media.image.cache.BufferedImageInfoFactory"


function BufferedImageInfoFactory._jinit(self)
    return self
end

function BufferedImageInfoFactory.new(...)
    local self = setmetatable({}, BufferedImageInfoFactory)
    BufferedImageInfoFactory._jinit(self, ...)
    return self
end


function BufferedImageInfoFactory.getInstance(width, height, type)
        local stringbuffer = StringMaker.new()
        stringbuffer:appendint(width)
        stringbuffer:appendint(height)
        stringbuffer:appendint(type)
        local key = tostring(stringbuffer)
        local bufferedImageInfo = BufferedImageInfoFactory.hashMap:get(key)
        if rawequal(bufferedImageInfo, nil) then
            bufferedImageInfo = BufferedImageInfo.new(width, height, type)
            BufferedImageInfoFactory.hashMap:put(key, bufferedImageInfo)
        end
        return bufferedImageInfo
end

BufferedImageInfoFactory.hashMap = StdUtil.getInstance():createHashMap()

return BufferedImageInfoFactory

