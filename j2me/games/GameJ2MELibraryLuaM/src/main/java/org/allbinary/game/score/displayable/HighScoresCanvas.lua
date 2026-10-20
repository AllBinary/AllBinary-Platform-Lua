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
-- package org.allbinary.game.score.displayable

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local GameInfo = require("org.allbinary.game.GameInfo")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ColorFillBasePaintable = require("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = require("org.allbinary.game.paint.ColorFillPaintableFactory")
local HighScoreCommandsFactory = require("org.allbinary.game.score.HighScoreCommandsFactory")
local HighScores = require("org.allbinary.game.score.HighScores")
local HighScoresCanvasInputProcessor = require("org.allbinary.game.score.HighScoresCanvasInputProcessor")
local HighScoresCanvasInputProcessorFactoryInterface = require("org.allbinary.game.score.HighScoresCanvasInputProcessorFactoryInterface")
local HighScoresFactoryInterface = require("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresHelperBase = require("org.allbinary.game.score.HighScoresHelperBase")
local HighScoresPaintable = require("org.allbinary.game.score.HighScoresPaintable")
local HighScoresResultsListener = require("org.allbinary.game.score.HighScoresResultsListener")
local NoHighScoresFactory = require("org.allbinary.game.score.NoHighScoresFactory")
local NullHighScoresSingletonFactory = require("org.allbinary.game.score.NullHighScoresSingletonFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local SimpleTextPaintable = require("org.allbinary.graphics.paint.SimpleTextPaintable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ARunnable = require("org.allbinary.thread.ARunnable")
local SecondaryThreadPool = require("org.allbinary.thread.SecondaryThreadPool")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScoresCanvas = {}
HighScoresCanvas.__index = HighScoresCanvas
HighScoresCanvas.className = "HighScoresCanvas"
setmetatable(HighScoresCanvas, {__index = GameCommandCanvas})

function HighScoresCanvas:_init_fields()
    self.paintable = NullPaintable.getInstance()
    self.highScoreCommandsFactory = HighScoreCommandsFactory.getInstance()
    self.waitPaintable = SimpleTextPaintable.new(self.commonStrings.PLEASE_WAIT_FOR_SERVER, BasicColorFactory.getInstance().WHITE)
    self.highScoresPaintable = nil
    self.highScoresFactoryInterface = nil
    self.colorFillPaintable = nil
    self.highScoresHelper = HighScoresHelperBase.new()
    self.gameInfo = nil
    self.highScoresCanvasInputProcessor = nil
    self.currentCommand = self.highScoreCommandsFactory.HIGH_SCORE_COMMANDS[1]
    self.hasPainted = false
end


function HighScoresCanvas.new(commandListener, allBinaryGameLayerManager, gameInfo, paintable, highScoresFactoryInterface, highScoresCanvasInputProcessorFactoryInterface)
    local self = setmetatable(GameCommandCanvas.new(commandListener, HighScoresCanvas.NAME, allBinaryGameLayerManager:getBackgroundBasicColor(), allBinaryGameLayerManager:getForegroundBasicColor()), HighScoresCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.highScoresPaintable = paintable
        self.highScoresFactoryInterface = highScoresFactoryInterface
        self.highScoresCanvasInputProcessor = highScoresCanvasInputProcessorFactoryInterface:getInstance(self)
        self.gameInfo = gameInfo
        self.waitPaintable:setBasicColorP(allBinaryGameLayerManager:getForegroundBasicColor())
        self:getHighScoresPaintable():setBasicColorP(allBinaryGameLayerManager:getForegroundBasicColor())
        self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(allBinaryGameLayerManager:getBackgroundBasicColor(), false)
        if self.highScoresHelper:getHighScoresArray() == NoHighScoresFactory.getInstance().NO_HIGH_SCORES then
            self:setPaintable(self.waitPaintable)
        else
            self.logUtil:putF("Show HighScores that are already loaded", self, self.commonStrings.CONSTRUCTOR)
            self:updateCommand(self.currentCommand)
            self:setPaintable(self:getHighScoresPaintable())
        end
        local HighScoreRunnable = {}
        HighScoreRunnable.__index = HighScoreRunnable
        HighScoreRunnable.className = "HighScoreRunnable"
        setmetatable(HighScoreRunnable, {__index = ARunnable})

        function HighScoreRunnable:_init_fields()
            self.highScoresCanvas = nil
        end
        

        function HighScoresCanvas.new(highScoresCanvas)
            local self = setmetatable(ARunnable.new(), HighScoresCanvas)
            self:_init_fields()
                self.highScoresCanvas = highScoresCanvas
            return self
        end
        

        function HighScoresCanvas:run()
                local commonStrings = CommonStrings.getInstance()
                local logUtil = LogUtil.getInstance()
                local highScoresCanvas = self.highScoresCanvas
                local try_ok, try_error = pcall(function()
                    local isHTML = J2MEUtil.isHTML()
                    if not isHTML then
                        while not highScoresCanvas.hasPainted do
                        end
                        highScoresCanvas.hasPainted = false
                    end
                    local stringMaker = StringMaker.new()
                    local systemWrapper = ABSystemWrapper.getInstance()
                    local currentTimeMillis = systemWrapper:currentTimeMillis()
                    logUtil:putF(tostring(stringMaker:append("HighScoresCanvas - Request repaint to be sure: "):appendlong(currentTimeMillis)), self, commonStrings.RUN)
                    highScoresCanvas.repaintBehavior:onChangeRepaint(highScoresCanvas)
                    if not isHTML then
                        while not highScoresCanvas.hasPainted do
                        end
                    end
                    stringMaker:delete(0, stringMaker:length())
                    logUtil:putF(tostring(stringMaker:append("HighScoresCanvas - Now that the canvas has completed repaint go ahead and fetch the scores: "):appendlong(currentTimeMillis)), self, commonStrings.RUN)
                    highScoresCanvas:executeUpdate()
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
                end
        end

        SecondaryThreadPool.getInstance():runTask(HighScoreRunnable.new(self))
    return self
end


function HighScoresCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end


function HighScoresCanvas:open()
        GameCommandCanvas.open(self)
        self.highScoresCanvasInputProcessor:open()
end


-- throws Exception
function HighScoresCanvas:close()
        GameCommandCanvas.close(self)
        self.highScoresCanvasInputProcessor:close()
end


function HighScoresCanvas:paint(graphics)
        self.colorFillPaintable:paint(graphics)
        self.paintable:paint(graphics)
        if self.waitPaintable ~= self.paintable then
            self.highScoresCanvasInputProcessor:paint(graphics)
        end
        GameCommandCanvas.paint(self, graphics)
        self.hasPainted = true
end


function HighScoresCanvas:executeUpdate()
        local try_ok, try_error = pcall(function()
            self.highScoresFactoryInterface:fetchHighScores(self:getGameInfo(), self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end


function HighScoresCanvas:getHighScoresPaintable()
        return self.highScoresPaintable
end


function HighScoresCanvas:setHighScoresArray(highScoresArray)
        local try_ok, try_error = pcall(function()
            if highScoresArray ~= nil then
                self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):appendint((highScoresArray.n or #highScoresArray))), self, "setHighScoresArray")
            else
                self.logUtil:putF(self.commonStrings.START, self, "setHighScoresArray")
            end
            self.highScoresHelper:setHighScoresArray(highScoresArray)
            self:updateCommand(self.currentCommand)
            self:setPaintable(self:getHighScoresPaintable())
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end


-- throws Exception
function HighScoresCanvas:updateCommand(command)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(self.stringUtil:toString(command))), self, self.commonStrings.UPDATE)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        if self.highScoreCommandsFactory:isHighScoreCommand(command) then
            local index = self.highScoreCommandsFactory:getIndex(command)
            local nextIndex = index + 1
            local highScoresArray = self.highScoresHelper:getHighScoresArray()
            if nextIndex >= (highScoresArray.n or #highScoresArray) then
                nextIndex = 0
            end
            if (highScoresArray.n or #highScoresArray) > 0 then
                self:getHighScoresPaintable():setHighScores(highScoresArray[index + 1])
            else
                self:getHighScoresPaintable():setHighScores(NullHighScoresSingletonFactory.getInstance())
            end
            if index ~= nextIndex then
                self:removeAllCommands()
                self:addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS)
                self:addCommand(self.highScoreCommandsFactory.HIGH_SCORE_COMMANDS[nextIndex + 1])
            end
        end
        self.currentCommand = command
        self:close()
        GameCommandCanvas.initMenu(self)
        self:open()
        self.repaintBehavior:onChangeRepaint(self)
end


function HighScoresCanvas:getGameInfo()
        return self.gameInfo
end


function HighScoresCanvas:setPaintable(paintable)
        self.paintable = paintable
        self.repaintBehavior:onChangeRepaint(self)
end

HighScoresCanvas.NAME = "HighScoresCanvas"

return HighScoresCanvas

