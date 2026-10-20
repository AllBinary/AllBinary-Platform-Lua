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
-- package org.allbinary.input.motion.gesture

local GPoint = require("org.allbinary.graphics.GPoint")
local Line = require("org.allbinary.graphics.Line")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local MotionGestureConfiguration = require("org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration")
local MotionGestureConfigurationFactory = require("org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local MotionEventCircularPool = require("org.allbinary.input.motion.gesture.observer.MotionEventCircularPool")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local MovedMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.MovedMotionGesturesHandler")
local ScrolledMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.ScrolledMotionGesturesHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local J2SEMath = require("org.allbinary.logic.math.J2SEMath")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionGestureRecognizer = {}
MotionGestureRecognizer.__index = MotionGestureRecognizer
MotionGestureRecognizer.className = "MotionGestureRecognizer"

function MotionGestureRecognizer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.j2seMath = J2SEMath.getInstance()
    self.origin = PointFactory.getInstance().ZERO_ZERO
    self.previous = self.origin
    self.intermediate = self.origin
    self.line = Line.new(self.origin, self.origin)
    self.motionGesturesHandler = nil
    self.movedMotionGesturesHandler = nil
    self.scrolledMotionGesturesHandler = nil
    self.motionEventCircularPool = nil
end


function MotionGestureRecognizer.new(id)
    local self = setmetatable({}, MotionGestureRecognizer)
    self:_init_fields()
        self.motionEventCircularPool = MotionEventCircularPool.createPool(id)
        local motionGesturesHandler = BasicEventHandler.new()
        local movedMotionGesturesHandler = motionGesturesHandler
        local scrolledMotionGesturesHandler = motionGesturesHandler
        local try_ok, try_error = pcall(function()
            motionGesturesHandler = BasicMotionGesturesHandler.getInstance()
            movedMotionGesturesHandler = MovedMotionGesturesHandler.getInstance()
            scrolledMotionGesturesHandler = ScrolledMotionGesturesHandler.getInstance()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
        self.motionGesturesHandler = motionGesturesHandler
        self.movedMotionGesturesHandler = movedMotionGesturesHandler
        self.scrolledMotionGesturesHandler = scrolledMotionGesturesHandler
    return self
end


-- throws Exception
function MotionGestureRecognizer:processPressedMotionEvent(current, deviceId, button)
        self.intermediate = self.origin
        self.previous = self.origin
        local event = self.motionEventCircularPool:getInstance(TouchMotionGestureFactory.getInstance().PRESSED)
        event:setPreviousPoint(self.previous)
        event:setCurrentPoint(current)
        self.motionGesturesHandler:fireEvent(event)
        return true
end


-- throws Exception
function MotionGestureRecognizer:processReleasedMotionEvent(current, deviceId, button)
        local event = self.motionEventCircularPool:getInstance(TouchMotionGestureFactory.getInstance().RELEASED)
        event:setPreviousPoint(self.previous)
        event:setCurrentPoint(current)
        self.motionGesturesHandler:fireEvent(event)
        return true
end


-- throws Exception
function MotionGestureRecognizer:processDraggedMotionEvent(current, deviceId, buttonMask)
        if self.previous == self.origin or self.intermediate == self.origin then
            self.previous = current
            self.intermediate = current
            return
        end
        self.line:setP1(self.previous)
        self.line:setP2(current)
        local minimumMotionGesture = MotionGestureConfigurationFactory.getInstance():getMinimumMotionGesture()
        if self.j2seMath:abs((self.line:getDeltaX() + 0.0)) < minimumMotionGesture and self.j2seMath:abs((self.line:getDeltaY() + 0.0)) < minimumMotionGesture then
            self.intermediate = current
            return
        end
        local gradient = self.line:getGradient()
        local absGradient = (self.j2seMath:abs(gradient) + 0.0)
        local conf = MotionGestureConfigurationFactory.getInstance()
        local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
        local newMotionGesture = touchMotionGestureFactory.NO_MOTION
        local diagonalToleranceHigher = 12.0
        local diagonalToleranceLower = 12.0
        if conf:isDiagonalMotionGestureAllowed() then
            diagonalToleranceHigher = ((90 - conf:getDiagonalTolerance()) + 0.0)
            diagonalToleranceLower = (conf:getDiagonalTolerance() + 0.0)
        end
        if absGradient > math.tan(math.rad(diagonalToleranceHigher)) then
            if self.line:getDeltaY() > 0 then
                newMotionGesture = touchMotionGestureFactory.UP
            else
                newMotionGesture = touchMotionGestureFactory.DOWN
            end
        else
            if absGradient < math.tan(math.rad(diagonalToleranceLower)) then
                if self.line:getDeltaX() > 0 then
                    newMotionGesture = touchMotionGestureFactory.LEFT
                else
                    newMotionGesture = touchMotionGestureFactory.RIGHT
                end
            else
                if gradient > 0.0 then
                    if self.line:getDeltaX() > 0 then
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_UP_LEFT
                    else
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_DOWN_RIGHT
                    end
                else
                    if self.line:getDeltaX() > 0 then
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_DOWN_LEFT
                    else
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_UP_RIGHT
                    end
                end
            end
        end
        self.previous = current
        self.intermediate = current
        local event = self.motionEventCircularPool:getInstance(newMotionGesture)
        event:setPreviousPoint(self.previous)
        event:setCurrentPoint(current)
        self.motionGesturesHandler:fireEvent(event)
        return
end


-- throws Exception
function MotionGestureRecognizer:processMovedMotionEvent(current, deviceId, button)
        local event = self.motionEventCircularPool:getInstance(TouchMotionGestureFactory.getInstance().NO_MOTION)
        event:setPreviousPoint(self.previous)
        event:setCurrentPoint(current)
        self.movedMotionGesturesHandler:fireEvent(event)
        return true
end


-- throws Exception
function MotionGestureRecognizer:processScrolledMotionEvent(current, deviceId, button)
        local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
        local newMotionGesture = touchMotionGestureFactory.NO_MOTION
        if button > 0 then
            newMotionGesture = touchMotionGestureFactory.SCROLL_UP
        elseif button < 0 then
            newMotionGesture = touchMotionGestureFactory.SCROLL_DOWN
        end
        local event = self.motionEventCircularPool:getInstance(newMotionGesture)
        event:setPreviousPoint(self.previous)
        event:setCurrentPoint(current)
        self.scrolledMotionGesturesHandler:fireEvent(event)
        return true
end


function MotionGestureRecognizer:getMotionGesturesHandler()
        return self.motionGesturesHandler
end

return MotionGestureRecognizer

