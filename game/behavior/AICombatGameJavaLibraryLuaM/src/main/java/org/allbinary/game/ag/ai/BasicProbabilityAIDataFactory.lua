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
-- package org.allbinary.game.ag.ai

local BasicProbabilityAIDataFactory = {}
package.loaded["org.allbinary.game.ag.ai.BasicProbabilityAIDataFactory"] = BasicProbabilityAIDataFactory

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local NoTimeDelayHelper = java_lazy("org.allbinary.time.NoTimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local InputProbability = java_lazy("org.allbinary.game.ag.ai.InputProbability")

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

-- class table BasicProbabilityAIDataFactory is declared before the requires
BasicProbabilityAIDataFactory.__index = BasicProbabilityAIDataFactory
BasicProbabilityAIDataFactory.className = "BasicProbabilityAIDataFactory"
BasicProbabilityAIDataFactory.javaClassName = "org.allbinary.game.ag.ai.BasicProbabilityAIDataFactory"

function BasicProbabilityAIDataFactory._jinit(self)
    return self
end

function BasicProbabilityAIDataFactory.new()
    return BasicProbabilityAIDataFactory._jinit(setmetatable({}, BasicProbabilityAIDataFactory))
end


function BasicProbabilityAIDataFactory:getInstance()
        local likelyhoodIntegerArray = java_new_array(nil, Canvas.KEY_NUM9 + 1, 2)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        likelyhoodIntegerArray[Canvas.UP + 1][1] = smallIntegerSingletonFactory:getAt(0)
        likelyhoodIntegerArray[Canvas.UP + 1][2] = smallIntegerSingletonFactory:getAt(10)
        likelyhoodIntegerArray[Canvas.DOWN + 1][1] = smallIntegerSingletonFactory:getAt(10)
        likelyhoodIntegerArray[Canvas.DOWN + 1][2] = smallIntegerSingletonFactory:getAt(14)
        likelyhoodIntegerArray[Canvas.LEFT + 1][1] = smallIntegerSingletonFactory:getAt(14)
        likelyhoodIntegerArray[Canvas.LEFT + 1][2] = smallIntegerSingletonFactory:getAt(18)
        likelyhoodIntegerArray[Canvas.RIGHT + 1][1] = smallIntegerSingletonFactory:getAt(18)
        likelyhoodIntegerArray[Canvas.RIGHT + 1][2] = smallIntegerSingletonFactory:getAt(22)
        likelyhoodIntegerArray[Canvas.KEY_NUM7 + 1][1] = smallIntegerSingletonFactory:getAt(22)
        likelyhoodIntegerArray[Canvas.KEY_NUM7 + 1][2] = smallIntegerSingletonFactory:getAt(26)
        likelyhoodIntegerArray[Canvas.KEY_NUM9 + 1][1] = smallIntegerSingletonFactory:getAt(26)
        likelyhoodIntegerArray[Canvas.KEY_NUM9 + 1][2] = smallIntegerSingletonFactory:getAt(30)
        likelyhoodIntegerArray[Canvas.KEY_NUM1 + 1][1] = smallIntegerSingletonFactory:getAt(30)
        likelyhoodIntegerArray[Canvas.KEY_NUM1 + 1][2] = smallIntegerSingletonFactory:getAt(40)
        local repeatLikelyhoodIntegerArray = java_new_array(nil, Canvas.KEY_NUM9 + 1)
        repeatLikelyhoodIntegerArray[Canvas.UP + 1] = smallIntegerSingletonFactory:getAt(0)
        repeatLikelyhoodIntegerArray[Canvas.DOWN + 1] = smallIntegerSingletonFactory:getAt(0)
        repeatLikelyhoodIntegerArray[Canvas.LEFT + 1] = smallIntegerSingletonFactory:getAt(0)
        repeatLikelyhoodIntegerArray[Canvas.RIGHT + 1] = smallIntegerSingletonFactory:getAt(0)
        repeatLikelyhoodIntegerArray[Canvas.KEY_NUM7 + 1] = smallIntegerSingletonFactory:getAt(0)
        repeatLikelyhoodIntegerArray[Canvas.KEY_NUM9 + 1] = smallIntegerSingletonFactory:getAt(0)
        repeatLikelyhoodIntegerArray[Canvas.KEY_NUM1 + 1] = smallIntegerSingletonFactory:getAt(10)
        local inputProbability = InputProbability.new(likelyhoodIntegerArray, repeatLikelyhoodIntegerArray, 42, NoTimeDelayHelper.SINGLETON)
        return inputProbability:toHashtable()
end

return BasicProbabilityAIDataFactory

