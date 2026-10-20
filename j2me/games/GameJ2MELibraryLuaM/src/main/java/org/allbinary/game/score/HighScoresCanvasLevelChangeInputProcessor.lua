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
-- package org.allbinary.game.score

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameKeyEventHandler = require("org.allbinary.game.input.event.GameKeyEventHandler")
local GameKeyEventUtil = require("org.allbinary.game.input.event.GameKeyEventUtil")
local HighScoresCanvas = require("org.allbinary.game.score.displayable.HighScoresCanvas")
local Anchor = require("org.allbinary.graphics.Anchor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HighScoresCanvasInputProcessor = require("org.allbinary.game.score.HighScoresCanvasInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScoresCanvasLevelChangeInputProcessor = {}
HighScoresCanvasLevelChangeInputProcessor.__index = HighScoresCanvasLevelChangeInputProcessor
HighScoresCanvasLevelChangeInputProcessor.className = "HighScoresCanvasLevelChangeInputProcessor"
setmetatable(HighScoresCanvasLevelChangeInputProcessor, {__index = HighScoresCanvasInputProcessor})

function HighScoresCanvasLevelChangeInputProcessor:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.INSTRUCTIONS = "(Right = Next Track, Left = Previous Track)"
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.anchor = Anchor.TOP_LEFT
    self.fontHeight = 0
end


function HighScoresCanvasLevelChangeInputProcessor.new(highScoresCanvas)
    local self = setmetatable(HighScoresCanvasInputProcessor.new(highScoresCanvas), HighScoresCanvasLevelChangeInputProcessor)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function HighScoresCanvasLevelChangeInputProcessor:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function HighScoresCanvasLevelChangeInputProcessor:open()
        GameKeyEventHandler.getInstance():addListener(self)
end


function HighScoresCanvasLevelChangeInputProcessor:close()
        GameKeyEventHandler.getInstance():removeListener(self)
end


function HighScoresCanvasLevelChangeInputProcessor:update()
        local list = self:getGameKeyEventList()
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list.objectArray[index + 1]
            local key = GameKeyEventUtil.getKey(anyType)
            if key == Canvas.RIGHT then
                self:getHighScoresCanvas():getGameInfo():nextGameLevel()
            elseif key == Canvas.LEFT then
                self:getHighScoresCanvas():getGameInfo():previousGameLevel()
            end
            self:getHighScoresCanvas():executeUpdate()
        end
        list:clear()
end


function HighScoresCanvasLevelChangeInputProcessor:paint(graphics)
        self.myFontProcessor:process(graphics)
        local width = self.displayInfoSingleton:getLastWidth()
        local topScoresWidth = (((graphics:getFont():stringWidth(self.INSTRUCTIONS)) // (1 << (1))))
        graphics:drawString(self.INSTRUCTIONS, (((width) // (1 << (1)))) - topScoresWidth, self.fontHeight * 2, self.anchor)
end

return HighScoresCanvasLevelChangeInputProcessor

