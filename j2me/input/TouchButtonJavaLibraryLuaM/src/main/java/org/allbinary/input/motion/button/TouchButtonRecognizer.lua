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

local TouchButtonRecognizer = {}
package.loaded["org.allbinary.input.motion.button.TouchButtonRecognizer"] = TouchButtonRecognizer

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local DownGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.DownGameKeyEventHandler")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local UpGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.UpGameKeyEventHandler")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local RectangleCollisionUtil = java_lazy("org.allbinary.math.RectangleCollisionUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicTouchInputFactory = java_lazy("org.allbinary.input.motion.button.BasicTouchInputFactory")
local CurrentlyPressedTouchButtonSingleton = java_lazy("org.allbinary.input.motion.button.CurrentlyPressedTouchButtonSingleton")
local MultitouchReleaseHelper = java_lazy("org.allbinary.input.motion.button.MultitouchReleaseHelper")
local ReleaseHelper = java_lazy("org.allbinary.input.motion.button.ReleaseHelper")
local TouchButton = java_lazy("org.allbinary.input.motion.button.TouchButton")
local TouchButtonFactory = java_lazy("org.allbinary.input.motion.button.TouchButtonFactory")
local TouchButtonInput = java_lazy("org.allbinary.input.motion.button.TouchButtonInput")
local TouchScreenFactory = java_lazy("org.allbinary.input.motion.button.TouchScreenFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table TouchButtonRecognizer is declared before the requires
TouchButtonRecognizer.__index = TouchButtonRecognizer
TouchButtonRecognizer.className = "TouchButtonRecognizer"
TouchButtonRecognizer.javaClassName = "org.allbinary.input.motion.button.TouchButtonRecognizer"

function TouchButtonRecognizer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.downGameKeyEventHandler = DownGameKeyEventHandler.getInstance()
    self.lastPressedTouchButtonInput = BasicTouchInputFactory.getInstance().NONE
    self.currentlyPressedTouchButtonSingleton = CurrentlyPressedTouchButtonSingleton.getInstance()
    if self.releaseHelper == nil then self.releaseHelper = nil end
end


function TouchButtonRecognizer._jinit(self)
    TouchButtonRecognizer._init_fields(self)
        if TouchScreenFactory.getInstance():isMultiTouch() then
            self.releaseHelper = MultitouchReleaseHelper.new(self)
        else
            self.releaseHelper = ReleaseHelper.new(self)
        end
    return self
end

function TouchButtonRecognizer.new(...)
    local self = setmetatable({}, TouchButtonRecognizer)
    TouchButtonRecognizer._jinit(self, ...)
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

