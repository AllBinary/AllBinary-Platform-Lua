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

local ReleaseControlledMotionGestureListener = {}
ReleaseControlledMotionGestureListener.__index = ReleaseControlledMotionGestureListener
ReleaseControlledMotionGestureListener.className = "ReleaseControlledMotionGestureListener"

function ReleaseControlledMotionGestureListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.currentMotionGesture = TouchMotionGestureFactory.getInstance().NO_MOTION
    self.isMouseGestureOccurring = false
    self.motionGestureCollection = BasicArrayListD.new()
    self.signed = nil
end


function ReleaseControlledMotionGestureListener.new(signed)
    local self = setmetatable({}, ReleaseControlledMotionGestureListener)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.signed = signed
    return self
end


function ReleaseControlledMotionGestureListener:onEvent(eventObject)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end


function ReleaseControlledMotionGestureListener:onUpMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onDownMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onLeftMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onRightMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onDiagonalDownRightMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onDiagonalDownLeftMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onDiagonalUpRightMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onDiagonalUpLeftMotionGestureEvent(ev)
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onPressedMotionGestureEvent(ev)
        self.isMouseGestureOccurring = true
        self.currentMotionGesture = TouchMotionGestureFactory.getInstance().NO_MOTION
        self:onMotionGestureEvent(ev)
end


function ReleaseControlledMotionGestureListener:onScrolledMotionGestureEvent(motionGestureEvent)
end


function ReleaseControlledMotionGestureListener:released(ev)
        local try_ok, try_error = pcall(function()
            if self.isMouseGestureOccurring == false then
                return
            end
            self.isMouseGestureOccurring = false
            self.signed:onMotionGestureCompleted(self.motionGestureCollection)
            self.motionGestureCollection:clear()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(StringUtil.getInstance():toString(ev:getMotionGesture()))), self, "release", e)
        end
end


function ReleaseControlledMotionGestureListener:onMotionGestureEvent(ev)
        if self.isMouseGestureOccurring == false then
            return
        end
        local motionGestureInput = ev:getMotionGesture()
        if motionGestureInput == TouchMotionGestureFactory.getInstance().PRESSED then
            self:onPressedMotionGestureEvent(ev)
        elseif motionGestureInput == TouchMotionGestureFactory.getInstance().RELEASED then
            self:released(ev)
        else
            if self.currentMotionGesture ~= motionGestureInput then
                self.currentMotionGesture = motionGestureInput
                self.motionGestureCollection:add(ev:getMotionGesture())
            end
        end
end

return ReleaseControlledMotionGestureListener

