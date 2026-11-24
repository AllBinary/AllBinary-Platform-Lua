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

local MotionGestureRecognizer = {}
package.loaded["org.allbinary.input.motion.gesture.MotionGestureRecognizer"] = MotionGestureRecognizer

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

local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local Line = java_lazy("org.allbinary.graphics.Line")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local MotionGestureConfiguration = java_lazy("org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration")
local MotionGestureConfigurationFactory = java_lazy("org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory")
local BasicMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local MotionEventCircularPool = java_lazy("org.allbinary.input.motion.gesture.observer.MotionEventCircularPool")
local MotionGestureEvent = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local MovedMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.MovedMotionGesturesHandler")
local ScrolledMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.ScrolledMotionGesturesHandler")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local J2SEMath = java_lazy("org.allbinary.logic.math.J2SEMath")
local BasicEventHandler = java_lazy("org.allbinary.logic.util.event.handler.BasicEventHandler")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = java_lazy("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")

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

-- class table MotionGestureRecognizer is declared before the requires
MotionGestureRecognizer.__index = MotionGestureRecognizer
MotionGestureRecognizer.className = "MotionGestureRecognizer"
MotionGestureRecognizer.javaClassName = "org.allbinary.input.motion.gesture.MotionGestureRecognizer"

function MotionGestureRecognizer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.j2seMath = J2SEMath.getInstance()
    self.origin = PointFactory.getInstance().ZERO_ZERO
    self.previous = self.origin
    self.intermediate = self.origin
    self.line = Line.new(self.origin, self.origin)
    if self.motionGesturesHandler == nil then self.motionGesturesHandler = nil end
    if self.movedMotionGesturesHandler == nil then self.movedMotionGesturesHandler = nil end
    if self.scrolledMotionGesturesHandler == nil then self.scrolledMotionGesturesHandler = nil end
    if self.motionEventCircularPool == nil then self.motionEventCircularPool = nil end
end


function MotionGestureRecognizer._jinit(self, id)
    MotionGestureRecognizer._init_fields(self)
        self.motionEventCircularPool = MotionEventCircularPool.createPool(id)
        local motionGesturesHandler = BasicEventHandler.new()
        local movedMotionGesturesHandler = motionGesturesHandler
        local scrolledMotionGesturesHandler = motionGesturesHandler
        local try_ok, try_error, try_value = pcall(function()
            motionGesturesHandler = BasicMotionGesturesHandler.getInstance()
            movedMotionGesturesHandler = MovedMotionGesturesHandler.getInstance()
            scrolledMotionGesturesHandler = ScrolledMotionGesturesHandler.getInstance()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
        self.motionGesturesHandler = motionGesturesHandler
        self.movedMotionGesturesHandler = movedMotionGesturesHandler
        self.scrolledMotionGesturesHandler = scrolledMotionGesturesHandler
    return self
end

function MotionGestureRecognizer.new(...)
    local self = setmetatable({}, MotionGestureRecognizer)
    MotionGestureRecognizer._jinit(self, ...)
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

