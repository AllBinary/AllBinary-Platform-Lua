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

local BasicHighScoresGameInfoFactory = {}
package.loaded["org.allbinary.game.BasicHighScoresGameInfoFactory"] = BasicHighScoresGameInfoFactory

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

local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local GameMode = java_lazy("org.allbinary.game.GameMode")
local GameTypeFactory = java_lazy("org.allbinary.game.GameTypeFactory")
local PlayerTypesFactory = java_lazy("org.allbinary.game.PlayerTypesFactory")

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

-- class table BasicHighScoresGameInfoFactory is declared before the requires
BasicHighScoresGameInfoFactory.__index = BasicHighScoresGameInfoFactory
BasicHighScoresGameInfoFactory.className = "BasicHighScoresGameInfoFactory"
BasicHighScoresGameInfoFactory.javaClassName = "org.allbinary.game.BasicHighScoresGameInfoFactory"

function BasicHighScoresGameInfoFactory:_init_fields()
    self.MULTI_PLAYER_SERVER = GameInfo.new(GameTypeFactory.getInstance().MULTI_PLAYER, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 0, 0)
    self.SINGLE_PLAYER_SERVER = GameInfo.new(GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 0, 0)
end

function BasicHighScoresGameInfoFactory._jinit(self)
    BasicHighScoresGameInfoFactory._init_fields(self)
    return self
end

function BasicHighScoresGameInfoFactory.new()
    return BasicHighScoresGameInfoFactory._jinit(setmetatable({}, BasicHighScoresGameInfoFactory))
end


function BasicHighScoresGameInfoFactory.getInstance()
        return BasicHighScoresGameInfoFactory.SINGLETON
end

BasicHighScoresGameInfoFactory.SINGLETON = BasicHighScoresGameInfoFactory.new()

return BasicHighScoresGameInfoFactory

