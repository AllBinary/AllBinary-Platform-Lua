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
-- package org.allbinary.game.input.motion.action

local CompleteMotionGestureInputEvent = require("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local InputToGameKeyMapping = require("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
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

local GameKeyCompleteMotionGestureInputEvent = {}
GameKeyCompleteMotionGestureInputEvent.__index = GameKeyCompleteMotionGestureInputEvent
GameKeyCompleteMotionGestureInputEvent.className = "GameKeyCompleteMotionGestureInputEvent"
setmetatable(GameKeyCompleteMotionGestureInputEvent, {__index = CompleteMotionGestureInputEvent})

function GameKeyCompleteMotionGestureInputEvent:_init_fields()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.SOURCE_ID = self.gameKeyEventFactory.MOTION_GESTURE_SOURCE_ID
    self.gameKey = GameKey.NULL_GAME_KEY
    self.gameKeyEvent = GameKeyEvent.NONE
    self.inputToGameKeyMapping = nil
end


function GameKeyCompleteMotionGestureInputEvent.new(name, motionGestureInput, inputToGameKeyMapping)
    local self = setmetatable(CompleteMotionGestureInputEvent.new(name, motionGestureInput), GameKeyCompleteMotionGestureInputEvent)
    self:_init_fields()
        -- super(...) made self above
        self.inputToGameKeyMapping = inputToGameKeyMapping
        GameKeyCompleteMotionGestureInputEventFactory.getInstance():add(self)
        self:update()
    return self
end


function GameKeyCompleteMotionGestureInputEvent:getSourceId()
        return self.SOURCE_ID
end


function GameKeyCompleteMotionGestureInputEvent:update()
        local try_ok, try_error = pcall(function()
            self:setGameKey(self.inputToGameKeyMapping:getInstance(self:getMotionGestureInput():getId()))
            self:setGameKeyEvent(self.gameKeyEventFactory:getInstanceForInput(self, self:getGameKey()))
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.UPDATE, e)
        end
end


function GameKeyCompleteMotionGestureInputEvent:setGameKeyEvent(gameKeyEvent)
        self.gameKeyEvent = gameKeyEvent
end


function GameKeyCompleteMotionGestureInputEvent:getGameKeyEvent()
        return self.gameKeyEvent
end


function GameKeyCompleteMotionGestureInputEvent:setGameKey(gameKey)
        self.gameKey = gameKey
end


function GameKeyCompleteMotionGestureInputEvent:getGameKey()
        return self.gameKey
end

return GameKeyCompleteMotionGestureInputEvent

