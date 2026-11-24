-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.logic.util.event

local NullEventListener = {}
package.loaded["org.allbinary.logic.util.event.NullEventListener"] = NullEventListener

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

local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")

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

-- class table NullEventListener is declared before the requires
NullEventListener.__index = NullEventListener
NullEventListener.className = "NullEventListener"
NullEventListener.javaClassName = "org.allbinary.logic.util.event.NullEventListener"
NullEventListener.java_implements = " EventListenerInterface "
NullEventListener.java_interfaces = function() return {EventListenerInterface} end

function NullEventListener._jinit(self)
    return self
end

function NullEventListener.new()
    return NullEventListener._jinit(setmetatable({}, NullEventListener))
end


function NullEventListener:onEvent(eventObject)
end

NullEventListener.NULL_EVENT_LISTENER = NullEventListener.new()

return NullEventListener

