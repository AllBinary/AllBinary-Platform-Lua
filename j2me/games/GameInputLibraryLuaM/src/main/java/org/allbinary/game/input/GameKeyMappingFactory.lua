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
-- package org.allbinary.game.input

local GameKeyMappingFactory = {}
package.loaded["org.allbinary.game.input.GameKeyMappingFactory"] = GameKeyMappingFactory

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
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local GameKeyFactory = java_lazy("org.allbinary.game.input.GameKeyFactory")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table GameKeyMappingFactory is declared before the requires
GameKeyMappingFactory.__index = GameKeyMappingFactory
GameKeyMappingFactory.className = "GameKeyMappingFactory"
GameKeyMappingFactory.javaClassName = "org.allbinary.game.input.GameKeyMappingFactory"

function GameKeyMappingFactory:_init_fields()
    self.intKeyToGameKey = java_new_array(nil, InputFactory.getInstance().MAX)
end


function GameKeyMappingFactory.getInstance()
        if GameKeyMappingFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            GameKeyMappingFactory.instance_f = GameKeyMappingFactory.new()
        end
        return GameKeyMappingFactory.instance_f
end


function GameKeyMappingFactory._jinit(self)
    GameKeyMappingFactory._init_fields(self)
        local gameKeyFactory = GameKeyFactory.getInstance()
        self:setGameKey(gameKeyFactory.NONE)
        self:setGameKey(gameKeyFactory.UP)
        self:setGameKey(gameKeyFactory.DOWN)
        self:setGameKey(gameKeyFactory.LEFT)
        self:setGameKey(gameKeyFactory.RIGHT)
        self:setGameKey(gameKeyFactory.KEY_POUND)
        self:setGameKey(gameKeyFactory.KEY_STAR)
        self:setGameKey(gameKeyFactory.KEY_NUM0)
        self:setGameKey(gameKeyFactory.KEY_NUM1)
        self:setGameKey(gameKeyFactory.KEY_NUM2)
        self:setGameKey(gameKeyFactory.KEY_NUM3)
        self:setGameKey(gameKeyFactory.KEY_NUM4)
        self:setGameKey(gameKeyFactory.KEY_NUM5)
        self:setGameKey(gameKeyFactory.KEY_NUM6)
        self:setGameKey(gameKeyFactory.KEY_NUM7)
        self:setGameKey(gameKeyFactory.KEY_NUM8)
        self:setGameKey(gameKeyFactory.KEY_NUM9)
        self:setGameKey(gameKeyFactory.GAME_A)
        self:setGameKey(gameKeyFactory.GAME_B)
        self:setGameKey(gameKeyFactory.GAME_C)
        self:setGameKey(gameKeyFactory.GAME_D)
        self:setGameKey(gameKeyFactory.FIRE)
        self:setGameKey(gameKeyFactory.LEVEL_DOWN)
        self:setGameKey(gameKeyFactory.LEVEL_UP)
    return self
end

function GameKeyMappingFactory.new(...)
    local self = setmetatable({}, GameKeyMappingFactory)
    GameKeyMappingFactory._jinit(self, ...)
    return self
end


function GameKeyMappingFactory:getGameKey(key)
        return self.intKeyToGameKey[key + 1]
end


function GameKeyMappingFactory:setGameKey(gameKey)
        self.intKeyToGameKey[gameKey:getId() + 1] = gameKey
end

GameKeyMappingFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return GameKeyMappingFactory

