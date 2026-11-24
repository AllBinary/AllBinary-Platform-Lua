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
-- package org.allbinary.game.input.mapping

local GameInputMapping = {}
package.loaded["org.allbinary.game.input.mapping.GameInputMapping"] = GameInputMapping

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

local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table GameInputMapping is declared before the requires
GameInputMapping.__index = GameInputMapping
GameInputMapping.className = "GameInputMapping"
GameInputMapping.javaClassName = "org.allbinary.game.input.mapping.GameInputMapping"

function GameInputMapping:_init_fields()
    self.name_f = StringUtil.getInstance().EMPTY_STRING
    self.gameKey = GameKey.NULL_GAME_KEY
end


function GameInputMapping._jinit(self, name, gameKey)
    GameInputMapping._init_fields(self)
        self:setName(name)
        self:setGameKey(gameKey)
    return self
end

function GameInputMapping.new(...)
    local self = setmetatable({}, GameInputMapping)
    GameInputMapping._jinit(self, ...)
    return self
end


function GameInputMapping:setGameKey(gameKey)
        self.gameKey = gameKey
end


function GameInputMapping:getGameKey()
        return self.gameKey
end


function GameInputMapping:setName(name)
        self.name_f = name
end


function GameInputMapping:getName()
        return self.name_f
end

return GameInputMapping

