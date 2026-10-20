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
local CompleteMotionGestureInputEventListener = require("org.allbinary.game.input.CompleteMotionGestureInputEventListener")
local DownGameKeyEventHandler = require("org.allbinary.game.input.event.DownGameKeyEventHandler")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local UpGameKeyEventHandler = require("org.allbinary.game.input.event.UpGameKeyEventHandler")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
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

local GameKeyFromMotionGestureEventListener = {}
GameKeyFromMotionGestureEventListener.__index = GameKeyFromMotionGestureEventListener
GameKeyFromMotionGestureEventListener.className = "GameKeyFromMotionGestureEventListener"
setmetatable(GameKeyFromMotionGestureEventListener, {__index = CompleteMotionGestureInputEventListener})

function GameKeyFromMotionGestureEventListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.previousGameKeyEvent = GameKeyEvent.NONE
end

function GameKeyFromMotionGestureEventListener.new()
    local self = setmetatable(CompleteMotionGestureInputEventListener.new(), GameKeyFromMotionGestureEventListener)
    self:_init_fields()
    return self
end


function GameKeyFromMotionGestureEventListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function GameKeyFromMotionGestureEventListener:onCompleteMotionGestureInputEvent(completeMotionGestureInputEvent)
        local try_ok, try_error = pcall(function()
            local gameKeyCompleteMotionGestureInputEvent = completeMotionGestureInputEvent
            local gameKeyEvent = gameKeyCompleteMotionGestureInputEvent:getGameKeyEvent()
            if gameKeyEvent ~= self.previousGameKeyEvent then
                if self.previousGameKeyEvent ~= GameKeyEvent.NONE then
                    UpGameKeyEventHandler.getInstance():fireEvent(self.previousGameKeyEvent)
                end
                self.previousGameKeyEvent = gameKeyEvent
                if gameKeyEvent ~= nil and gameKeyEvent ~= GameKeyEvent.NONE then
                    DownGameKeyEventHandler.getInstance():fireEvent(gameKeyEvent)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "onCompleteMotionGestureInputEvent", e)
        end
end

return GameKeyFromMotionGestureEventListener

