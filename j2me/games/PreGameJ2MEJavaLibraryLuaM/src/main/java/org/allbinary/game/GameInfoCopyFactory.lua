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
-- package org.allbinary.game


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInfoCopyFactory = {}
GameInfoCopyFactory.__index = GameInfoCopyFactory
GameInfoCopyFactory.className = "GameInfoCopyFactory"

function GameInfoCopyFactory.new()
    local self = setmetatable({}, GameInfoCopyFactory)
    return self
end


function GameInfoCopyFactory.getInstanceMaxLevel(gameInfo, maxLevel)
        return GameInfo.new(gameInfo:getGameType(), gameInfo:getGameMode(), gameInfo:getPlayerType(), maxLevel, gameInfo:getCurrentLevel())
end


function GameInfoCopyFactory.getInstance(gameInfo)
        return GameInfo.new(gameInfo:getGameType(), gameInfo:getGameMode(), gameInfo:getPlayerType(), gameInfo:getHighestLevel(), gameInfo:getCurrentLevel())
end

return GameInfoCopyFactory

