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
-- package org.allbinary.input

local AllMotionRecognizer = require("org.allbinary.input.motion.AllMotionRecognizer")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local GameMotionGestureListener = require("org.allbinary.input.motion.gesture.observer.GameMotionGestureListener")
local MotionGestureReceiveInterfaceFactory = require("org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

--TouchJ2ME
local TouchJ2ME = {}
TouchJ2ME.__index = TouchJ2ME
TouchJ2ME.className = "TouchJ2ME"

function TouchJ2ME:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.DEVICE_ID = 0
    self.motionRecognizer = AllMotionRecognizer.new()
end


function TouchJ2ME.new()
    local self = setmetatable({}, TouchJ2ME)
    self:_init_fields()
        local motionGesturesHandler = self.motionRecognizer:getMotionGestureRecognizer():getMotionGesturesHandler()
        motionGesturesHandler:addListenerInterface(GameMotionGestureListener.new(MotionGestureReceiveInterfaceFactory.getInstance()))
    return self
end


function TouchJ2ME:pointerDragged(x, y)
        local try_ok, try_error = pcall(function()
            self.motionRecognizer:processDraggedMotionEvent(x, y, self.DEVICE_ID, 0)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "pointerDragged", e)
        end
end


function TouchJ2ME:pointerPressed(x, y)
        local try_ok, try_error = pcall(function()
            self.motionRecognizer:processStartMotionEvent(x, y, self.DEVICE_ID, 0)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "pointerPressed", e)
        end
end


function TouchJ2ME:pointerReleased(x, y)
        local try_ok, try_error = pcall(function()
            self.motionRecognizer:processEndMotionEvent(x, y, self.DEVICE_ID, 0)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "pointerReleased", e)
        end
end

return TouchJ2ME

