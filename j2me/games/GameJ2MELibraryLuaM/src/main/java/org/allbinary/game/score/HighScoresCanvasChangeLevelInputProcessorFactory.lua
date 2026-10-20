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

local HighScoresCanvas = require("org.allbinary.game.score.displayable.HighScoresCanvas")
local HighScoresCanvasInputProcessorFactoryInterface = require("org.allbinary.game.score.HighScoresCanvasInputProcessorFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScoresCanvasChangeLevelInputProcessorFactory = {}
HighScoresCanvasChangeLevelInputProcessorFactory.__index = HighScoresCanvasChangeLevelInputProcessorFactory
HighScoresCanvasChangeLevelInputProcessorFactory.className = "HighScoresCanvasChangeLevelInputProcessorFactory"

function HighScoresCanvasChangeLevelInputProcessorFactory.new()
    local self = setmetatable({}, HighScoresCanvasChangeLevelInputProcessorFactory)
    return self
end


function HighScoresCanvasChangeLevelInputProcessorFactory:getInstance(highScoresCanvas)
        return HighScoresCanvasLevelChangeInputProcessor.new(highScoresCanvas)
end

return HighScoresCanvasChangeLevelInputProcessorFactory

