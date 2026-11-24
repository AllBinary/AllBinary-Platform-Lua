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

local GameMotionGestureListener = {}
package.loaded["org.allbinary.input.motion.gesture.observer.GameMotionGestureListener"] = GameMotionGestureListener

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

local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = java_lazy("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local MotionGestureEventListener = require("org.allbinary.input.motion.gesture.observer.MotionGestureEventListener")
local CompleteMotionGestureListenerInterface = java_lazy("org.allbinary.input.motion.gesture.observer.CompleteMotionGestureListenerInterface")
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

-- class table GameMotionGestureListener is declared before the requires
GameMotionGestureListener.__index = GameMotionGestureListener
GameMotionGestureListener.className = "GameMotionGestureListener"
GameMotionGestureListener.javaClassName = "org.allbinary.input.motion.gesture.observer.GameMotionGestureListener"
GameMotionGestureListener.java_implements = " MotionGestureEventListener "
GameMotionGestureListener.java_interfaces = function() return {MotionGestureEventListener} end

function GameMotionGestureListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.motionGestureCollection = BasicArrayListD.new()
    self.touchGestureCollection = BasicArrayListD.new()
    if self.signed == nil then self.signed = nil end
end


function GameMotionGestureListener._jinit(self, signed)
    GameMotionGestureListener._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.signed = signed
    return self
end

function GameMotionGestureListener.new(...)
    local self = setmetatable({}, GameMotionGestureListener)
    GameMotionGestureListener._jinit(self, ...)
    return self
end


function GameMotionGestureListener:onEvent(eventObject)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end


function GameMotionGestureListener:onUpMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onDownMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onLeftMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onRightMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onDiagonalDownRightMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onDiagonalDownLeftMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onDiagonalUpRightMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onDiagonalUpLeftMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function GameMotionGestureListener:onPressedMotionGestureEvent(ev)
        self.touchGestureCollection:add(ev:getMotionGesture())
end


function GameMotionGestureListener:released(ev)
        local try_ok, try_error, try_value = pcall(function()
            self.touchGestureCollection:add(ev:getMotionGesture())
            self.signed:onMotionGestureCompleted(self.touchGestureCollection)
            self.touchGestureCollection:clear()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.commonStrings.EXCEPTION_LABEL)
            stringBuffer:append(StringUtil.getInstance():toString(ev:getMotionGesture()))
            self.logUtil:put(tostring(stringBuffer), self, "release", e)
        end
end


function GameMotionGestureListener:onScrolledMotionGestureEvent(motionGestureEvent)
end


function GameMotionGestureListener:onMotionGestureEvent(ev)
        local try_ok, try_error, try_value = pcall(function()
            local motionGestureInput = ev:getMotionGesture()
            if motionGestureInput == TouchMotionGestureFactory.getInstance().PRESSED then
                self:onPressedMotionGestureEvent(ev)
            elseif motionGestureInput == TouchMotionGestureFactory.getInstance().RELEASED then
                self:released(ev)
            else
                self.motionGestureCollection:add(motionGestureInput)
                self.signed:onMotionGestureCompleted(self.motionGestureCollection)
                self.motionGestureCollection:clear()
                self.touchGestureCollection:clear()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.commonStrings.EXCEPTION_LABEL)
            stringBuffer:append(StringUtil.getInstance():toString(ev:getMotionGesture()))
            self.logUtil:put(tostring(stringBuffer), self, "onMotionGestureEvent", e)
        end
end

return GameMotionGestureListener

