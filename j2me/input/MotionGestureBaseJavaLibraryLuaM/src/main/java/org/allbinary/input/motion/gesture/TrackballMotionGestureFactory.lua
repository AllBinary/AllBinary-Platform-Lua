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

local TrackballMotionGestureFactory = {}
package.loaded["org.allbinary.input.motion.gesture.TrackballMotionGestureFactory"] = TrackballMotionGestureFactory

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

-- class table TrackballMotionGestureFactory is declared before the requires
TrackballMotionGestureFactory.__index = TrackballMotionGestureFactory
TrackballMotionGestureFactory.className = "TrackballMotionGestureFactory"
TrackballMotionGestureFactory.javaClassName = "org.allbinary.input.motion.gesture.TrackballMotionGestureFactory"

function TrackballMotionGestureFactory:_init_fields()
    if self.LEFT == nil then self.LEFT = nil end
    if self.RIGHT == nil then self.RIGHT = nil end
    if self.UP == nil then self.UP = nil end
    if self.DOWN == nil then self.DOWN = nil end
end


function TrackballMotionGestureFactory.getInstance()
        if TrackballMotionGestureFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            TrackballMotionGestureFactory.instance_f = TrackballMotionGestureFactory.new()
        end
        return TrackballMotionGestureFactory.instance_f
end


function TrackballMotionGestureFactory._jinit(self)
    TrackballMotionGestureFactory._init_fields(self)
        local MAX = InputFactory.getInstance().MAX
        self.LEFT = MotionGestureInput.new(MAX - 26, "L Trackball")
        self.RIGHT = MotionGestureInput.new(MAX - 27, "R Trackball")
        self.UP = MotionGestureInput.new(MAX - 28, "Up Trackball")
        self.DOWN = MotionGestureInput.new(MAX - 29, "D Trackball")
    return self
end

function TrackballMotionGestureFactory.new(...)
    local self = setmetatable({}, TrackballMotionGestureFactory)
    TrackballMotionGestureFactory._jinit(self, ...)
    return self
end

TrackballMotionGestureFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return TrackballMotionGestureFactory

