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

local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PCKeyFactory = {}
PCKeyFactory.__index = PCKeyFactory
PCKeyFactory.className = "PCKeyFactory"

function PCKeyFactory:_init_fields()
    self.keyEventWrapper = ABKeyEventWrapper.getInstance()
    self.UNKNOWN = PCGameKey.new(self.keyEventWrapper.VK_UNDEFINED, "UNKNOWN")
    self.ENTER = PCGameKey.new(5, "Enter")
    self._A = PCGameKey.new(self.keyEventWrapper.VK_A, "A")
    self._B = PCGameKey.new(self.keyEventWrapper.VK_B, "B")
    self._C = PCGameKey.new(self.keyEventWrapper.VK_C, "C")
    self._D = PCGameKey.new(self.keyEventWrapper.VK_D, "D")
    self._E = PCGameKey.new(self.keyEventWrapper.VK_E, "E")
    self._F = PCGameKey.new(self.keyEventWrapper.VK_F, "F")
    self._G = PCGameKey.new(self.keyEventWrapper.VK_G, "G")
    self._H = PCGameKey.new(self.keyEventWrapper.VK_H, "H")
    self._I = PCGameKey.new(self.keyEventWrapper.VK_I, "I")
    self._J = PCGameKey.new(self.keyEventWrapper.VK_J, "J")
    self._K = PCGameKey.new(self.keyEventWrapper.VK_K, "K")
    self._L = PCGameKey.new(self.keyEventWrapper.VK_L, "L")
    self._M = PCGameKey.new(self.keyEventWrapper.VK_M, "M")
    self._N = PCGameKey.new(self.keyEventWrapper.VK_N, "N")
    self._O = PCGameKey.new(self.keyEventWrapper.VK_O, "O")
    self._P = PCGameKey.new(self.keyEventWrapper.VK_P, "P")
    self._Q = PCGameKey.new(self.keyEventWrapper.VK_Q, "Q")
    self._R = PCGameKey.new(self.keyEventWrapper.VK_R, "R")
    self._S = PCGameKey.new(self.keyEventWrapper.VK_S, "S")
    self._T = PCGameKey.new(self.keyEventWrapper.VK_T, "T")
    self._U = PCGameKey.new(self.keyEventWrapper.VK_U, "U")
    self._V = PCGameKey.new(self.keyEventWrapper.VK_V, "V")
    self._W = PCGameKey.new(self.keyEventWrapper.VK_W, "W")
    self._X = PCGameKey.new(self.keyEventWrapper.VK_X, "X")
    self._Y = PCGameKey.new(self.keyEventWrapper.VK_Y, "Y")
    self._Z = PCGameKey.new(self.keyEventWrapper.VK_Z, "Z")
    self.a = PCGameKey.new(97, "a")
    self.b = PCGameKey.new(98, "b")
    self.c = PCGameKey.new(99, "c")
    self.d = PCGameKey.new(100, "d")
    self.e = PCGameKey.new(101, "e")
    self.f = PCGameKey.new(102, "f")
    self.g = PCGameKey.new(103, "g")
    self.h = PCGameKey.new(104, "h")
    self.i = PCGameKey.new(105, "i")
    self.j = PCGameKey.new(106, "j")
    self.k = PCGameKey.new(107, "k")
    self.l = PCGameKey.new(108, "l")
    self.m = PCGameKey.new(109, "m")
    self.n = PCGameKey.new(110, "n")
    self.o = PCGameKey.new(111, "o")
    self.p = PCGameKey.new(112, "p")
    self.q = PCGameKey.new(113, "q")
    self.r = PCGameKey.new(114, "r")
    self.s = PCGameKey.new(115, "s")
    self.t = PCGameKey.new(116, "t")
    self.u = PCGameKey.new(117, "u")
    self.v = PCGameKey.new(118, "v")
    self.w = PCGameKey.new(119, "w")
    self.x = PCGameKey.new(120, PositionStrings.getInstance().X)
    self.y = PCGameKey.new(121, PositionStrings.getInstance().Y)
    self.z = PCGameKey.new(122, "z")
    self.ZERO = PCGameKey.new(self.keyEventWrapper.VK_0, CommonPhoneStrings.getInstance().ZERO)
    self.ONE = PCGameKey.new(self.keyEventWrapper.VK_1, CommonPhoneStrings.getInstance().ONE)
    self.TWO = PCGameKey.new(self.keyEventWrapper.VK_2, CommonPhoneStrings.getInstance().TWO)
    self.THREE = PCGameKey.new(self.keyEventWrapper.VK_3, CommonPhoneStrings.getInstance().THREE)
    self.FOUR = PCGameKey.new(self.keyEventWrapper.VK_4, CommonPhoneStrings.getInstance().FOUR)
    self.FIVE = PCGameKey.new(self.keyEventWrapper.VK_5, CommonPhoneStrings.getInstance().FIVE)
    self.SIX = PCGameKey.new(self.keyEventWrapper.VK_6, CommonPhoneStrings.getInstance().SIX)
    self.SEVEN = PCGameKey.new(self.keyEventWrapper.VK_7, CommonPhoneStrings.getInstance().SEVEN)
    self.EIGHT = PCGameKey.new(self.keyEventWrapper.VK_8, CommonPhoneStrings.getInstance().EIGHT)
    self.NINE = PCGameKey.new(self.keyEventWrapper.VK_9, CommonPhoneStrings.getInstance().NINE)
    self.DPAD_UP = PCGameKey.new(self.keyEventWrapper.VK_UP, CommonPhoneStrings.getInstance().UP)
    self.DPAD_DOWN = PCGameKey.new(self.keyEventWrapper.VK_DOWN, CommonPhoneStrings.getInstance().DOWN)
    self.DPAD_LEFT = PCGameKey.new(self.keyEventWrapper.VK_LEFT, CommonPhoneStrings.getInstance().LEFT)
    self.DPAD_RIGHT = PCGameKey.new(self.keyEventWrapper.VK_RIGHT, CommonPhoneStrings.getInstance().RIGHT)
    self.DPAD_UP2 = self.DPAD_UP
    self.DPAD_DOWN2 = self.DPAD_DOWN
    self.DPAD_LEFT2 = self.DPAD_LEFT
    self.DPAD_RIGHT2 = self.DPAD_RIGHT
    self.COMMA = PCGameKey.new(self.keyEventWrapper.VK_COMMA, "COMMA")
    self.SPACE = PCGameKey.new(self.keyEventWrapper.VK_SPACE, "SPACE")
    self.DEL = PCGameKey.new(self.keyEventWrapper.VK_DELETE, "DEL")
    self.STAR = PCGameKey.new(42, CommonPhoneStrings.getInstance().STAR)
    self.QUESTION = PCGameKey.new(47, "?")
    self.PERIOD = PCGameKey.new(self.keyEventWrapper.VK_PERIOD, CommonSeps.getInstance().PERIOD)
    self.ESCAPE = PCGameKey.new(self.keyEventWrapper.VK_ESCAPE, "Esc")
    self.BACK_SPACE = PCGameKey.new(self.keyEventWrapper.VK_BACK_SPACE, "Backspace")
