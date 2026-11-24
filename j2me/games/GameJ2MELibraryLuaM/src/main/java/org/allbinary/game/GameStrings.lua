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

local GameStrings = {}
package.loaded["org.allbinary.game.GameStrings"] = GameStrings

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

-- class table GameStrings is declared before the requires
GameStrings.__index = GameStrings
GameStrings.className = "GameStrings"
GameStrings.javaClassName = "org.allbinary.game.GameStrings"

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

function GameStrings._jinit(self)
    GameStrings._init_fields(self)
    return self
end

function GameStrings.new()
    return GameStrings._jinit(setmetatable({}, GameStrings))
end


function GameStrings.getInstance()
        return GameStrings.instance_f
end

GameStrings.instance_f = GameStrings.new()

return GameStrings

