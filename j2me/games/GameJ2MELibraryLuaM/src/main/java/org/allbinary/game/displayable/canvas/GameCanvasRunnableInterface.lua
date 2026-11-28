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

local GameCanvasRunnableInterface = {}
package.loaded["org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface"] = GameCanvasRunnableInterface

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
local ItemStateListener = require("javax.microedition.lcdui.ItemStateListener")
local GameStateCompositeInterface = require("org.allbinary.game.state.GameStateCompositeInterface")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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

-- Java interface
-- class table GameCanvasRunnableInterface is declared before the requires
GameCanvasRunnableInterface.__index = GameCanvasRunnableInterface
GameCanvasRunnableInterface.className = "GameCanvasRunnableInterface"
GameCanvasRunnableInterface.javaClassName = "org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface"
setmetatable(GameCanvasRunnableInterface, {__index = RunnableInterface})
GameCanvasRunnableInterface.java_interfaces = function() return {RunnableInterface, PaintableInterface, ItemStateListener, GameStateCompositeInterface} end


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