end

function PCKeyFactory.new()
    local self = setmetatable({}, PCKeyFactory)
    self:_init_fields()
    return self
end


function PCKeyFactory.getInstance()
        return PCKeyFactory.SINGLETON
end


function PCKeyFactory:isSubmission(input)
        if input == self.ENTER then
            return true
        end
        return false
end


function PCKeyFactory:isDelete(input)
        if input == self.DEL then
            return true
        end
        return false
end


function PCKeyFactory:isBackSpace(input)
        if input == self.BACK_SPACE then
            return true
        end
        return false
end


function PCKeyFactory:isUp(input)
        if input == self.DPAD_UP or input == self.DPAD_UP2 then
            return true
        end
        return false
end


function PCKeyFactory:isDown(input)
        if input == self.DPAD_DOWN or input == self.DPAD_DOWN2 then
            return true
        end
        return false
end


function PCKeyFactory:isLeft(input)
        if input == self.DPAD_LEFT or input == self.DPAD_LEFT2 then
            return true
        end
        return false
end


function PCKeyFactory:isRight(input)
        if input == self.DPAD_RIGHT or input == self.DPAD_RIGHT2 then
            return true
        end
        return false
end


function PCKeyFactory:isEnter(input)
        if input == self.ENTER then
            return true
        end
        return false
end

PCKeyFactory.SINGLETON = PCKeyFactory.new()

return PCKeyFactory

