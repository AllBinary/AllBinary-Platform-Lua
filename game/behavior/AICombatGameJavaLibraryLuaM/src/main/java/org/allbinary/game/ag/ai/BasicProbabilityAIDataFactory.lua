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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local NoTimeDelayHelper = require("org.allbinary.time.NoTimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

local BasicProbabilityAIDataFactory = {}
BasicProbabilityAIDataFactory.__index = BasicProbabilityAIDataFactory
BasicProbabilityAIDataFactory.className = "BasicProbabilityAIDataFactory"

function BasicProbabilityAIDataFactory.new()
    local self = setmetatable({}, BasicProbabilityAIDataFactory)
    return self
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

