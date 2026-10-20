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

local DiagonalDownRightTouchInputToGameKeyEventAction = {}
DiagonalDownRightTouchInputToGameKeyEventAction.__index = DiagonalDownRightTouchInputToGameKeyEventAction
DiagonalDownRightTouchInputToGameKeyEventAction.className = "DiagonalDownRightTouchInputToGameKeyEventAction"
setmetatable(DiagonalDownRightTouchInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})


function DiagonalDownRightTouchInputToGameKeyEventAction.getInstance()
        if DiagonalDownRightTouchInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            DiagonalDownRightTouchInputToGameKeyEventAction.instance = DiagonalDownRightTouchInputToGameKeyEventAction.new()
        end
        return DiagonalDownRightTouchInputToGameKeyEventAction.instance
end


function DiagonalDownRightTouchInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Diagonal Down Right Action", TouchMotionGestureFactory.getInstance().DIAGONAL_DOWN_RIGHT, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), DiagonalDownRightTouchInputToGameKeyEventAction)
        -- super(...) made self above
    return self
end

DiagonalDownRightTouchInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return DiagonalDownRightTouchInputToGameKeyEventAction

