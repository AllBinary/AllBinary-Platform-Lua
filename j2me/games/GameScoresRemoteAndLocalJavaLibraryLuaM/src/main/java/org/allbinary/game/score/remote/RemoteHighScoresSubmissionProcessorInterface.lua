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
-- package org.allbinary.game.score.remote

local HighScore = require("org.allbinary.game.score.HighScore")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local RemoteHighScoresSubmissionProcessorInterface = {}
RemoteHighScoresSubmissionProcessorInterface.__index = RemoteHighScoresSubmissionProcessorInterface
RemoteHighScoresSubmissionProcessorInterface.className = "RemoteHighScoresSubmissionProcessorInterface"


function RemoteHighScoresSubmissionProcessorInterface:process(remoteHighScores, abeClientInformation, highScore)
    error("abstract method process")
end

return RemoteHighScoresSubmissionProcessorInterface

