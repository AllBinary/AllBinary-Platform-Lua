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
-- package org.allbinary.input.motion.gesture.observer

local MotionGestureEventListener = {}
package.loaded["org.allbinary.input.motion.gesture.observer.MotionGestureEventListener"] = MotionGestureEventListener

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

local BaseMotionGestureEventListener = require("org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener")
local MotionGestureEvent = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")

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

-- Java interface
-- class table MotionGestureEventListener is declared before the requires
MotionGestureEventListener.__index = MotionGestureEventListener
MotionGestureEventListener.className = "MotionGestureEventListener"
MotionGestureEventListener.javaClassName = "org.allbinary.input.motion.gesture.observer.MotionGestureEventListener"
setmetatable(MotionGestureEventListener, {__index = BaseMotionGestureEventListener})
MotionGestureEventListener.java_interfaces = function() return {BaseMotionGestureEventListener} end


function MotionGestureEventListener:onPressedMotionGestureEvent(ev)
    error("abstract method onPressedMotionGestureEvent")
end


function MotionGestureEventListener:onUpMotionGestureEvent(ev)
    error("abstract method onUpMotionGestureEvent")
end


function MotionGestureEventListener:onDownMotionGestureEvent(ev)
    error("abstract method onDownMotionGestureEvent")
end


function MotionGestureEventListener:onLeftMotionGestureEvent(ev)
    error("abstract method onLeftMotionGestureEvent")
end


function MotionGestureEventListener:onRightMotionGestureEvent(ev)
    error("abstract method onRightMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalDownRightMotionGestureEvent(ev)
    error("abstract method onDiagonalDownRightMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalDownLeftMotionGestureEvent(ev)
    error("abstract method onDiagonalDownLeftMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalUpRightMotionGestureEvent(ev)
    error("abstract method onDiagonalUpRightMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalUpLeftMotionGestureEvent(ev)
    error("abstract method onDiagonalUpLeftMotionGestureEvent")
end


-- throws Exception
function MotionGestureEventListener:released(ev)
    error("abstract method released")
end

return MotionGestureEventListener

