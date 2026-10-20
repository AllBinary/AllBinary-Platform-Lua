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

local DownOrientationInputToGameKeyEventAction = {}
DownOrientationInputToGameKeyEventAction.__index = DownOrientationInputToGameKeyEventAction
DownOrientationInputToGameKeyEventAction.className = "DownOrientationInputToGameKeyEventAction"
setmetatable(DownOrientationInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})


function DownOrientationInputToGameKeyEventAction.getInstance()
        if DownOrientationInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            DownOrientationInputToGameKeyEventAction.instance = DownOrientationInputToGameKeyEventAction.new()
        end
        return DownOrientationInputToGameKeyEventAction.instance
end


function DownOrientationInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Down Action", OrientationMotionGestureFactory.getInstance().DOWN, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), DownOrientationInputToGameKeyEventAction)
        -- super(...) made self above
    return self
end

DownOrientationInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return DownOrientationInputToGameKeyEventAction

