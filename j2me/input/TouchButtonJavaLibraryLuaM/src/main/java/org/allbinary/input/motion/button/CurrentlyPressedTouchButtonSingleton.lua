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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CurrentlyPressedTouchButtonSingleton = {}
CurrentlyPressedTouchButtonSingleton.__index = CurrentlyPressedTouchButtonSingleton
CurrentlyPressedTouchButtonSingleton.className = "CurrentlyPressedTouchButtonSingleton"

function CurrentlyPressedTouchButtonSingleton:_init_fields()
    self.list = BasicArrayListD.new()
end


function CurrentlyPressedTouchButtonSingleton.getInstance()
        return CurrentlyPressedTouchButtonSingleton.instance
end


function CurrentlyPressedTouchButtonSingleton.new()
    local self = setmetatable({}, CurrentlyPressedTouchButtonSingleton)
    self:_init_fields()
    return self
end


function CurrentlyPressedTouchButtonSingleton:size()
        return self.list:size()
end


function CurrentlyPressedTouchButtonSingleton:removeAt(index)
        return self.list:removeAt(index)
end


function CurrentlyPressedTouchButtonSingleton:remove(touchButtonInput)
        return self.list:remove(touchButtonInput)
end


function CurrentlyPressedTouchButtonSingleton:get(index)
        return self.list.objectArray[index + 1]
end


function CurrentlyPressedTouchButtonSingleton:contains(touchButtonInput)
        return self.list:contains(touchButtonInput)
end


function CurrentlyPressedTouchButtonSingleton:add(touchButtonInput)
        self.list:add(touchButtonInput)
end

CurrentlyPressedTouchButtonSingleton.instance = CurrentlyPressedTouchButtonSingleton.new()

return CurrentlyPressedTouchButtonSingleton

