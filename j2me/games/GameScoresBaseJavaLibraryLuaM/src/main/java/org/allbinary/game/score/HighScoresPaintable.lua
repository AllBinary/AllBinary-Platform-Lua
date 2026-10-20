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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = require("org.allbinary.graphics.Anchor")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ColorChangeEvent = require("org.allbinary.graphics.color.ColorChangeEvent")
local ColorChangeListener = require("org.allbinary.graphics.color.ColorChangeListener")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
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

local HighScoresPaintable = {}
HighScoresPaintable.__index = HighScoresPaintable
HighScoresPaintable.className = "HighScoresPaintable"
setmetatable(HighScoresPaintable, {__index = Paintable})

function HighScoresPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.highScores = NullHighScoresSingletonFactory.getInstance()
    self.anchor = Anchor.TOP_LEFT
    self.charHeight = 0
end


function HighScoresPaintable.new()
    local self = setmetatable(Paintable.new(), HighScoresPaintable)
    self:_init_fields()
    return self
end


function HighScoresPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.charHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function HighScoresPaintable:onEvent(eventObject)
        local colorChangeEvent = eventObject
        self.basicColor = colorChangeEvent:getBasicColorP()
end


function HighScoresPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local width = self.displayInfoSingleton:getLastWidth()
        local height = self.displayInfoSingleton:getLastHeight()
        graphics:setColor(math.tointeger(self:getBasicColorP() // 1))
        local heading = self.highScores:getHeading()
        local topScoresWidth = (((graphics:getFont():stringWidth(heading)) // (1 << (1))))
        local charHeight = self.charHeight
        graphics:drawString(heading, (((width) // (1 << (1)))) - topScoresWidth, charHeight, self.anchor)
        graphics:drawString(self.highScores:getColumnOneHeading(), 10, charHeight * 3, self.anchor)
        local columnTwoHeading = self.highScores:getColumnTwoHeading()
        local columnTwoHeadingWidth = graphics:getFont():stringWidth(columnTwoHeading)
        graphics:drawString(columnTwoHeading, width - 10 - columnTwoHeadingWidth, charHeight * 3, self.anchor)
        local index = 4
        local largestSecondColumnWidth = columnTwoHeadingWidth
        local list = self.highScores:getList()
        local size = list:size()
        local vectorIndex = 0
        local highScore = nil
        while vectorIndex < size and charHeight * index < height - (charHeight * 2) do
            highScore = list.objectArray[vectorIndex + 1]
            local nextScoreWidth = graphics:getFont():stringWidth(highScore:getScoreString())
            if nextScoreWidth > largestSecondColumnWidth then
                largestSecondColumnWidth = nextScoreWidth
            end
            vectorIndex = vectorIndex + 1
        end
        vectorIndex = 0
        while vectorIndex < size and charHeight * index < height - (charHeight * 2) do
            highScore = list.objectArray[vectorIndex + 1]
            graphics:drawString(highScore:getName(), 10, charHeight * index, self.anchor)
            graphics:drawString(highScore:getScoreString(), width - 10 - largestSecondColumnWidth, charHeight * index, self.anchor)
            index = index + 1
            vectorIndex = vectorIndex + 1
        end
end


function HighScoresPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function HighScoresPaintable:getBasicColorP()
        return self.basicColor
end


function HighScoresPaintable:setHighScores(highScores)
        self.highScores = highScores
end

return HighScoresPaintable

