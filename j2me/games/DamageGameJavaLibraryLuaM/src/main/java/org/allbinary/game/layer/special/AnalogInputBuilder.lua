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
-- package org.allbinary.game.layer.special

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local GameInputProcessor = require("org.allbinary.game.input.GameInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnalogInputBuilder = {}
AnalogInputBuilder.__index = AnalogInputBuilder
AnalogInputBuilder.className = "AnalogInputBuilder"

function AnalogInputBuilder.new()
    local self = setmetatable({}, AnalogInputBuilder)
    return self
end


function AnalogInputBuilder.getInstance()
        return AnalogInputBuilder.instance
end


function AnalogInputBuilder:disable(inputProcessorArray, collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.UP + 1] = SpecialUpGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.DOWN + 1] = SpecialDownGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.RIGHT + 1] = SpecialRightGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.LEFT + 1] = SpecialLeftGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.KEY_NUM0 + 1] = Special1GameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.KEY_NUM5 + 1] = Special3GameInputProcessor.new(collidableDestroyableDamageableLayer)
end


function AnalogInputBuilder:enable(inputProcessorArray, collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.UP + 1] = SpecialAnalogUpGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.DOWN + 1] = SpecialAnalogDownGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.RIGHT + 1] = SpecialAnalogRightGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.LEFT + 1] = SpecialAnalogLeftGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.KEY_NUM0 + 1] = SpecialAnalogLeftTriggerGameInputProcessor.new(collidableDestroyableDamageableLayer)
        inputProcessorArray[Canvas.KEY_NUM5 + 1] = SpecialAnalogRightTriggerGameInputProcessor.new(collidableDestroyableDamageableLayer)
end

AnalogInputBuilder.instance = AnalogInputBuilder.new()

return AnalogInputBuilder

