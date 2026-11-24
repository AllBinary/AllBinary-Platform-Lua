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
-- package org.allbinary.game.state

local RaceGameStateFactory = {}
package.loaded["org.allbinary.game.state.RaceGameStateFactory"] = RaceGameStateFactory

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

-- class table RaceGameStateFactory is declared before the requires
RaceGameStateFactory.__index = RaceGameStateFactory
RaceGameStateFactory.className = "RaceGameStateFactory"
RaceGameStateFactory.javaClassName = "org.allbinary.game.state.RaceGameStateFactory"

function RaceGameStateFactory:_init_fields()
    self.START_GAME_STATE = GameStateFactory.getInstance():createGameState("START_GAME_STATE")
    self.YELLOW_LIGHT_GAME_STATE = GameStateFactory.getInstance():createGameState("YELLOW_LIGHT_GAME_STATE")
    self.RED_LIGHT_GAME_STATE = GameStateFactory.getInstance():createGameState("RED_LIGHT_GAME_STATE")
end

function RaceGameStateFactory._jinit(self)
    RaceGameStateFactory._init_fields(self)
    return self
end

function RaceGameStateFactory.new()
    return RaceGameStateFactory._jinit(setmetatable({}, RaceGameStateFactory))
end


function RaceGameStateFactory.getInstance()
        if RaceGameStateFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            RaceGameStateFactory.instance_f = RaceGameStateFactory.new()
        end
        return RaceGameStateFactory.instance_f
end

RaceGameStateFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return RaceGameStateFactory

