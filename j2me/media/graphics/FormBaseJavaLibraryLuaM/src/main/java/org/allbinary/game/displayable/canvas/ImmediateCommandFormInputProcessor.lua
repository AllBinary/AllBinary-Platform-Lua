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
-- package org.allbinary.game.displayable.canvas

local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CommandFormInputProcessor = require("org.allbinary.game.displayable.canvas.CommandFormInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImmediateCommandFormInputProcessor = {}
ImmediateCommandFormInputProcessor.__index = ImmediateCommandFormInputProcessor
ImmediateCommandFormInputProcessor.className = "ImmediateCommandFormInputProcessor"
setmetatable(ImmediateCommandFormInputProcessor, {__index = CommandFormInputProcessor})

function ImmediateCommandFormInputProcessor:_init_fields()
    self.timeHelper = TimeDelayHelper.new(25)
    self.gameCommandCanvas = nil
end


function ImmediateCommandFormInputProcessor.new(gameKeyEventList, playerInputId, gameCommandCanvas, form)
    local self = setmetatable(CommandFormInputProcessor.new(gameKeyEventList, playerInputId, gameCommandCanvas, form), ImmediateCommandFormInputProcessor)
    self:_init_fields()
        -- super(...) made self above
        self.gameCommandCanvas = gameCommandCanvas
    return self
end


function ImmediateCommandFormInputProcessor:onPressGameKeyEvent(gameKeyEvent)
        local try_ok, try_error = pcall(function()
            CommandFormInputProcessor.onPressGameKeyEvent(self, gameKeyEvent)
            if self.timeHelper:isTimeTNT() then
                self:processInputList()
                self.gameCommandCanvas.repaintBehavior:onChangeRepaint(self:getCanvas())
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.ON_PRESS_GAME_KEY, e)
        end
end


function ImmediateCommandFormInputProcessor:onDownGameKeyEvent(gameKeyEvent)
        local try_ok, try_error = pcall(function()
            CommandFormInputProcessor.onDownGameKeyEvent(self, gameKeyEvent)
            if self.timeHelper:isTimeTNT() then
                self:processInputList()
                self.gameCommandCanvas.repaintBehavior:onChangeRepaint(self:getCanvas())
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.ON_DOWN_GAME_KEY, e)
        end
end


function ImmediateCommandFormInputProcessor:onUpGameKeyEvent(gameKeyEvent)
        local try_ok, try_error = pcall(function()
            CommandFormInputProcessor.onUpGameKeyEvent(self, gameKeyEvent)
            if self.timeHelper:isTimeTNT() then
                self:processInputList()
                self.gameCommandCanvas.repaintBehavior:onChangeRepaint(self:getCanvas())
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.ON_UP_GAME_KEY, e)
        end
end


function ImmediateCommandFormInputProcessor:onMotionGestureEvent(motionGestureEvent)
        local try_ok, try_error = pcall(function()
            CommandFormInputProcessor.onMotionGestureEvent(self, motionGestureEvent)
            if self.timeHelper:isTimeTNT() then
                self:processInputList()
                self.gameCommandCanvas.repaintBehavior:onChangeRepaint(self:getCanvas())
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onMotionGestureEvent", e)
        end
end

return ImmediateCommandFormInputProcessor

