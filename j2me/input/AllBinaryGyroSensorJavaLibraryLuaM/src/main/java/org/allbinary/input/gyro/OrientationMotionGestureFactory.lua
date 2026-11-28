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
-- package org.allbinary.input.gyro

local OrientationMotionGestureFactory = {}
package.loaded["org.allbinary.input.gyro.OrientationMotionGestureFactory"] = OrientationMotionGestureFactory

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
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
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

-- class table OrientationMotionGestureFactory is declared before the requires
OrientationMotionGestureFactory.__index = OrientationMotionGestureFactory
OrientationMotionGestureFactory.className = "OrientationMotionGestureFactory"
OrientationMotionGestureFactory.javaClassName = "org.allbinary.input.gyro.OrientationMotionGestureFactory"

function OrientationMotionGestureFactory:_init_fields()
    if self.LEFT == nil then self.LEFT = nil end
    if self.RIGHT == nil then self.RIGHT = nil end
    if self.UP == nil then self.UP = nil end
    if self.DOWN == nil then self.DOWN = nil end
    if self.ROLL_LEFT == nil then self.ROLL_LEFT = nil end
    if self.ROLL_RIGHT == nil then self.ROLL_RIGHT = nil end
end


function OrientationMotionGestureFactory.getInstance()
        if rawequal(OrientationMotionGestureFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            OrientationMotionGestureFactory.instance_f = OrientationMotionGestureFactory.new()
        end
        return OrientationMotionGestureFactory.instance_f
end


function OrientationMotionGestureFactory._jinit(self)
    OrientationMotionGestureFactory._init_fields(self)
        local MAX = InputFactory.getInstance().MAX
        self.LEFT = MotionGestureInput.new(MAX - 20, "Left Orient")
        self.RIGHT = MotionGestureInput.new(MAX - 21, "Right Orient")
        self.UP = MotionGestureInput.new(MAX - 22, "Up Orient")
        self.DOWN = MotionGestureInput.new(MAX - 23, "Down Orient")
        self.ROLL_LEFT = MotionGestureInput.new(MAX - 24, "Roll Left")
        self.ROLL_RIGHT = MotionGestureInput.new(MAX - 25, "Roll Right")
    return self
end

function OrientationMotionGestureFactory.new(...)
    local self = setmetatable({}, OrientationMotionGestureFactory)
    OrientationMotionGestureFactory._jinit(self, ...)
    return self
end

OrientationMotionGestureFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return OrientationMotionGestureFactory

