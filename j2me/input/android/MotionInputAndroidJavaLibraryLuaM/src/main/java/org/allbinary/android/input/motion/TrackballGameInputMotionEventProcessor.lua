--
-- AllBinary Open License Version 1
-- Copyright (c) 2009 AllBinary
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
-- package org.allbinary.android.input.motion

local MotionEvent = require("android.view.MotionEvent")
local SingleKeyPressGameKeyFromMotionGestureEventListener = require("org.allbinary.game.input.motion.action.SingleKeyPressGameKeyFromMotionGestureEventListener")
local DownTrackballInputToGameKeyEventAction = require("org.allbinary.input.motion.trackball.action.DownTrackballInputToGameKeyEventAction")
local LeftTrackballInputToGameKeyEventAction = require("org.allbinary.input.motion.trackball.action.LeftTrackballInputToGameKeyEventAction")
local RightTrackballInputToGameKeyEventAction = require("org.allbinary.input.motion.trackball.action.RightTrackballInputToGameKeyEventAction")
local UpTrackballInputToGameKeyEventAction = require("org.allbinary.input.motion.trackball.action.UpTrackballInputToGameKeyEventAction")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local MotionEventProcessor = require("org.allbinary.android.input.motion.MotionEventProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TrackballGameInputMotionEventProcessor = {}
TrackballGameInputMotionEventProcessor.__index = TrackballGameInputMotionEventProcessor
TrackballGameInputMotionEventProcessor.className = "TrackballGameInputMotionEventProcessor"
setmetatable(TrackballGameInputMotionEventProcessor, {__index = MotionEventProcessor})

function TrackballGameInputMotionEventProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.listener = SingleKeyPressGameKeyFromMotionGestureEventListener.new()
    self.commonStrings = CommonStrings.getInstance()
end


function TrackballGameInputMotionEventProcessor.getInstance()
        return TrackballGameInputMotionEventProcessor.PROCESSOR
end


function TrackballGameInputMotionEventProcessor.new()
    local self = setmetatable(MotionEventProcessor.new(), TrackballGameInputMotionEventProcessor)
    self:_init_fields()
    return self
end


function TrackballGameInputMotionEventProcessor:process(motionEvent)
        local try_ok, try_error = pcall(function()
            local x = motionEvent:getX()
            local y = motionEvent:getY()
            if x < 0.0 then
                self.listener:onCompleteMotionGestureInputEvent(LeftTrackballInputToGameKeyEventAction.getInstance())
            elseif x > 0.0 then
                self.listener:onCompleteMotionGestureInputEvent(RightTrackballInputToGameKeyEventAction.getInstance())
            end
            if y < 0.0 then
                self.listener:onCompleteMotionGestureInputEvent(UpTrackballInputToGameKeyEventAction.getInstance())
            elseif y > 0.0 then
                self.listener:onCompleteMotionGestureInputEvent(DownTrackballInputToGameKeyEventAction.getInstance())
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end

TrackballGameInputMotionEventProcessor.PROCESSOR = TrackballGameInputMotionEventProcessor.new()

return TrackballGameInputMotionEventProcessor

