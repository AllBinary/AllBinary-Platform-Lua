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
-- package org.allbinary.debug

local AndroidDebug = {}
package.loaded["org.allbinary.debug.AndroidDebug"] = AndroidDebug

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

local Debug = java_lazy("android.os.Debug")
local DebugInterface = require("org.allbinary.debug.DebugInterface")

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

-- class table AndroidDebug is declared before the requires
AndroidDebug.__index = AndroidDebug
AndroidDebug.className = "AndroidDebug"
AndroidDebug.javaClassName = "org.allbinary.debug.AndroidDebug"
AndroidDebug.java_implements = " DebugInterface "
AndroidDebug.java_interfaces = function() return {DebugInterface} end

function AndroidDebug:_init_fields()
    self.startTime = require("java.lang.Long").MAX_VALUE
    self.running = false
    self.bufferSize = 32 * 1024 * 1024
end

function AndroidDebug._jinit(self)
    AndroidDebug._init_fields(self)
    return self
end

function AndroidDebug.new()
    return AndroidDebug._jinit(setmetatable({}, AndroidDebug))
end


function AndroidDebug:start()
        self:setStartTime(math.floor(os.time() * 1000))
        Debug.startMethodTracing("trace", self.bufferSize)
        self:setRunning(true)
end


function AndroidDebug:stop()
        self.startTime = require("java.lang.Long").MAX_VALUE
        Debug.stopMethodTracing()
        self:setRunning(false)
end


function AndroidDebug:getMaxTime()
        return 120000
end


function AndroidDebug:setStartTime(startTime)
        self.startTime = startTime
end


function AndroidDebug:getStartTime()
        return self.startTime
end


function AndroidDebug:setRunning(running)
        self.running = running
end


function AndroidDebug:isRunning()
        return self.running
end

return AndroidDebug

