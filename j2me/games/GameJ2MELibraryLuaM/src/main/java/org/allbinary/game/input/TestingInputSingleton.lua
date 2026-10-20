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
-- package org.allbinary.game.input

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local ViewPosition = require("org.allbinary.view.ViewPosition")
local GameInputInterface = require("org.allbinary.game.input.GameInputInterface")

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

local TestingInputSingleton = {}
TestingInputSingleton.__index = TestingInputSingleton
TestingInputSingleton.className = "TestingInputSingleton"
setmetatable(TestingInputSingleton, {__index = AllBinaryGameLayer})

function TestingInputSingleton:_init_fields()
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.paintable = NullPaintable.getInstance()
end


function TestingInputSingleton.getInstance()
        return TestingInputSingleton.instance
end


function TestingInputSingleton.new()
    local self = setmetatable(AllBinaryGameLayer.new(StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPosition.getInstanceD()), TestingInputSingleton)
    self:_init_fields()
        -- super(...) made self above
        GameInputProcessorUtil.init(self.inputProcessorArray)
    return self
end


function TestingInputSingleton:initInputProcessors()
end


function TestingInputSingleton:initInputProcessorsForTestInput(aTestInputInterface)
        local testInputInterface = aTestInputInterface
        self.paintable = testInputInterface
        self.inputProcessorArray[Canvas.UP + 1] = (function()
            local o = GameInputProcessor.new and GameInputProcessor.new() or setmetatable({}, {__index = GameInputProcessor})
            

            -- throws Exception
        function o:processEvent(allbinaryLayerManager, gameKeyEvent)
                testInputInterface:up()
            end
            return o
        end)()
        self.inputProcessorArray[Canvas.DOWN + 1] = (function()
            local o = GameInputProcessor.new and GameInputProcessor.new() or setmetatable({}, {__index = GameInputProcessor})
            

            -- throws Exception
        function o:processEvent(allbinaryLayerManager, gameKeyEvent)
                testInputInterface:down()
            end
            return o
        end)()
        self.inputProcessorArray[Canvas.LEFT + 1] = (function()
            local o = GameInputProcessor.new and GameInputProcessor.new() or setmetatable({}, {__index = GameInputProcessor})
            

            -- throws Exception
        function o:processEvent(allbinaryLayerManager, gameKeyEvent)
                testInputInterface:left()
            end
            return o
        end)()
        self.inputProcessorArray[Canvas.RIGHT + 1] = (function()
            local o = GameInputProcessor.new and GameInputProcessor.new() or setmetatable({}, {__index = GameInputProcessor})
            

            -- throws Exception
        function o:processEvent(allbinaryLayerManager, gameKeyEvent)
                testInputInterface:right()
            end
            return o
        end)()
        self.inputProcessorArray[Canvas.KEY_NUM7 + 1] = (function()
            local o = GameInputProcessor.new and GameInputProcessor.new() or setmetatable({}, {__index = GameInputProcessor})
            

            -- throws Exception
        function o:processEvent(allbinaryLayerManager, gameKeyEvent)
                testInputInterface:strafeLeft()
            end
            return o
        end)()
        self.inputProcessorArray[Canvas.KEY_NUM9 + 1] = (function()
            local o = GameInputProcessor.new and GameInputProcessor.new() or setmetatable({}, {__index = GameInputProcessor})
            

            -- throws Exception
        function o:processEvent(allbinaryLayerManager, gameKeyEvent)
                testInputInterface:strafeRight()
            end
            return o
        end)()
        GameInputProcessorUtil.init(self.inputProcessorArray)
end


-- throws Exception
function TestingInputSingleton:processInputList(allbinaryLayerManager, list)
        local key = 0
        local gameKeyEvent = nil
        local size = list:size()
        for index = 0, size - 1 do
            gameKeyEvent = (list.objectArray[index + 1])
            key = gameKeyEvent:getKey()
            self.inputProcessorArray[key + 1]:processEvent(allbinaryLayerManager, GameKeyEvent.NONE)
        end
end


-- throws Exception
function TestingInputSingleton:processInput(allbinaryLayerManager)
        self:processInputList(allbinaryLayerManager, self:getGameKeyEventList())
        self:getGameKeyEventList():clear()
end


function TestingInputSingleton:paint(graphics)
        self.paintable:paint(graphics)
end


function TestingInputSingleton:implmentsGameInputInterface()
        return true
end

TestingInputSingleton.instance = TestingInputSingleton.new()

return TestingInputSingleton

