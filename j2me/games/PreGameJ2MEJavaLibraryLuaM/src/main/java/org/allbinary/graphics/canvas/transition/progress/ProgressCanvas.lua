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
-- package org.allbinary.graphics.canvas.transition.progress

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
-- local NullCommandListener = require("javax.microedition.lcdui.NullCommandListener")
local Processor = require("org.allbinary.canvas.Processor")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ABCustomGaugeItem = require("org.allbinary.graphics.form.item.ABCustomGaugeItem")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryMidlet = require("org.allbinary.midlet.AllBinaryMidlet")
local PathFindingThreadPool = require("org.allbinary.thread.PathFindingThreadPool")
local ThreadPool = require("org.allbinary.thread.ThreadPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProgressCanvas = {}
ProgressCanvas.__index = ProgressCanvas
ProgressCanvas.className = "ProgressCanvas"
setmetatable(ProgressCanvas, {__index = RunnableCanvas})
local ProgressPaintable = {}
    ProgressPaintable.__index = ProgressPaintable
    ProgressPaintable.className = "ProgressPaintable"
    setmetatable(ProgressPaintable, {__index = Paintable})
    ProgressCanvas.ProgressPaintable = ProgressPaintable

    function ProgressPaintable:_init_fields()
        self.progressCanvas = nil
    end
    

    function ProgressCanvas.new(progressCanvas)
        local self = setmetatable(Paintable.new(), ProgressCanvas)
        self:_init_fields()
            self.progressCanvas = progressCanvas
        return self
    end
    

    function ProgressCanvas:paint(graphics)
            self.progressCanvas:paint2(graphics)
    end


function ProgressCanvas:_init_fields()
    self.hasPainted = false
    self.backgroundBasicColor = nil
    self.GAUGE_PAINTABLE = ProgressPaintable.new(self)
    self.maxValue = 100.0
    self.gauge = nil
    self.TEXT = self.commonStrings.LOADING
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.allbinaryMidlet = AllBinaryMidlet.getNullInstance()
    self.value = 0.0
    self.text = self.TEXT
    self.background = true
    self.paintable = self.GAUGE_PAINTABLE
    self.inProgress = false
    self.IN_GAME_PROCESSOR = (function()
        local o = Processor.new and Processor.new() or setmetatable({}, {__index = Processor})
        self.pathFindingThreadPool = PathFindingThreadPool.getInstance()
        

        -- throws Exception
    function o:process()
            self.pathFindingThreadPool:runAPriorityTask()
        end
        return o
    end)()
    self.inGameProcessor = Processor.getInstance()
    self.progressEndListener = ProgressEndListener.instance
    self.backgroundLabel = "Background AI Game Loading..."
    self.START_BACKGROUND = "startBackground"
    self.ADD_PORTION = "addPortion"
    self.ADD_EARLY_PORTION = "addEarlyPortion"
end


function ProgressCanvas.new(title, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(RunnableCanvas.new(NullCommandListener.NULL_COMMAND_LISTENER, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST, false), ProgressCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.backgroundBasicColor = backgroundBasicColor
        self.gauge = ABCustomGaugeItem.new(StringUtil.getInstance().EMPTY_STRING, java_int(self.maxValue), 0, backgroundBasicColor, foregroundBasicColor)
    return self
end


function ProgressCanvas:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.gauge:setHeight(font:getHeight() + 2)
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function ProgressCanvas:init(gameMidlet)
        self.allbinaryMidlet = gameMidlet
end


-- throws Exception
function ProgressCanvas:update(graphics)
end


function ProgressCanvas:initCommands(cmdListener)
end


function ProgressCanvas:getMaxValue()
        return self.maxValue
end


function ProgressCanvas:start()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START_METHOD_NAME)
        self:setBackground(true)
        self.gauge:setHeight(30)
        self.gauge:setLabel(self.commonStrings.PLEASE_WAIT)
        self:setText(self.TEXT)
        self:setValue(0)
        self.inGameProcessor = Processor.getInstance()
        self.paintable = self.GAUGE_PAINTABLE
        self.inProgress = true
end


function ProgressCanvas:startBackground(background)
        self.logUtil:putF(self.commonStrings.START, self, self.START_BACKGROUND)
        self:setBackground(background)
        self.myFontProcessor = self.updateMyFontProcessor
        self.gauge:setLabel(self.backgroundLabel)
        self:setText(self.TEXT)
        self:setValue(0)
        self.inGameProcessor = Processor.getInstance()
        self.paintable = self.GAUGE_PAINTABLE
end


function ProgressCanvas:endActual()
        self.allbinaryMidlet:commandAction(GameCommandsFactory.getInstance().SHOW_GAME_CANVAS, NullCanvas.NULL_CANVAS)
        self.inProgress = false
        self:inGame()
end


function ProgressCanvas:inGame()
        self.progressEndListener:onEndEvent()
        self.inGameProcessor = self.IN_GAME_PROCESSOR
end


function ProgressCanvas:end_()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.END_METHOD_NAME)
        self.gauge:setValue(self:getMaxValue())
        self:endActual()
        self.paintable = NullPaintable.getInstance()
end


function ProgressCanvas:endFromInitialLazyLoadingComplete()
        self.progressEndListener:onEndEvent()
        self.gauge:setValue(self:getMaxValue())
        self.inGameProcessor = self.IN_GAME_PROCESSOR
end


function ProgressCanvas:isInGame()
        if self.inGameProcessor == self.IN_GAME_PROCESSOR then
            return true
        end
        return false
end


function ProgressCanvas:endIfPaintedSinceStart()
end


function ProgressCanvas:addEarlyPortion(value, text, index)
        self:setText(tostring(StringMaker.new():append(text):append(tostring(SmallIntegerSingletonFactory.getInstance():getAt(index)))))
        self.gauge:setValue(self.gauge:getValue() + self:getMaxValue() / (value + 0.0))
end


function ProgressCanvas:addPortion(value, text, index)
        self:setText(tostring(StringMaker.new():append(text):append(tostring(SmallIntegerSingletonFactory.getInstance():getAt(index)))))
        PreLogUtil.put(self.text, self, self.ADD_PORTION)
        self.gauge:setValue(self.gauge:getValue() + self:getMaxValue() / (value + 0.0))
end


function ProgressCanvas:addNormalPortion(value, text)
        if self.text ~= text then
            PreLogUtil.put(text, self, self.ADD_PORTION)
        end
        self:setText(text)
        self.gauge:setValue(self.gauge:getValue() + self:getMaxValue() / (value + 0.0))
end


function ProgressCanvas:setValue(value)
        self.value = (value + 0.0)
        self.gauge:setValue((value + 0.0))
end


function ProgressCanvas:paint(graphics)
        self.paintable:paint(graphics)
end


function ProgressCanvas:paint2(graphics)
        self.myFontProcessor:process(graphics)
        graphics:setColor(math.tointeger(self.backgroundBasicColor // 1))
        graphics:fillRect(0, 0, self.displayInfo:getLastWidth(), self.displayInfo:getLastHeight())
        self.gauge:paintXY(graphics, 0, 0)
        self.hasPainted = true
end


function ProgressCanvas:paintThreed(graphics)
end


function ProgressCanvas:getValue()
        return self.value
end


function ProgressCanvas:setText(text)
        self.text = text
end


function ProgressCanvas:getText()
        return self.text
end


function ProgressCanvas:setBackground(background)
        self.background = background
end


function ProgressCanvas:isBackground()
        return self.background
end

return ProgressCanvas

