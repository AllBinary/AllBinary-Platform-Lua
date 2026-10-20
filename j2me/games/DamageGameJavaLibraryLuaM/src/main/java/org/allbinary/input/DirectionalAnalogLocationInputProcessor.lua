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
-- package org.allbinary.input

local AnalogLocationInputProcessor = require("org.allbinary.android.input.motion.AnalogLocationInputProcessor")
local GameInputProcessor = require("org.allbinary.game.input.GameInputProcessor")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local AnalogLocationInput = require("org.allbinary.game.input.analog.AnalogLocationInput")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local CustomGPoint = require("org.allbinary.graphics.CustomGPoint")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local DirectionalAnalogLocationInputProcessor = {}
DirectionalAnalogLocationInputProcessor.__index = DirectionalAnalogLocationInputProcessor
DirectionalAnalogLocationInputProcessor.className = "DirectionalAnalogLocationInputProcessor"
setmetatable(DirectionalAnalogLocationInputProcessor, {__index = AnalogLocationInputProcessor})

function DirectionalAnalogLocationInputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputProcessorArray = nil
    self.gameKeyFactory = GameKeyFactory.getInstance()
    self.leftGameKeyEvent = GameKeyEvent.NONE
    self.rightGameKeyEvent = GameKeyEvent.NONE
    self.upGameKeyEvent = GameKeyEvent.NONE
    self.downGameKeyEvent = GameKeyEvent.NONE
    self.leftTriggerGameKeyEvent = GameKeyEvent.NONE
    self.rightTriggerGameKeyEvent = GameKeyEvent.NONE
end


function DirectionalAnalogLocationInputProcessor.new(inputProcessorArray)
    local self = setmetatable(AnalogLocationInputProcessor.new(), DirectionalAnalogLocationInputProcessor)
    self:_init_fields()
        self.inputProcessorArray = inputProcessorArray
        local try_ok, try_error = pcall(function()
            self.leftGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.LEFT)
            self.rightGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.RIGHT)
            self.upGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.UP)
            self.downGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.DOWN)
            self.leftTriggerGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.KEY_NUM0)
            self.rightTriggerGameKeyEvent = GameKeyEventFactory.getInstance():getInstanceForInput(self, self.gameKeyFactory.KEY_NUM5)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function DirectionalAnalogLocationInputProcessor:process(allbinaryLayerManager, analogLocationInput)
        local try_ok, try_error = pcall(function()
            local customGPoint = nil
            customGPoint = analogLocationInput:getCustomGPoint()
            local x = customGPoint:getX()
            local y = customGPoint:getY()
            local leftTrigger = analogLocationInput:getLeftTrigger()
            local rightTrigger = analogLocationInput:getRightTrigger()
            if x < 0 then
                self.inputProcessorArray[self.leftGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.leftGameKeyEvent, x)
            elseif x > 0 then
                self.inputProcessorArray[self.rightGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.rightGameKeyEvent, x)
            end
            if y < 0 then
                self.inputProcessorArray[self.downGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.downGameKeyEvent, y)
            elseif y > 0 then
                self.inputProcessorArray[self.upGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.upGameKeyEvent, y)
            end
            if leftTrigger > 0 then
                self.inputProcessorArray[self.leftTriggerGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.leftTriggerGameKeyEvent, leftTrigger)
            end
            if rightTrigger > 0 then
                self.inputProcessorArray[self.rightTriggerGameKeyEvent:getKey() + 1]:processAnalog(allbinaryLayerManager, self.rightTriggerGameKeyEvent, rightTrigger)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put("Unable to process analog input", self, commonStrings.PROCESS, e)
        end
end


function DirectionalAnalogLocationInputProcessor:getSourceId()
        return 0
end

return DirectionalAnalogLocationInputProcessor

