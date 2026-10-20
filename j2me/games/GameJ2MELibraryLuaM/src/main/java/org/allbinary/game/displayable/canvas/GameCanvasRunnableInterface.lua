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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local ItemStateListener = require("javax.microedition.lcdui.ItemStateListener")
local GameStateCompositeInterface = require("org.allbinary.game.state.GameStateCompositeInterface")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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
local GameCanvasRunnableInterface = {}
GameCanvasRunnableInterface.__index = GameCanvasRunnableInterface
GameCanvasRunnableInterface.className = "GameCanvasRunnableInterface"
setmetatable(GameCanvasRunnableInterface, {__index = RunnableInterface})


function GameCanvasRunnableInterface:getTitle()
    error("abstract method getTitle")
end


function GameCanvasRunnableInterface:isInitialized()
    error("abstract method isInitialized")
end


function GameCanvasRunnableInterface:isPaused()
    error("abstract method isPaused")
end


function GameCanvasRunnableInterface:unPause()
    error("abstract method unPause")
end


function GameCanvasRunnableInterface:pause()
    error("abstract method pause")
end


function GameCanvasRunnableInterface:isHighScoreSubmitted()
    error("abstract method isHighScoreSubmitted")
end


-- throws Exception
function GameCanvasRunnableInterface:setHighScoreSubmitted(highScoreSubmitted)
    error("abstract method setHighScoreSubmitted")
end


-- throws Exception
function GameCanvasRunnableInterface:processGameOver()
    error("abstract method processGameOver")
end


function GameCanvasRunnableInterface:isGameOver()
    error("abstract method isGameOver")
end


function GameCanvasRunnableInterface:initCommands(cmdListener)
    error("abstract method initCommands")
end


-- throws Exception
function GameCanvasRunnableInterface:getCurrentStateHashtable()
    error("abstract method getCurrentStateHashtable")
end


-- throws Exception
function GameCanvasRunnableInterface:getLoadStateHashtable()
    error("abstract method getLoadStateHashtable")
end


-- throws Exception
function GameCanvasRunnableInterface:setLoadStateHashtable(hashtable)
    error("abstract method setLoadStateHashtable")
end


function GameCanvasRunnableInterface:getType()
    error("abstract method getType")
end

return GameCanvasRunnableInterface

