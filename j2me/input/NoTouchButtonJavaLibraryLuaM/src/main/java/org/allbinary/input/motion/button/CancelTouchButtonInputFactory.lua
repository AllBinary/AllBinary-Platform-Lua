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

local InputFactory = require("org.allbinary.game.input.InputFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CancelTouchButtonInputFactory = {}
CancelTouchButtonInputFactory.__index = CancelTouchButtonInputFactory
CancelTouchButtonInputFactory.className = "CancelTouchButtonInputFactory"

function CancelTouchButtonInputFactory:_init_fields()
    self.cancelInputArray = java_new_array(nil, InputFactory.getInstance().MAX)
end


function CancelTouchButtonInputFactory.getInstance()
        if CancelTouchButtonInputFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            CancelTouchButtonInputFactory.instance = CancelTouchButtonInputFactory.new()
        end
        return CancelTouchButtonInputFactory.instance
end


function CancelTouchButtonInputFactory.new()
    local self = setmetatable({}, CancelTouchButtonInputFactory)
    self:_init_fields()
        local basicTouchInputFactory = BasicTouchInputFactory.getInstance()
        for index = (self.cancelInputArray.n or #self.cancelInputArray) - 1, 0, -1 do
            self.cancelInputArray[index + 1] = basicTouchInputFactory.NONE
        end
        self.cancelInputArray[basicTouchInputFactory.UP:getId() + 1] = basicTouchInputFactory.DOWN
        self.cancelInputArray[basicTouchInputFactory.DOWN:getId() + 1] = basicTouchInputFactory.UP
        self.cancelInputArray[basicTouchInputFactory.LEFT:getId() + 1] = basicTouchInputFactory.RIGHT
        self.cancelInputArray[basicTouchInputFactory.RIGHT:getId() + 1] = basicTouchInputFactory.LEFT
    return self
end


function CancelTouchButtonInputFactory:getCancel(touchButtonInput)
        return self.cancelInputArray[touchButtonInput:getId() + 1]
end

CancelTouchButtonInputFactory.instance = NullUtil.getInstance().NULL_OBJECT

return CancelTouchButtonInputFactory

