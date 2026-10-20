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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local HighScoresCanvas = require("org.allbinary.game.score.displayable.HighScoresCanvas")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScoresCanvasInputProcessor = {}
HighScoresCanvasInputProcessor.__index = HighScoresCanvasInputProcessor
HighScoresCanvasInputProcessor.className = "HighScoresCanvasInputProcessor"
setmetatable(HighScoresCanvasInputProcessor, {__index = PlayerGameInput})

function HighScoresCanvasInputProcessor:_init_fields()
    self.highScoresCanvas = nil
end


function HighScoresCanvasInputProcessor.new(highScoresCanvas)
    local self = setmetatable(PlayerGameInput.new(BasicArrayListD.new(), BasicArrayListD.new(), -1), HighScoresCanvasInputProcessor)
    self:_init_fields()
        -- super(...) made self above
        self.highScoresCanvas = highScoresCanvas
    return self
end


function HighScoresCanvasInputProcessor:open()
end


function HighScoresCanvasInputProcessor:close()
end


function HighScoresCanvasInputProcessor:onPressGameKeyEvent(gameKeyEvent)
        PlayerGameInput.onPressGameKeyEvent(self, gameKeyEvent)
        self:update()
end


function HighScoresCanvasInputProcessor:onDownGameKeyEvent(gameKeyEvent)
        PlayerGameInput.onDownGameKeyEvent(self, gameKeyEvent)
        self:update()
end


function HighScoresCanvasInputProcessor:onUpGameKeyEvent(gameKeyEvent)
        PlayerGameInput.onUpGameKeyEvent(self, gameKeyEvent)
        self:update()
end


function HighScoresCanvasInputProcessor:paint(graphics)
end


function HighScoresCanvasInputProcessor:getHighScoresCanvas()
        return self.highScoresCanvas
end

return HighScoresCanvasInputProcessor

