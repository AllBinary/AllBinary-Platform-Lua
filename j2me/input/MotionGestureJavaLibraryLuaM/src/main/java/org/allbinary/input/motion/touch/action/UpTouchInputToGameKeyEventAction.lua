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

local UpTouchInputToGameKeyEventAction = {}
UpTouchInputToGameKeyEventAction.__index = UpTouchInputToGameKeyEventAction
UpTouchInputToGameKeyEventAction.className = "UpTouchInputToGameKeyEventAction"
setmetatable(UpTouchInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})


function UpTouchInputToGameKeyEventAction.getInstance()
        if UpTouchInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            UpTouchInputToGameKeyEventAction.instance = UpTouchInputToGameKeyEventAction.new()
        end
        return UpTouchInputToGameKeyEventAction.instance
end


function UpTouchInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Up Action", TouchMotionGestureFactory.getInstance().UP, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), UpTouchInputToGameKeyEventAction)
        -- super(...) made self above
    return self
end

UpTouchInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return UpTouchInputToGameKeyEventAction

