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
-- package org.allbinary.input.motion.gyro.action

local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local GameKeyCompleteMotionGestureInputEvent = require("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent")
local OrientationMotionGestureFactory = require("org.allbinary.input.gyro.OrientationMotionGestureFactory")
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

local LeftOrientationInputToGameKeyEventAction = {}
LeftOrientationInputToGameKeyEventAction.__index = LeftOrientationInputToGameKeyEventAction
LeftOrientationInputToGameKeyEventAction.className = "LeftOrientationInputToGameKeyEventAction"
setmetatable(LeftOrientationInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})


function LeftOrientationInputToGameKeyEventAction.getInstance()
        if LeftOrientationInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            LeftOrientationInputToGameKeyEventAction.instance = LeftOrientationInputToGameKeyEventAction.new()
        end
        return LeftOrientationInputToGameKeyEventAction.instance
end


function LeftOrientationInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Left Action", OrientationMotionGestureFactory.getInstance().LEFT, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), LeftOrientationInputToGameKeyEventAction)
        -- super(...) made self above
    return self
end

LeftOrientationInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return LeftOrientationInputToGameKeyEventAction

