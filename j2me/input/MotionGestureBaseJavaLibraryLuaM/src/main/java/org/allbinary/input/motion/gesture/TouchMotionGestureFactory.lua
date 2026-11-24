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
-- package org.allbinary.input.motion.gesture

local TouchMotionGestureFactory = {}
package.loaded["org.allbinary.input.motion.gesture.TouchMotionGestureFactory"] = TouchMotionGestureFactory

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

local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")

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

-- class table TouchMotionGestureFactory is declared before the requires
TouchMotionGestureFactory.__index = TouchMotionGestureFactory
TouchMotionGestureFactory.className = "TouchMotionGestureFactory"
TouchMotionGestureFactory.javaClassName = "org.allbinary.input.motion.gesture.TouchMotionGestureFactory"

function TouchMotionGestureFactory:_init_fields()
    if self.LEFT == nil then self.LEFT = nil end
    if self.RIGHT == nil then self.RIGHT = nil end
    if self.UP == nil then self.UP = nil end
    if self.DOWN == nil then self.DOWN = nil end
    if self.PRESSED == nil then self.PRESSED = nil end
    if self.RELEASED == nil then self.RELEASED = nil end
    if self.DIAGONAL_DOWN_RIGHT == nil then self.DIAGONAL_DOWN_RIGHT = nil end
    if self.DIAGONAL_DOWN_LEFT == nil then self.DIAGONAL_DOWN_LEFT = nil end
    if self.DIAGONAL_UP_RIGHT == nil then self.DIAGONAL_UP_RIGHT = nil end
    if self.DIAGONAL_UP_LEFT == nil then self.DIAGONAL_UP_LEFT = nil end
    if self.SCROLL_UP == nil then self.SCROLL_UP = nil end
    if self.SCROLL_DOWN == nil then self.SCROLL_DOWN = nil end
    if self.NO_MOTION == nil then self.NO_MOTION = nil end
    if self.LAST_MOTION == nil then self.LAST_MOTION = nil end
end


function TouchMotionGestureFactory.getInstance()
        if TouchMotionGestureFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            TouchMotionGestureFactory.instance_f = TouchMotionGestureFactory.new()
        end
        return TouchMotionGestureFactory.instance_f
end


function TouchMotionGestureFactory._jinit(self)
    TouchMotionGestureFactory._init_fields(self)
        local MAX = InputFactory.getInstance().MAX
        self.LEFT = MotionGestureInput.new(MAX - 3, "Left Touch")
        self.RIGHT = MotionGestureInput.new(MAX - 4, "Right Touch")
        self.UP = MotionGestureInput.new(MAX - 5, "Up Touch")
        self.DOWN = MotionGestureInput.new(MAX - 6, "Down Touch")
        self.PRESSED = MotionGestureInput.new(MAX - 7, "Screen Press")
        self.RELEASED = MotionGestureInput.new(MAX - 8, "Released")
        self.DIAGONAL_DOWN_RIGHT = MotionGestureInput.new(MAX - 9, "Diagonal Dn R")
        self.DIAGONAL_DOWN_LEFT = MotionGestureInput.new(MAX - 10, "Diagonal Dn L")
        self.DIAGONAL_UP_RIGHT = MotionGestureInput.new(MAX - 11, "Diagonal Up R")
        self.DIAGONAL_UP_LEFT = MotionGestureInput.new(MAX - 12, "Diagonal Up L")
        self.SCROLL_UP = MotionGestureInput.new(MAX - 13, "Scroll Up")
        self.SCROLL_DOWN = MotionGestureInput.new(MAX - 14, "Scroll Down")
        self.NO_MOTION = MotionGestureInput.new(MAX - 2, "No Motion")
        self.LAST_MOTION = MotionGestureInput.new(MAX - 19, "Last Motion")
    return self
end

function TouchMotionGestureFactory.new(...)
    local self = setmetatable({}, TouchMotionGestureFactory)
    TouchMotionGestureFactory._jinit(self, ...)
    return self
end

TouchMotionGestureFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return TouchMotionGestureFactory

