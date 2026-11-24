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

local GameInfoData = {}
package.loaded["org.allbinary.game.GameInfoData"] = GameInfoData

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

-- class table GameInfoData is declared before the requires
GameInfoData.__index = GameInfoData
GameInfoData.className = "GameInfoData"
GameInfoData.javaClassName = "org.allbinary.game.GameInfoData"

function GameInfoData:_init_fields()
    self.GAME_TYPE = "GAME_TYPE"
    self.GAME_MODE = "GAME_MODE"
    self.PLAYER_TYPE = "PLAYER_TYPE"
    self.HIGHEST_LEVEL = "HIGHEST_LEVEL"
    self.CURRENT_LEVEL = "CURRENT_LEVEL"
    self.SOFTWARE_INFORMATION = "SOFTWARE_INFORMATION"
end


function GameInfoData.getInstance()
        return GameInfoData.instance_f
end


function GameInfoData._jinit(self)
    GameInfoData._init_fields(self)
    return self
end

function GameInfoData.new(...)
    local self = setmetatable({}, GameInfoData)
    GameInfoData._jinit(self, ...)
    return self
end

GameInfoData.instance_f = GameInfoData.new()

return GameInfoData

