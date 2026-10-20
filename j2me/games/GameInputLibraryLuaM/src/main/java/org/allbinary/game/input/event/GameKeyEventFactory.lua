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
-- package org.allbinary.game.input.event

local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameKeyEventFactory = {}
GameKeyEventFactory.__index = GameKeyEventFactory
GameKeyEventFactory.className = "GameKeyEventFactory"

function GameKeyEventFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.TOUCH_BUTTON_SOURCE_ID = 2
    self.MOTION_GESTURE_SOURCE_ID = 3
    self.MAX_SOURCES = 4
    self.ARRAY = java_new_array(nil, self.MAX_SOURCES, InputFactory.getInstance().MAX)
end


function GameKeyEventFactory.getInstance()
        if GameKeyEventFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            GameKeyEventFactory.instance = GameKeyEventFactory.new()
        end
        return GameKeyEventFactory.instance
end


function GameKeyEventFactory.new()
    local self = setmetatable({}, GameKeyEventFactory)
    self:_init_fields()
    return self
end


function GameKeyEventFactory:init()
        local nullUtil = NullUtil.getInstance()
        local size = InputFactory.getInstance().MAX
        do
            local index = self.MAX_SOURCES
            while (function() index = index - 1 return index end)() >= 0 do
            do
                local index2 = size
                while (function() index2 = index2 - 1 return index2 end)() >= 0 do
                self.ARRAY[index + 1][index2 + 1] = GameKeyEvent.createEvent(nullUtil.NULL_OBJECT, index, index2)
                end
            end
            end
        end
end


-- throws Exception
function GameKeyEventFactory:getInstanceForKey(anyType, key)
        local gameKeyEvent = self.ARRAY[anyType:getSourceId() + 1][key + 1]
        return gameKeyEvent
end


-- throws Exception
function GameKeyEventFactory:getInstanceForInput(anyType, input)
        local gameKeyEvent = self.ARRAY[anyType:getSourceId() + 1][input:getId() + 1]
        return gameKeyEvent
end

GameKeyEventFactory.instance = NullUtil.getInstance().NULL_OBJECT

return GameKeyEventFactory

