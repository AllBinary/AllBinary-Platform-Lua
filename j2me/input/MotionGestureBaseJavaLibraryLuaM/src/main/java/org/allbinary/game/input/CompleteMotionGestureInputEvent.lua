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
-- package org.allbinary.game.input

local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local CompleteMotionGestureInputInterface = require("org.allbinary.game.input.CompleteMotionGestureInputInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CompleteMotionGestureInputEvent = {}
CompleteMotionGestureInputEvent.__index = CompleteMotionGestureInputEvent
CompleteMotionGestureInputEvent.className = "CompleteMotionGestureInputEvent"
setmetatable(CompleteMotionGestureInputEvent, {__index = AllBinaryEventObject})

function CompleteMotionGestureInputEvent:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.name = StringUtil.getInstance().EMPTY_STRING
    self.motionGestureInput = TouchMotionGestureFactory.getInstance().NO_MOTION
end


function CompleteMotionGestureInputEvent.new(name, motionGestureInput)
    local self = setmetatable(AllBinaryEventObject.new(motionGestureInput), CompleteMotionGestureInputEvent)
    self:_init_fields()
        -- super(...) made self above
        self:setName(name)
        local try_ok, try_error = pcall(function()
            self:setMotionGestureInput(motionGestureInput)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "InputToGameKeyEventAction", e)
        end
    return self
end


function CompleteMotionGestureInputEvent:setName(name)
        self.name = name
end


function CompleteMotionGestureInputEvent:getName()
        return self.name
end


function CompleteMotionGestureInputEvent:setMotionGestureInput(motionGestureInput)
        self.motionGestureInput = motionGestureInput
end


function CompleteMotionGestureInputEvent:getMotionGestureInput()
        return self.motionGestureInput
end

return CompleteMotionGestureInputEvent

