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

local GameStrings = {}
GameStrings.__index = GameStrings
GameStrings.className = "GameStrings"

function GameStrings:_init_fields()
    self.PROCESS_TICK = "processTick"
    self.ON_GAME_INITIALIZED = "onGameInitialized"
    self.UPDATESURFACE = "updateSurface"
    self.ON_SET_DISPLAYABLE = "onSetDisplayable"
    self.UNPAUSE = "unPause"
    self.TOGGLE_MENU = "toggleMenu"
    self.SET_GAME_OVER = "setGameOver"
    self.GAME_STATE = "Game State: "
    self.SET_GAME_STATE = "setGameState"
    self.STOP_GAME_CANVAS_RUNNABLE_INTERFACE = "stopGameCanvasRunnableInterface"
end

function GameStrings.new()
    local self = setmetatable({}, GameStrings)
    self:_init_fields()
    return self
end


function GameStrings.getInstance()
        return GameStrings.instance
end

GameStrings.instance = GameStrings.new()

return GameStrings

