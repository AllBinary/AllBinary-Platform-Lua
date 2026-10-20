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

local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local MotionGestureEventListener = require("org.allbinary.input.motion.gesture.observer.MotionGestureEventListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameMotionGestureListener = {}
GameMotionGestureListener.__index = GameMotionGestureListener
GameMotionGestureListener.className = "GameMotionGestureListener"

function GameMotionGestureListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.motionGestureCollection = BasicArrayListD.new()
    self.touchGestureCollection = BasicArrayListD.new()
    self.signed = nil
end


function GameMotionGestureListener.new(signed)
    local self = setmetatable({}, GameMotionGestureListener)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.signed = signed
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
        local try_ok, try_error = pcall(function()
            self.touchGestureCollection:add(ev:getMotionGesture())
            self.signed:onMotionGestureCompleted(self.touchGestureCollection)
            self.touchGestureCollection:clear()
        end)
        if not try_ok then
            local e = try_error
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.commonStrings.EXCEPTION_LABEL)
            stringBuffer:append(StringUtil.getInstance():toString(ev:getMotionGesture()))
            self.logUtil:put(tostring(stringBuffer), self, "release", e)
        end
end


function GameMotionGestureListener:onScrolledMotionGestureEvent(motionGestureEvent)
end


function GameMotionGestureListener:onMotionGestureEvent(ev)
        local try_ok, try_error = pcall(function()
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
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.commonStrings.EXCEPTION_LABEL)
            stringBuffer:append(StringUtil.getInstance():toString(ev:getMotionGesture()))
            self.logUtil:put(tostring(stringBuffer), self, "onMotionGestureEvent", e)
        end
end

return GameMotionGestureListener

