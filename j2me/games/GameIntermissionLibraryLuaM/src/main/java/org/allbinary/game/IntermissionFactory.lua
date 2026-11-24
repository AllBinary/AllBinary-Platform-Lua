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

local IntermissionFactory = {}
package.loaded["org.allbinary.game.IntermissionFactory"] = IntermissionFactory

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

local GameState = java_lazy("org.allbinary.game.state.GameState")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")

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

-- class table IntermissionFactory is declared before the requires
IntermissionFactory.__index = IntermissionFactory
IntermissionFactory.className = "IntermissionFactory"
IntermissionFactory.javaClassName = "org.allbinary.game.IntermissionFactory"

function IntermissionFactory:_init_fields()
    self.START_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("START_LEVEL_INTERMISSION_GAME_STATE")
    self.WAIT_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("WAIT_LEVEL_INTERMISSION_GAME_STATE")
    self.SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE")
    self.SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE")
end

function IntermissionFactory._jinit(self)
    IntermissionFactory._init_fields(self)
    return self
end

function IntermissionFactory.new()
    return IntermissionFactory._jinit(setmetatable({}, IntermissionFactory))
end


function IntermissionFactory.getInstance()
        return IntermissionFactory.instance_f
end

IntermissionFactory.instance_f = IntermissionFactory.new()

return IntermissionFactory

