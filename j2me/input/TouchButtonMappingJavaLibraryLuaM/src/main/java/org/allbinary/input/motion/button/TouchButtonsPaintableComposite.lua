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
-- package org.allbinary.input.motion.button

local CompleteMotionGestureInputEvent = require("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local CompleteMotionGestureInputEventHandler = require("org.allbinary.game.input.CompleteMotionGestureInputEventHandler")
local CompleteMotionGestureInputEventListenerInterface = require("org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface")
local GameKey = require("org.allbinary.game.input.GameKey")
local InputMappingInterface = require("org.allbinary.game.input.mapping.InputMappingInterface")
local GameKeyCompleteMotionGestureInputEvent = require("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ProcessPaintable = require("org.allbinary.graphics.paint.ProcessPaintable")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonsPaintableComposite = {}
TouchButtonsPaintableComposite.__index = TouchButtonsPaintableComposite
TouchButtonsPaintableComposite.className = "TouchButtonsPaintableComposite"
setmetatable(TouchButtonsPaintableComposite, {__index = ProcessPaintable})

function TouchButtonsPaintableComposite:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.inputMappingInterface = nil
    self.touchButtonsPaintable = nil
    self.timeHelper = TimeDelayHelper.new(250)
    self.released = true
    self.METHOD_NAME = "onCompleteMotionGestureInputEvent"
    self.RELEASE = "Ignoring: MotionGestureInput Release"
    self.FAST_REPEAT = "Ignoring: MotionGestureInput Repeated To Quickly"
    self.IGNORE = "Ignoring: Until Released"
end


function TouchButtonsPaintableComposite.new(inputMappingInterface, basicColor)
    local self = setmetatable(ProcessPaintable.new(), TouchButtonsPaintableComposite)
    self:_init_fields()
        self.inputMappingInterface = inputMappingInterface
        CompleteMotionGestureInputEventHandler.getInstance():addListenerInterface(self)
        self.touchButtonsPaintable = TouchButtonsMappingPaintable.new(basicColor)
    return self
end


function TouchButtonsPaintableComposite:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function TouchButtonsPaintableComposite:onCompleteMotionGestureInputEvent(completeMotionGestureInputEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onCompleteMotionGestureInputEvent")
            local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
            local gameKeyCompleteMotionGestureInputEvent = completeMotionGestureInputEvent
            local gameKey = gameKeyCompleteMotionGestureInputEvent:getGameKey()
            local motionGestureInput = completeMotionGestureInputEvent:getMotionGestureInput()
            if motionGestureInput == touchMotionGestureFactory.RELEASED then
                self.logUtil:putF(self.RELEASE, self, self.METHOD_NAME)
                self.released = true
                return
            end
            if motionGestureInput == TouchMotionGestureFactory.getInstance().NO_MOTION and not self.timeHelper:isTimeTNT() then
                self.logUtil:putF(self.FAST_REPEAT, self, self.METHOD_NAME)
                return
            end
            if not self.released then
                self.logUtil:putF(self.IGNORE, self, self.METHOD_NAME)
                return
            end
            self.released = false
            self.logUtil:putF(tostring(StringMaker.new():append("GameKey: "):append(StringUtil.getInstance():toString(gameKey)):append(" MotionGestureInput: "):append(StringUtil.getInstance():toString(motionGestureInput))), self, self.METHOD_NAME)
            self.inputMappingInterface:processInputMapping(gameKey, motionGestureInput)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_NAME, e)
        end
end


function TouchButtonsPaintableComposite:process()
        CompleteMotionGestureInputEventHandler.getInstance():removeListener(self)
end

return TouchButtonsPaintableComposite

