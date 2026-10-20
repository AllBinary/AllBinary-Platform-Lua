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
-- package org.allbinary.android.input.motion.api5

local MotionEvent = require("android.view.MotionEvent")
local BaseGameInputMotionEventProcessor = require("org.allbinary.android.input.motion.BaseGameInputMotionEventProcessor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local ScalableListener = require("org.allbinary.graphics.displayable.ScalableListener")
local AllMotionRecognizer = require("org.allbinary.input.motion.AllMotionRecognizer")
local MotionRecognizer = require("org.allbinary.input.motion.MotionRecognizer")
local NullUtil = require("org.allbinary.logic.NullUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputMotionEventProcessorAPI5 = {}
GameInputMotionEventProcessorAPI5.__index = GameInputMotionEventProcessorAPI5
GameInputMotionEventProcessorAPI5.className = "GameInputMotionEventProcessorAPI5"
setmetatable(GameInputMotionEventProcessorAPI5, {__index = BaseGameInputMotionEventProcessor})

function GameInputMotionEventProcessorAPI5:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.motionRecognizerArray = nil
    self.TOTAL_MINUS_ONE = nil
end


function GameInputMotionEventProcessorAPI5.getInstance()
        if GameInputMotionEventProcessorAPI5.instance == NullUtil.getInstance().NULL_OBJECT then
            GameInputMotionEventProcessorAPI5.instance = GameInputMotionEventProcessorAPI5.new()
        end
        return GameInputMotionEventProcessorAPI5.instance
end


function GameInputMotionEventProcessorAPI5.new()
    local self = setmetatable(BaseGameInputMotionEventProcessor.new(), GameInputMotionEventProcessorAPI5)
    self:_init_fields()
        local size = GameInputMotionInfoAPI5.getInstance().MAX_POINTERS
        self.motionRecognizerArray = java_new_array(nil, size)
        self.TOTAL_MINUS_ONE = size
        for index = 0, size - 1 do
            self.motionRecognizerArray[index + 1] = AllMotionRecognizer.new()
        end
    return self
end


function GameInputMotionEventProcessorAPI5:isValid(pointerId)
        if pointerId > self.TOTAL_MINUS_ONE then
            local message = "Log that the pointer Ids are not what would be expected or Android has more than what I set my stuff to support pointerId: "
            ForcedLogUtil.log(message .. tostring(pointerId), self)
            return false
        else
            return true
        end
end


function GameInputMotionEventProcessorAPI5:process(motionEvent)
        local try_ok, try_error = pcall(function()
            local action = motionEvent:getAction()
            local total = (self.motionRecognizerArray.n or #self.motionRecognizerArray)
            if total > motionEvent:getPointerCount() then
                total = motionEvent:getPointerCount()
            else
                local message = "Log that Android has more pointers than I have expected so increase it motionEvent.getPointerCount(): "
                ForcedLogUtil.log(message .. tostring(motionEvent:getPointerCount()), self)
            end
            local totalMinusOne = total - 1
            if action == MotionEvent.ACTION_DOWN then
                for pointerIndex = totalMinusOne, 0, -1 do
                    local pointerId = motionEvent:getPointerId(pointerIndex)
                    if self:isValid(pointerId) then
                        local scalableListener = self.displayInfo:getScalableListener()
                        local x = java_int(((motionEvent:getX(pointerIndex) - self.displayInfo:getLeft()) / scalableListener:getRatio(self.displayInfo:getRatio())))
                        local y = java_int(((motionEvent:getY(pointerIndex) - self.displayInfo:getTop()) / scalableListener:getRatio(self.displayInfo:getRatio())))
                        self.motionRecognizerArray[pointerId + 1]:processStartMotionEvent(x, y, motionEvent:getDeviceId(), 0)
                    end
                end
            elseif action == MotionEvent.ACTION_UP or action == MotionEvent.ACTION_CANCEL then
                for pointerIndex = totalMinusOne, 0, -1 do
                    local pointerId = motionEvent:getPointerId(pointerIndex)
                    if self:isValid(pointerId) then
                        local scalableListener = self.displayInfo:getScalableListener()
                        local x = java_int(((motionEvent:getX(pointerIndex) - self.displayInfo:getLeft()) / scalableListener:getRatio(self.displayInfo:getRatio())))
                        local y = java_int(((motionEvent:getY(pointerIndex) - self.displayInfo:getTop()) / scalableListener:getRatio(self.displayInfo:getRatio())))
                        self.motionRecognizerArray[pointerId + 1]:processEndMotionEvent(x, y, motionEvent:getDeviceId(), 0)
                    end
                end
            elseif action == MotionEvent.ACTION_MOVE then
                for pointerIndex = totalMinusOne, 0, -1 do
                    local pointerId = motionEvent:getPointerId(pointerIndex)
                    if self:isValid(pointerId) then
                        local scalableListener = self.displayInfo:getScalableListener()
                        local x = java_int(((motionEvent:getX(pointerIndex) - self.displayInfo:getLeft()) / scalableListener:getRatio(self.displayInfo:getRatio())))
                        local y = java_int(((motionEvent:getY(pointerIndex) - self.displayInfo:getTop()) / scalableListener:getRatio(self.displayInfo:getRatio())))
                        self.motionRecognizerArray[pointerId + 1]:processDraggedMotionEvent(x, y, motionEvent:getDeviceId(), 0)
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end

GameInputMotionEventProcessorAPI5.instance = NullUtil.getInstance().NULL_OBJECT

return GameInputMotionEventProcessorAPI5

