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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Command = require("javax.microedition.lcdui.Command")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local SWTUtil = require("org.allbinary.game.layer.SWTUtil")
local GPoint = require("org.allbinary.graphics.GPoint")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local CommandCurrentSelectionForm = require("org.allbinary.graphics.form.CommandCurrentSelectionForm")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PrimaryPlayerQueueFactory = require("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local SelectSound = require("org.allbinary.media.audio.SelectSound")
local PrimaryThreadPool = require("org.allbinary.thread.PrimaryThreadPool")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicMenuInputProcessor = require("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--In general allow scrolling of the menu and selection the center item
local CommandFormInputProcessor = {}
CommandFormInputProcessor.__index = CommandFormInputProcessor
CommandFormInputProcessor.className = "CommandFormInputProcessor"
setmetatable(CommandFormInputProcessor, {__index = BasicMenuInputProcessor})

function CommandFormInputProcessor:_init_fields()
    self.MOTION_GESTURE_SOURCE_ID = GameKeyEventFactory.getInstance().MOTION_GESTURE_SOURCE_ID
    self.CLICK_DELAY = 150
    self.clickTimeHelper = TimeDelayHelper.new(self.CLICK_DELAY)
    self.DOUBLE_CLICK_DELAY = 1200
    self.doubleClickTimeHelper = TimeDelayHelper.new(self.DOUBLE_CLICK_DELAY)
    self.isSingleKeyProcessing = InputFeatureFactory.getInstance():isSingleKeyProcessing()
    self.form = nil
    self.hasPressed = false
    self.PROCESS_COMMAND = "processCommand"
    self.NAME_LABEL = " ScrollSelectionForm: "
end


function CommandFormInputProcessor.new(gameKeyEventList, playerInputId, gameCanvas, form)
    local self = setmetatable(BasicMenuInputProcessor.new(gameKeyEventList, playerInputId, gameCanvas), CommandFormInputProcessor)
    self:_init_fields()
        -- super(...) made self above
        self.form = form
    return self
end


-- throws Exception
function CommandFormInputProcessor:processInput(key)
        if key == Canvas.LEFT or key == Canvas.RIGHT or key == Canvas.UP or key == Canvas.DOWN then
            PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
            self.form:processInputKey(key)
            return 1
        elseif key == Canvas.FIRE then
            PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
            return self:processCommand()
        end
        return 0
end


function CommandFormInputProcessor:processCommand()
        local commandCurrentSelectionForm = self.form
        local command = commandCurrentSelectionForm:getSelectedCommand()
        self.logUtil:putF(tostring(command), self, self.PROCESS_COMMAND)
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if SWTUtil.isSWT and features:isFeature(openGLFeatureFactory.OPENGL) and command ~= GameCommandsFactory.getInstance().EXIT_COMMAND then
            CommandRunnable.new(self, command):run()
        else
            PrimaryThreadPool.getInstance():runTask(CommandRunnable.new(self, command))
        end
        if command == GameCommandsFactory.getInstance().QUIT_COMMAND then
            return -1
        else
            return 1
        end
end


-- throws Exception
function CommandFormInputProcessor:processInputList()
        local try_ok, try_error = pcall(function()
            local motionInputsIndex = self:processMotionInputs()
            local list = self:getGameKeyEventList()
            local size = list:size()
            local key = 0
            local gameKeyEvent = nil
            for index = 0, size - 1 do
                gameKeyEvent = list.objectArray[index + 1]
                key = gameKeyEvent:getKey()
                if gameKeyEvent:getSourceId() ~= self.MOTION_GESTURE_SOURCE_ID then
                    if self:processInput(key) == 1 then
                        break
                    end
                end
            end
            self:clear()
            if size > 0 or motionInputsIndex >= 0 then
                return 1
            else
                return -1
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.PROCESS_INPUT, e)
            return -1
        end
end


-- throws Exception
function CommandFormInputProcessor:processMotionInputs()
        local lastIndex = self.motionGestureEventList:size() - 1
        if lastIndex >= 0 then
            local motionGestureEvent = self.motionGestureEventList.objectArray[lastIndex + 1]
            self:processMotionInput(motionGestureEvent)
        end
        self.motionGestureEventList:clear()
        return lastIndex
end


-- throws Exception
function CommandFormInputProcessor:processMotionInput(motionGestureEvent)
        local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
        local motionGestureInput = motionGestureEvent:getMotionGesture()
        if motionGestureInput == touchMotionGestureFactory.RELEASED then
            local point = motionGestureEvent:getCurrentPoint()
            if self.form:isInForm(point) then
                local index = self.form:getSelectedIndexForPoint(point)
                if index ~= -1 then
                    PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
                    if index == self.form:getSelectedIndex() then
                        if self.clickTimeHelper:isTimeTNT() then
                            self:processCommand()
                        end
                    else
                        self.form:setSelectedIndex(index)
                    end
                else
                end
            end
            if self.hasPressed then
                if not self.doubleClickTimeHelper:isTimeTNT() then
                    self.logUtil:putF("Double Press", self, self.gameInputStrings.PROCESS_MOTION_INPUT)
                    self:processCommand()
                end
                self.doubleClickTimeHelper.delay = self.DOUBLE_CLICK_DELAY
                self.doubleClickTimeHelper:setStartTimeTNT()
            end
            self.hasPressed = false
        elseif motionGestureInput == touchMotionGestureFactory.PRESSED then
            self.doubleClickTimeHelper.delay = 0
            self.hasPressed = true
        end
end


function CommandFormInputProcessor:toString()
        return tostring(StringMaker.new():append(tostring(BasicMenuInputProcessor)):append(self.NAME_LABEL):append(tostring(self.form)))
end
CommandFormInputProcessor.__tostring = function(self) return self:toString() end

return CommandFormInputProcessor

