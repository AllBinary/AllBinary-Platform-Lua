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

local DiagonalDownLeftTouchInputToGameKeyEventAction = {}
DiagonalDownLeftTouchInputToGameKeyEventAction.__index = DiagonalDownLeftTouchInputToGameKeyEventAction
DiagonalDownLeftTouchInputToGameKeyEventAction.className = "DiagonalDownLeftTouchInputToGameKeyEventAction"
setmetatable(DiagonalDownLeftTouchInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})


function DiagonalDownLeftTouchInputToGameKeyEventAction.getInstance()
        if DiagonalDownLeftTouchInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            DiagonalDownLeftTouchInputToGameKeyEventAction.instance = DiagonalDownLeftTouchInputToGameKeyEventAction.new()
        end
        return DiagonalDownLeftTouchInputToGameKeyEventAction.instance
end


function DiagonalDownLeftTouchInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Diagonal Down Left Action", TouchMotionGestureFactory.getInstance().DIAGONAL_DOWN_LEFT, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), DiagonalDownLeftTouchInputToGameKeyEventAction)
        -- super(...) made self above
    return self
end

DiagonalDownLeftTouchInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return DiagonalDownLeftTouchInputToGameKeyEventAction

