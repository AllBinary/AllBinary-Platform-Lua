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

local GameKeyFactory = {}
package.loaded["org.allbinary.game.input.GameKeyFactory"] = GameKeyFactory

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")

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

-- class table GameKeyFactory is declared before the requires
GameKeyFactory.__index = GameKeyFactory
GameKeyFactory.className = "GameKeyFactory"
GameKeyFactory.javaClassName = "org.allbinary.game.input.GameKeyFactory"

function GameKeyFactory:_init_fields()
    self.NONE = GameKey.new(InputFactory.getInstance().MAX - 1, "None")
    self.UP = GameKey.new(Canvas.UP, CommonPhoneStrings.getInstance().UP)
    self.DOWN = GameKey.new(Canvas.DOWN, CommonPhoneStrings.getInstance().DOWN)
    self.LEFT = GameKey.new(Canvas.LEFT, CommonPhoneStrings.getInstance().LEFT)
    self.RIGHT = GameKey.new(Canvas.RIGHT, CommonPhoneStrings.getInstance().RIGHT)
    self.KEY_POUND = GameKey.new(Canvas.KEY_POUND, "POUND")
    self.KEY_STAR = GameKey.new(Canvas.KEY_STAR, "STAR")
    self.KEY_NUM0 = GameKey.new(Canvas.KEY_NUM0, CommonPhoneStrings.getInstance().ZERO)
    self.KEY_NUM1 = GameKey.new(Canvas.KEY_NUM1, CommonPhoneStrings.getInstance().ONE)
    self.KEY_NUM2 = GameKey.new(Canvas.KEY_NUM2, CommonPhoneStrings.getInstance().TWO)
    self.KEY_NUM3 = GameKey.new(Canvas.KEY_NUM3, CommonPhoneStrings.getInstance().THREE)
    self.KEY_NUM4 = GameKey.new(Canvas.KEY_NUM4, CommonPhoneStrings.getInstance().FOUR)
    self.KEY_NUM5 = GameKey.new(Canvas.KEY_NUM5, CommonPhoneStrings.getInstance().FIVE)
    self.KEY_NUM6 = GameKey.new(Canvas.KEY_NUM6, CommonPhoneStrings.getInstance().SIX)
    self.KEY_NUM7 = GameKey.new(Canvas.KEY_NUM7, CommonPhoneStrings.getInstance().SEVEN)
    self.KEY_NUM8 = GameKey.new(Canvas.KEY_NUM8, CommonPhoneStrings.getInstance().EIGHT)
    self.KEY_NUM9 = GameKey.new(Canvas.KEY_NUM9, CommonPhoneStrings.getInstance().NINE)
    self.GAME_A = GameKey.new(Canvas.GAME_A, "Game A")
    self.GAME_B = GameKey.new(Canvas.GAME_B, "Game B")
    self.GAME_C = GameKey.new(Canvas.GAME_C, "Game C")
    self.GAME_D = GameKey.new(Canvas.GAME_D, "Game D")
    self.FIRE = GameKey.new(Canvas.FIRE, CommonPhoneStrings.getInstance().FIRE)
    self.LEVEL_DOWN = GameKey.new(Canvas.KEY_NUM9 + 1, "Cheat Level Up")
    self.LEVEL_UP = GameKey.new(Canvas.KEY_NUM9 + 2, "Cheat Level Down")
end

function GameKeyFactory._jinit(self)
    GameKeyFactory._init_fields(self)
    return self
end

function GameKeyFactory.new()
    return GameKeyFactory._jinit(setmetatable({}, GameKeyFactory))
end


function GameKeyFactory.getInstance()
        if rawequal(GameKeyFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            GameKeyFactory.instance_f = GameKeyFactory.new()
        end
        return GameKeyFactory.instance_f
end

GameKeyFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return GameKeyFactory

