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

local Processor = require("org.allbinary.canvas.Processor")
local HighScores = require("org.allbinary.game.score.HighScores")
local HighScoresHelperBase = require("org.allbinary.game.score.HighScoresHelperBase")
local NullHighScoresSingletonFactory = require("org.allbinary.game.score.NullHighScoresSingletonFactory")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EndGameProcessor = {}
EndGameProcessor.__index = EndGameProcessor
EndGameProcessor.className = "EndGameProcessor"
setmetatable(EndGameProcessor, {__index = Processor})

function EndGameProcessor:_init_fields()
    self.gameStateFactory = GameStateFactory.getInstance()
    self.gameCanvas = nil
    self.WAIT = 5000
end


function EndGameProcessor.new(gameCanvas)
    local self = setmetatable(Processor.new(), EndGameProcessor)
    self:_init_fields()
        self.gameCanvas = gameCanvas
    return self
end


-- throws Exception
function EndGameProcessor:process()
        if self.gameCanvas:isHighScoreSubmitted() then
            if self.gameCanvas:getGameStateTimeHelper():isElapsedTNT(self.WAIT) then
                if self.gameCanvas:getGameState() == self.gameStateFactory.SHOW_END_RESULT_GAME_STATE then
                    local highScoresBase = self.gameCanvas.highScoresHelper
                    local highScores = highScoresBase:getSelectedHighScores()
                    if highScores ~= NullHighScoresSingletonFactory.getInstance() then
                        highScoresBase:selectHighScores()
                        self.gameCanvas:getRealHighScoresPaintable():setHighScores(highScores)
                        self.gameCanvas:setGameState(self.gameStateFactory.SHOW_HIGH_SCORE_GAME_STATE)
                        self.gameCanvas:setHighScoresPaintable(self.gameCanvas:getRealHighScoresPaintable())
                    end
                elseif self.gameCanvas:getGameState() == self.gameStateFactory.SHOW_HIGH_SCORE_GAME_STATE then
                    self.gameCanvas:setGameState(self.gameStateFactory.SHOW_END_RESULT_GAME_STATE)
                    self.gameCanvas:setHighScoresPaintable(NullPaintable.getInstance())
                end
            end
        end
end

return EndGameProcessor

