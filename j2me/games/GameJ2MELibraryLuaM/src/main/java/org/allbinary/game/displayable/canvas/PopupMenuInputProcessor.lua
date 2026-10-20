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
local GameInputStrings = require("org.allbinary.game.input.GameInputStrings")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GPoint = require("org.allbinary.graphics.GPoint")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local RectangleCollisionUtil = require("org.allbinary.math.RectangleCollisionUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local PopupMenuInputProcessor = {}
PopupMenuInputProcessor.__index = PopupMenuInputProcessor
PopupMenuInputProcessor.className = "PopupMenuInputProcessor"
setmetatable(PopupMenuInputProcessor, {__index = BasicMenuInputProcessor})

function PopupMenuInputProcessor:_init_fields()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    self.CLICK_DELAY = 120
    self.clickTimeHelper = TimeDelayHelper.new(self.CLICK_DELAY)
    self.rectangle = nil
end


function PopupMenuInputProcessor.new(gameKeyEventList, playerInputId, gameCanvas, rectangle)
    local self = setmetatable(BasicMenuInputProcessor.new(gameKeyEventList, playerInputId, gameCanvas), PopupMenuInputProcessor)
    self:_init_fields()
        -- super(...) made self above
        self.rectangle = rectangle
    return self
end


function PopupMenuInputProcessor:init(rectangle)
        self.rectangle = rectangle
end


-- throws Exception
function PopupMenuInputProcessor:processInput(key)
        if key == Canvas.KEY_STAR then
            local gameCanvas = self:getCanvas()
            gameCanvas:toggleMenu()
            return 1
        end
        return 0
end


-- throws Exception
function PopupMenuInputProcessor:processInputList()
        local try_ok, try_error = pcall(function()
            local motionInputsIndex = self:processMotionInputs()
            local list = self:getGameKeyEventList()
            local size = list:size()
            local key = 0
            local gameKeyEvent = nil
            for index = 0, size - 1 do
                gameKeyEvent = list.objectArray[index + 1]
                if gameKeyEvent ~= nil then
                    key = gameKeyEvent:getKey()
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, GameInputStrings.getInstance().PROCESS_INPUT, e)
            return -1
        end
end


-- throws Exception
function PopupMenuInputProcessor:processMotionInputs()
        local lastIndex = self.motionGestureEventList:size() - 1
        if lastIndex >= 0 then
            local motionGestureEvent = self.motionGestureEventList.objectArray[lastIndex + 1]
            self:processMotionInput(motionGestureEvent)
        end
        self.motionGestureEventList:clear()
        return lastIndex
end


-- throws Exception
function PopupMenuInputProcessor:processMotionInput(motionGestureEvent)
        if motionGestureEvent == nil then
            self.logUtil:putF("Exception: Bug", self, self.gameInputStrings.PROCESS_MOTION_INPUT)
            return
        end
        local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
        local motionGestureInput = motionGestureEvent:getMotionGesture()
        if motionGestureInput == touchMotionGestureFactory.RELEASED then
            local point = motionGestureEvent:getCurrentPoint()
            local rectPoint = self.rectangle:getPoint()
            if self.rectangleCollisionUtil:isInside(rectPoint:getX(), rectPoint:getY(), self.rectangle:getMaxX() + 20, self.rectangle:getMaxY(), point:getX(), point:getY()) then
                if self.clickTimeHelper:isTimeTNT() then
                    local gameCanvas = self:getCanvas()
                    gameCanvas:toggleMenu()
                end
            end
        end
end

return PopupMenuInputProcessor

