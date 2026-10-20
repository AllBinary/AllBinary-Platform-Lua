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
    self.UNKNOWN = PCGameKey.new(254, "UNKNOWN")
    self.ENTER = PCGameKey.new(13, "Enter")
    self._A = PCGameKey.new(65, "A")
    self._B = PCGameKey.new(66, "B")
    self._C = PCGameKey.new(67, "C")
    self._D = PCGameKey.new(68, "D")
    self._E = PCGameKey.new(69, "E")
    self._F = PCGameKey.new(70, "F")
    self._G = PCGameKey.new(71, "G")
    self._H = PCGameKey.new(72, "H")
    self._I = PCGameKey.new(73, "I")
    self._J = PCGameKey.new(74, "J")
    self._K = PCGameKey.new(75, "K")
    self._L = PCGameKey.new(76, "L")
    self._M = PCGameKey.new(77, "M")
    self._N = PCGameKey.new(78, "N")
    self._O = PCGameKey.new(79, "O")
    self._P = PCGameKey.new(80, "P")
    self._Q = PCGameKey.new(81, "Q")
    self._R = PCGameKey.new(82, "R")
    self._S = PCGameKey.new(83, "S")
    self._T = PCGameKey.new(84, "T")
    self._U = PCGameKey.new(85, "U")
    self._V = PCGameKey.new(86, "V")
    self._W = PCGameKey.new(87, "W")
    self._X = PCGameKey.new(88, "X")
    self._Y = PCGameKey.new(89, "Y")
    self._Z = PCGameKey.new(90, "Z")
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
    self.ZERO = PCGameKey.new(48, CommonPhoneStrings.getInstance().ZERO)
    self.ONE = PCGameKey.new(49, CommonPhoneStrings.getInstance().ONE)
    self.TWO = PCGameKey.new(50, CommonPhoneStrings.getInstance().TWO)
    self.THREE = PCGameKey.new(51, CommonPhoneStrings.getInstance().THREE)
    self.FOUR = PCGameKey.new(52, CommonPhoneStrings.getInstance().FOUR)
    self.FIVE = PCGameKey.new(53, CommonPhoneStrings.getInstance().FIVE)
    self.SIX = PCGameKey.new(54, CommonPhoneStrings.getInstance().SIX)
    self.SEVEN = PCGameKey.new(55, CommonPhoneStrings.getInstance().SEVEN)
    self.EIGHT = PCGameKey.new(56, CommonPhoneStrings.getInstance().EIGHT)
    self.NINE = PCGameKey.new(57, CommonPhoneStrings.getInstance().NINE)
    self.DPAD_UP = PCGameKey.new(38, CommonPhoneStrings.getInstance().UP)
    self.DPAD_DOWN = PCGameKey.new(40, CommonPhoneStrings.getInstance().DOWN)
    self.DPAD_LEFT = PCGameKey.new(37, CommonPhoneStrings.getInstance().LEFT)
    self.DPAD_RIGHT = PCGameKey.new(39, CommonPhoneStrings.getInstance().RIGHT)
    self.DPAD_UP2 = self.DPAD_UP
    self.DPAD_DOWN2 = self.DPAD_DOWN
    self.DPAD_LEFT2 = self.DPAD_LEFT
    self.DPAD_RIGHT2 = self.DPAD_RIGHT
    self.COMMA = PCGameKey.new(44, "COMMA")
    self.SPACE = PCGameKey.new(32, "SPACE")
    self.DEL = PCGameKey.new(46, "DEL")
    self.STAR = PCGameKey.new(42, CommonPhoneStrings.getInstance().STAR)
    self.QUESTION = PCGameKey.new(47, "?")
    self.PERIOD = PCGameKey.new(46, CommonSeps.getInstance().PERIOD)
    self.ESCAPE = PCGameKey.new(27, "Esc")
    self.BACK_SPACE = PCGameKey.new(8, "Backspace")
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

