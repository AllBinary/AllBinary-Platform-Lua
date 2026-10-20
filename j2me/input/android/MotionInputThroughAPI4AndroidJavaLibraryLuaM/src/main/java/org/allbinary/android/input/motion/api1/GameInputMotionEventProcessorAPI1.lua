--
-- AllBinary Open License Version 1
-- Copyright (c) 2009 AllBinary
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
-- package org.allbinary.android.input.motion.api1

local MotionEvent = require("android.view.MotionEvent")
local BaseGameInputMotionEventProcessor = require("org.allbinary.android.input.motion.BaseGameInputMotionEventProcessor")
local AllMotionRecognizer = require("org.allbinary.input.motion.AllMotionRecognizer")
local MotionRecognizer = require("org.allbinary.input.motion.MotionRecognizer")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputMotionEventProcessorAPI1 = {}
GameInputMotionEventProcessorAPI1.__index = GameInputMotionEventProcessorAPI1
GameInputMotionEventProcessorAPI1.className = "GameInputMotionEventProcessorAPI1"
setmetatable(GameInputMotionEventProcessorAPI1, {__index = BaseGameInputMotionEventProcessor})

function GameInputMotionEventProcessorAPI1:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.motionRecognizer = AllMotionRecognizer.new()
end


function GameInputMotionEventProcessorAPI1.getInstance()
        if GameInputMotionEventProcessorAPI1.instance == NullUtil.getInstance().NULL_OBJECT then
            GameInputMotionEventProcessorAPI1.instance = GameInputMotionEventProcessorAPI1.new()
        end
        return GameInputMotionEventProcessorAPI1.instance
end


function GameInputMotionEventProcessorAPI1.new()
    local self = setmetatable(BaseGameInputMotionEventProcessor.new(), GameInputMotionEventProcessorAPI1)
    self:_init_fields()
    return self
end


function GameInputMotionEventProcessorAPI1:process(motionEvent)
        local try_ok, try_error = pcall(function()
            local x = java_int(motionEvent:getX())
            local y = java_int(motionEvent:getY())
            local action = motionEvent:getAction()
            if action == MotionEvent.ACTION_DOWN then
                self.motionRecognizer:processStartMotionEvent(x, y, motionEvent:getDeviceId(), 0)
            elseif action == MotionEvent.ACTION_UP or action == MotionEvent.ACTION_CANCEL then
                self.motionRecognizer:processEndMotionEvent(x, y, motionEvent:getDeviceId(), 0)
            elseif action == MotionEvent.ACTION_MOVE then
                self.motionRecognizer:processDraggedMotionEvent(x, y, motionEvent:getDeviceId(), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end

GameInputMotionEventProcessorAPI1.instance = NullUtil.getInstance().NULL_OBJECT

return GameInputMotionEventProcessorAPI1

