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
-- package org.allbinary.input.motion.button

local DownGameKeyEventHandler = require("org.allbinary.game.input.event.DownGameKeyEventHandler")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local UpGameKeyEventHandler = require("org.allbinary.game.input.event.UpGameKeyEventHandler")
local GPoint = require("org.allbinary.graphics.GPoint")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local RectangleCollisionUtil = require("org.allbinary.math.RectangleCollisionUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonRecognizer = {}
TouchButtonRecognizer.__index = TouchButtonRecognizer
TouchButtonRecognizer.className = "TouchButtonRecognizer"
--CurrentlyPressedTouchButtonSingletonDebug.getInstance();
    local ReleaseHelper = {}
    ReleaseHelper.__index = ReleaseHelper
    ReleaseHelper.className = "ReleaseHelper"
    TouchButtonRecognizer.ReleaseHelper = ReleaseHelper

    function ReleaseHelper:_init_fields()
        self.touchButtonRecognizer = nil
    end
    

    function TouchButtonRecognizer.new(touchButtonRecognizer)
        local self = setmetatable({}, TouchButtonRecognizer)
        self:_init_fields()
            self.touchButtonRecognizer = touchButtonRecognizer
        return self
    end
    

    -- throws Exception
    function TouchButtonRecognizer:release(touchButtonInput, deviceId)
            local nextTouchButtonInput = nil
            local gameKeyEvent = nil
            for index = self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:size() - 1, 0, -1 do
                nextTouchButtonInput = self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:get(index)
                gameKeyEvent = nextTouchButtonInput:getGameKeyEvent()
                self.touchButtonRecognizer.upGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.touchButtonRecognizer.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
                self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:removeAt(index)
            end
    end

local MultitouchReleaseHelper = {}
    MultitouchReleaseHelper.__index = MultitouchReleaseHelper
    MultitouchReleaseHelper.className = "MultitouchReleaseHelper"
    setmetatable(MultitouchReleaseHelper, {__index = ReleaseHelper})
    TouchButtonRecognizer.MultitouchReleaseHelper = MultitouchReleaseHelper
    

    function TouchButtonRecognizer.new(touchButtonRecognizer)
        local self = setmetatable(ReleaseHelper.new(touchButtonRecognizer), TouchButtonRecognizer)
            -- super(...) made self above
        return self
    end
    

    -- throws Exception
    function TouchButtonRecognizer:release(touchButtonInput, deviceId)
            local cancelTouchButtonInput = CancelTouchButtonInputFactory.getInstance():getCancel(touchButtonInput)
            local nextTouchButtonInput = nil
            local gameKeyEvent = nil
            for index = self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:size() - 1, 0, -1 do
                nextTouchButtonInput = self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:get(index)
                if cancelTouchButtonInput == nextTouchButtonInput then
                    gameKeyEvent = nextTouchButtonInput:getGameKeyEvent()
                    self.touchButtonRecognizer.upGameKeyEventHandler:fireEvent(gameKeyEvent)
                    self.touchButtonRecognizer.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
                    self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:removeAt(index)
                end
            end
    end


function TouchButtonRecognizer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.downGameKeyEventHandler = DownGameKeyEventHandler.getInstance()
    self.lastPressedTouchButtonInput = BasicTouchInputFactory.getInstance().NONE
    self.currentlyPressedTouchButtonSingleton = CurrentlyPressedTouchButtonSingleton.getInstance()
    self.releaseHelper = nil
end


function TouchButtonRecognizer.new()
    local self = setmetatable({}, TouchButtonRecognizer)
    self:_init_fields()
        if TouchScreenFactory.getInstance():isMultiTouch() then
            self.releaseHelper = MultitouchReleaseHelper.new(self)
        else
            self.releaseHelper = ReleaseHelper.new(self)
        end
    return self
end


-- throws Exception
function TouchButtonRecognizer:processRelease(touchButtonInput, deviceId)
        self.releaseHelper:release(touchButtonInput, deviceId)
        local gameKeyEvent = touchButtonInput:getGameKeyEvent()
        self.upGameKeyEventHandler:fireEvent(gameKeyEvent)
        self.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
        self.currentlyPressedTouchButtonSingleton:remove(touchButtonInput)
end


-- throws Exception
function TouchButtonRecognizer:releaseTouchButtonInput(x, y, deviceId)
        local touchButtonInput = self.lastPressedTouchButtonInput
        if self.currentlyPressedTouchButtonSingleton:contains(touchButtonInput) then
            self.lastPressedTouchButtonInput = BasicTouchInputFactory.getInstance().NONE
            self:processRelease(touchButtonInput, deviceId)
            return true
        else
            local list = TouchButtonFactory.getInstance():getList()
            local rectangle = nil
            local point = nil
            local touchButton = nil
            for index = list:size() - 1, 0, -1 do
                touchButton = list.objectArray[index + 1]
                rectangle = touchButton:getRectangle()
                point = rectangle:getPoint()
                if self.rectangleCollisionUtil:isInside(point:getX(), point:getY(), rectangle:getMaxX(), rectangle:getMaxY(), x, y) then
                    touchButtonInput = touchButton:getTouchButtonInput()
                    self:processRelease(touchButtonInput, deviceId)
                    return true
                end
            end
        end
        return false
end


-- throws Exception
function TouchButtonRecognizer:pressTouchButtonInput(x, y, deviceId)
        local list = TouchButtonFactory.getInstance():getList()
        local rectangle = nil
        local point = nil
        local touchButton = nil
        local touchButtonInput = nil
        local gameKeyEvent = nil
        for index = list:size() - 1, 0, -1 do
            touchButton = list.objectArray[index + 1]
            rectangle = touchButton:getRectangle()
            point = rectangle:getPoint()
            if self.rectangleCollisionUtil:isInside(point:getX(), point:getY(), rectangle:getMaxX(), rectangle:getMaxY(), x, y) then
                touchButtonInput = touchButton:getTouchButtonInput()
                if not self.currentlyPressedTouchButtonSingleton:contains(touchButtonInput) then
                    self.releaseHelper:release(touchButtonInput, deviceId)
                    self.lastPressedTouchButtonInput = touchButtonInput
                    self.currentlyPressedTouchButtonSingleton:add(touchButtonInput)
                    gameKeyEvent = touchButtonInput:getGameKeyEvent()
                    self.downGameKeyEventHandler:fireEvent(gameKeyEvent)
                    self.downGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
                end
                return true
            end
        end
        return false
end

return TouchButtonRecognizer

