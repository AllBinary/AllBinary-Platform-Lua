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

local DiagonalUpRightTouchInputToGameKeyEventAction = {}
DiagonalUpRightTouchInputToGameKeyEventAction.__index = DiagonalUpRightTouchInputToGameKeyEventAction
DiagonalUpRightTouchInputToGameKeyEventAction.className = "DiagonalUpRightTouchInputToGameKeyEventAction"
setmetatable(DiagonalUpRightTouchInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})


function DiagonalUpRightTouchInputToGameKeyEventAction.getInstance()
        if DiagonalUpRightTouchInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            DiagonalUpRightTouchInputToGameKeyEventAction.instance = DiagonalUpRightTouchInputToGameKeyEventAction.new()
        end
        return DiagonalUpRightTouchInputToGameKeyEventAction.instance
end


function DiagonalUpRightTouchInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Diagonal Up Right Action", TouchMotionGestureFactory.getInstance().DIAGONAL_UP_RIGHT, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), DiagonalUpRightTouchInputToGameKeyEventAction)
        -- super(...) made self above
    return self
end

DiagonalUpRightTouchInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return DiagonalUpRightTouchInputToGameKeyEventAction

