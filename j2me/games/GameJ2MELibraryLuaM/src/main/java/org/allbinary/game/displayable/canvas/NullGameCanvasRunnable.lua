-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Item = require("javax.microedition.lcdui.Item")
local GameState = require("org.allbinary.game.state.GameState")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullGameCanvasRunnable = {}
NullGameCanvasRunnable.__index = NullGameCanvasRunnable
NullGameCanvasRunnable.className = "NullGameCanvasRunnable"

function NullGameCanvasRunnable:_init_fields()
    self.gameStateFactory = GameStateFactory.getInstance()
end

function NullGameCanvasRunnable.new()
    local self = setmetatable({}, NullGameCanvasRunnable)
    self:_init_fields()
    return self
end


function NullGameCanvasRunnable:getTitle()
        return StringUtil.getInstance().EMPTY_STRING
end


function NullGameCanvasRunnable:isInitialized()
        return false
end


function NullGameCanvasRunnable:isPaused()
        return false
end


function NullGameCanvasRunnable:unPause()
end


function NullGameCanvasRunnable:pause()
end


function NullGameCanvasRunnable:isHighScoreSubmitted()
        return false
end


-- throws Exception
function NullGameCanvasRunnable:setHighScoreSubmitted(highScoreSubmitted)
end


-- throws Exception
function NullGameCanvasRunnable:processGameOver()
end


function NullGameCanvasRunnable:isGameOver()
        return false
end


function NullGameCanvasRunnable:initCommands(cmdListener)
end


-- throws Exception
function NullGameCanvasRunnable:getCurrentStateHashtable()
        return StdUtil.getInstance().NULL_TABLE
end


-- throws Exception
function NullGameCanvasRunnable:getLoadStateHashtable()
        return StdUtil.getInstance().NULL_TABLE
end


-- throws Exception
function NullGameCanvasRunnable:setLoadStateHashtable(hashtable)
end


function NullGameCanvasRunnable:getType()
        return -1
end


-- throws Exception
function NullGameCanvasRunnable:setGameState(gameState)
end


function NullGameCanvasRunnable:getGameState()
        return self.gameStateFactory.NO_GAME_STATE
end


function NullGameCanvasRunnable:itemStateChanged(item)
end


function NullGameCanvasRunnable:paint(graphics)
end


function NullGameCanvasRunnable:paintThreed(graphics)
end


function NullGameCanvasRunnable:isRunning()
        return false
end


function NullGameCanvasRunnable:setRunning(isRunning)
end


-- throws Exception
function NullGameCanvasRunnable:setThread(thread)
end


function NullGameCanvasRunnable:run()
end

NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE = NullGameCanvasRunnable.new()

return NullGameCanvasRunnable

