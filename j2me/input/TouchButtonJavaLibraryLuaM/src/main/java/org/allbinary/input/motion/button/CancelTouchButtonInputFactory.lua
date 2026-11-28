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
-- package org.allbinary.input.motion.button

local CancelTouchButtonInputFactory = {}
package.loaded["org.allbinary.input.motion.button.CancelTouchButtonInputFactory"] = CancelTouchButtonInputFactory

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
local BasicTouchInputFactory = java_lazy("org.allbinary.input.motion.button.BasicTouchInputFactory")
local TouchButtonInput = java_lazy("org.allbinary.input.motion.button.TouchButtonInput")

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

-- class table CancelTouchButtonInputFactory is declared before the requires
CancelTouchButtonInputFactory.__index = CancelTouchButtonInputFactory
CancelTouchButtonInputFactory.className = "CancelTouchButtonInputFactory"
CancelTouchButtonInputFactory.javaClassName = "org.allbinary.input.motion.button.CancelTouchButtonInputFactory"

function CancelTouchButtonInputFactory:_init_fields()
    self.cancelInputArray = java_new_array(nil, InputFactory.getInstance().MAX)
end


function CancelTouchButtonInputFactory.getInstance()
        if rawequal(CancelTouchButtonInputFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            CancelTouchButtonInputFactory.instance_f = CancelTouchButtonInputFactory.new()
        end
        return CancelTouchButtonInputFactory.instance_f
end


function CancelTouchButtonInputFactory._jinit(self)
    CancelTouchButtonInputFactory._init_fields(self)
        local basicTouchInputFactory = BasicTouchInputFactory.getInstance()
        for index = (self.cancelInputArray.n or #self.cancelInputArray) - 1, 0, -1 do
            self.cancelInputArray[index + 1] = basicTouchInputFactory.NONE
        end
        self.cancelInputArray[basicTouchInputFactory.UP:getSourceId() + 1] = basicTouchInputFactory.DOWN
        self.cancelInputArray[basicTouchInputFactory.DOWN:getSourceId() + 1] = basicTouchInputFactory.UP
        self.cancelInputArray[basicTouchInputFactory.LEFT:getSourceId() + 1] = basicTouchInputFactory.RIGHT
        self.cancelInputArray[basicTouchInputFactory.RIGHT:getSourceId() + 1] = basicTouchInputFactory.LEFT
    return self
end

function CancelTouchButtonInputFactory.new(...)
    local self = setmetatable({}, CancelTouchButtonInputFactory)
    CancelTouchButtonInputFactory._jinit(self, ...)
    return self
end


function CancelTouchButtonInputFactory:getCancel(touchButtonInput)
        return self.cancelInputArray[touchButtonInput:getSourceId() + 1]
end

CancelTouchButtonInputFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return CancelTouchButtonInputFactory

