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
-- package org.allbinary.game.state

local GameStateFactory = {}
package.loaded["org.allbinary.game.state.GameStateFactory"] = GameStateFactory

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local GameState = java_lazy("org.allbinary.game.state.GameState")

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

-- class table GameStateFactory is declared before the requires
GameStateFactory.__index = GameStateFactory
GameStateFactory.className = "GameStateFactory"
GameStateFactory.javaClassName = "org.allbinary.game.state.GameStateFactory"

function GameStateFactory:_init_fields()
    self.index = 0
    self.NO_GAME_STATE = self:createGameState("NO_GAME_STATE")
    self.PLAYING_GAME_STATE = self:createGameState("PLAYING_GAME_STATE")
    self.SHOW_END_RESULT_GAME_STATE = self:createGameState("SHOW_END_RESULT_GAME_STATE")
    self.SHOW_HIGH_SCORE_GAME_STATE = self:createGameState("SHOW_HIGH_SCORE_GAME_STATE")
end


function GameStateFactory.getInstance()
        if rawequal(GameStateFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            GameStateFactory.instance_f = GameStateFactory.new()
        end
        return GameStateFactory.instance_f
end


function GameStateFactory._jinit(self)
    GameStateFactory._init_fields(self)
    return self
end

function GameStateFactory.new(...)
    local self = setmetatable({}, GameStateFactory)
    GameStateFactory._jinit(self, ...)
    return self
end


function GameStateFactory:createGameState(name)
        return GameState.new(name, (function() local value = self.index self.index = value + 1 return value end)())
end

GameStateFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return GameStateFactory

