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
-- package org.allbinary.input.motion.touch.action

local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local GameKeyCompleteMotionGestureInputEvent = require("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RightTouchInputToGameKeyEventAction = {}
RightTouchInputToGameKeyEventAction.__index = RightTouchInputToGameKeyEventAction
RightTouchInputToGameKeyEventAction.className = "RightTouchInputToGameKeyEventAction"
setmetatable(RightTouchInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})


function RightTouchInputToGameKeyEventAction.getInstance()
        if RightTouchInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            RightTouchInputToGameKeyEventAction.instance = RightTouchInputToGameKeyEventAction.new()
        end
        return RightTouchInputToGameKeyEventAction.instance
end


function RightTouchInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Right Action", TouchMotionGestureFactory.getInstance().RIGHT, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), RightTouchInputToGameKeyEventAction)
        -- super(...) made self above
    return self
end

RightTouchInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return RightTouchInputToGameKeyEventAction

