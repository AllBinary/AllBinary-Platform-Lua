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

local J2MEKeyFactory = {}
package.loaded["org.allbinary.game.input.J2MEKeyFactory"] = J2MEKeyFactory

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

-- class table J2MEKeyFactory is declared before the requires
J2MEKeyFactory.__index = J2MEKeyFactory
J2MEKeyFactory.className = "J2MEKeyFactory"
J2MEKeyFactory.javaClassName = "org.allbinary.game.input.J2MEKeyFactory"

function J2MEKeyFactory:_init_fields()
    self.gameKeyFactory = GameKeyFactory.getInstance()
end


function J2MEKeyFactory.getInstance()
        return J2MEKeyFactory.instance_f
end


function J2MEKeyFactory._jinit(self)
    J2MEKeyFactory._init_fields(self)
    return self
end

function J2MEKeyFactory.new(...)
    local self = setmetatable({}, J2MEKeyFactory)
    J2MEKeyFactory._jinit(self, ...)
    return self
end


function J2MEKeyFactory:init()
        local gameKeyArray = {self.gameKeyFactory.DOWN, self.gameKeyFactory.FIRE, self.gameKeyFactory.GAME_A, self.gameKeyFactory.GAME_B, self.gameKeyFactory.GAME_C, self.gameKeyFactory.GAME_D, self.gameKeyFactory.KEY_NUM0, self.gameKeyFactory.KEY_NUM1, self.gameKeyFactory.KEY_NUM2, self.gameKeyFactory.KEY_NUM3, self.gameKeyFactory.KEY_NUM4, self.gameKeyFactory.KEY_NUM5, self.gameKeyFactory.KEY_NUM6, self.gameKeyFactory.KEY_NUM7, self.gameKeyFactory.KEY_NUM8, self.gameKeyFactory.KEY_NUM9, self.gameKeyFactory.KEY_POUND, self.gameKeyFactory.KEY_STAR, self.gameKeyFactory.LEFT, self.gameKeyFactory.LEVEL_DOWN, self.gameKeyFactory.LEVEL_UP, self.gameKeyFactory.NONE, self.gameKeyFactory.RIGHT, self.gameKeyFactory.UP}
        local inputFactory = InputFactory.getInstance()
        do
            local index = (gameKeyArray.n or #gameKeyArray)
            while (function() index = index - 1 return index end)() >= 0 do
            inputFactory:add(gameKeyArray[index + 1]:getId(), gameKeyArray[index + 1])
            end
        end
end


function J2MEKeyFactory:isSubmission(input)
        if input == self.gameKeyFactory.FIRE then
            return true
        end
        return false
end


function J2MEKeyFactory:isDelete(input)
        if input == self.gameKeyFactory.GAME_D then
            return true
        end
        return false
end


function J2MEKeyFactory:isBackSpace(input)
        return false
end


function J2MEKeyFactory:isUp(input)
        if input == self.gameKeyFactory.UP then
            return true
        end
        return false
end


function J2MEKeyFactory:isDown(input)
        if input == self.gameKeyFactory.DOWN then
            return true
        end
        return false
end


function J2MEKeyFactory:isLeft(input)
        if input == self.gameKeyFactory.LEFT then
            return true
        end
        return false
end


function J2MEKeyFactory:isRight(input)
        if input == self.gameKeyFactory.RIGHT then
            return true
        end
        return false
end


function J2MEKeyFactory:isEnter(input)
        if input == self.gameKeyFactory.FIRE then
            return true
        end
        return false
end

J2MEKeyFactory.instance_f = J2MEKeyFactory.new()

return J2MEKeyFactory

