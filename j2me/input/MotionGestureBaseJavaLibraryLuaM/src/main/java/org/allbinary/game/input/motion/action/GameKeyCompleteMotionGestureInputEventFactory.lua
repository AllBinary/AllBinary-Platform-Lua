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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameKeyCompleteMotionGestureInputEventFactory = {}
GameKeyCompleteMotionGestureInputEventFactory.__index = GameKeyCompleteMotionGestureInputEventFactory
GameKeyCompleteMotionGestureInputEventFactory.className = "GameKeyCompleteMotionGestureInputEventFactory"

function GameKeyCompleteMotionGestureInputEventFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.eventList = BasicArrayListD.new()
end

function GameKeyCompleteMotionGestureInputEventFactory.new()
    local self = setmetatable({}, GameKeyCompleteMotionGestureInputEventFactory)
    self:_init_fields()
    return self
end


function GameKeyCompleteMotionGestureInputEventFactory.getInstance()
        return GameKeyCompleteMotionGestureInputEventFactory.SINGLETON
end


function GameKeyCompleteMotionGestureInputEventFactory:add(gameKeyCompleteMotionGestureInputEvent)
        self.eventList:add(gameKeyCompleteMotionGestureInputEvent)
end


function GameKeyCompleteMotionGestureInputEventFactory:updateAll()
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):appendint(self.eventList:size())), self, "updateAll")
        for index = self.eventList:size() - 1, 0, -1 do
            local gameKeyCompleteMotionGestureInputEvent = self.eventList.objectArray[index + 1]
            gameKeyCompleteMotionGestureInputEvent:update()
        end
end

GameKeyCompleteMotionGestureInputEventFactory.SINGLETON = GameKeyCompleteMotionGestureInputEventFactory.new()

return GameKeyCompleteMotionGestureInputEventFactory

