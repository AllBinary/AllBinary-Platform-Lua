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

local MotionEventFactory = {}
package.loaded["org.allbinary.input.motion.gesture.observer.MotionEventFactory"] = MotionEventFactory

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

local Input = java_lazy("org.allbinary.game.input.Input")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = java_lazy("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local AllBinaryEventObjectFactoryInterface = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface")
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

-- class table MotionEventFactory is declared before the requires
MotionEventFactory.__index = MotionEventFactory
MotionEventFactory.className = "MotionEventFactory"
MotionEventFactory.javaClassName = "org.allbinary.input.motion.gesture.observer.MotionEventFactory"
MotionEventFactory.java_implements = " AllBinaryEventObjectFactoryInterface "
MotionEventFactory.java_interfaces = function() return {AllBinaryEventObjectFactoryInterface} end

function MotionEventFactory:_init_fields()
    if self.source == nil then self.source = nil end
    if self.id == nil then self.id = nil end
end


function MotionEventFactory._jinit(self, source, id)
    MotionEventFactory._init_fields(self)
        self.source = source
        self.id = id
        MotionEventFactory.index = TouchMotionGestureFactory.getInstance().LAST_MOTION:getId()
    return self
end

function MotionEventFactory.new(...)
    local self = setmetatable({}, MotionEventFactory)
    MotionEventFactory._jinit(self, ...)
    return self
end


function MotionEventFactory:getInstance()
        local inputFactory = InputFactory.getInstance()
        local input = inputFactory:getInstanceById((function() local value = MotionEventFactory.index MotionEventFactory.index = value + 1 return value end)())
        if input == inputFactory.NO_INPUT then
            return MotionGestureEvent.new(self.source, self.id, TouchMotionGestureFactory.getInstance().NO_MOTION)
        else
            return MotionGestureEvent.new(self.source, self.id, input)
        end
end

MotionEventFactory.index = 0

return MotionEventFactory

