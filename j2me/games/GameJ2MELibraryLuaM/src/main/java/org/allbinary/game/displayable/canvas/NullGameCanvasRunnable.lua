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

local NullGameCanvasRunnable = {}
package.loaded["org.allbinary.game.displayable.canvas.NullGameCanvasRunnable"] = NullGameCanvasRunnable

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Item = java_lazy("javax.microedition.lcdui.Item")
local GameState = java_lazy("org.allbinary.game.state.GameState")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table NullGameCanvasRunnable is declared before the requires
NullGameCanvasRunnable.__index = NullGameCanvasRunnable
NullGameCanvasRunnable.className = "NullGameCanvasRunnable"
NullGameCanvasRunnable.javaClassName = "org.allbinary.game.displayable.canvas.NullGameCanvasRunnable"
NullGameCanvasRunnable.java_implements = " GameCanvasRunnableInterface "
NullGameCanvasRunnable.java_interfaces = function() return {GameCanvasRunnableInterface} end

function NullGameCanvasRunnable:_init_fields()
    self.gameStateFactory = GameStateFactory.getInstance()
end

function NullGameCanvasRunnable._jinit(self)
    NullGameCanvasRunnable._init_fields(self)
    return self
end

function NullGameCanvasRunnable.new()
    return NullGameCanvasRunnable._jinit(setmetatable({}, NullGameCanvasRunnable))
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

