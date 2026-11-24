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

local CurrentlyPressedTouchButtonSingleton = {}
package.loaded["org.allbinary.input.motion.button.CurrentlyPressedTouchButtonSingleton"] = CurrentlyPressedTouchButtonSingleton

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table CurrentlyPressedTouchButtonSingleton is declared before the requires
CurrentlyPressedTouchButtonSingleton.__index = CurrentlyPressedTouchButtonSingleton
CurrentlyPressedTouchButtonSingleton.className = "CurrentlyPressedTouchButtonSingleton"
CurrentlyPressedTouchButtonSingleton.javaClassName = "org.allbinary.input.motion.button.CurrentlyPressedTouchButtonSingleton"

function CurrentlyPressedTouchButtonSingleton:_init_fields()
    self.list = BasicArrayListD.new()
end


function CurrentlyPressedTouchButtonSingleton.getInstance()
        return CurrentlyPressedTouchButtonSingleton.instance_f
end


function CurrentlyPressedTouchButtonSingleton._jinit(self)
    CurrentlyPressedTouchButtonSingleton._init_fields(self)
    return self
end

function CurrentlyPressedTouchButtonSingleton.new(...)
    local self = setmetatable({}, CurrentlyPressedTouchButtonSingleton)
    CurrentlyPressedTouchButtonSingleton._jinit(self, ...)
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

CurrentlyPressedTouchButtonSingleton.instance_f = CurrentlyPressedTouchButtonSingleton.new()

return CurrentlyPressedTouchButtonSingleton

