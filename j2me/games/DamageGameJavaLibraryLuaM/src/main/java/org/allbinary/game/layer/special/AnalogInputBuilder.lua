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

local AnalogInputBuilder = {}
package.loaded["org.allbinary.game.layer.special.AnalogInputBuilder"] = AnalogInputBuilder

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local GameInputProcessor = java_lazy("org.allbinary.game.input.GameInputProcessor")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local Special1GameInputProcessor = java_lazy("org.allbinary.game.layer.special.Special1GameInputProcessor")
local Special3GameInputProcessor = java_lazy("org.allbinary.game.layer.special.Special3GameInputProcessor")
local SpecialAnalogDownGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialAnalogDownGameInputProcessor")
local SpecialAnalogLeftGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialAnalogLeftGameInputProcessor")
local SpecialAnalogLeftTriggerGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialAnalogLeftTriggerGameInputProcessor")
local SpecialAnalogRightGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialAnalogRightGameInputProcessor")
local SpecialAnalogRightTriggerGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialAnalogRightTriggerGameInputProcessor")
local SpecialAnalogUpGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialAnalogUpGameInputProcessor")
local SpecialDownGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialDownGameInputProcessor")
local SpecialLeftGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialLeftGameInputProcessor")
local SpecialRightGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialRightGameInputProcessor")
local SpecialUpGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialUpGameInputProcessor")

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

-- class table AnalogInputBuilder is declared before the requires
AnalogInputBuilder.__index = AnalogInputBuilder
AnalogInputBuilder.className = "AnalogInputBuilder"
AnalogInputBuilder.javaClassName = "org.allbinary.game.layer.special.AnalogInputBuilder"

function AnalogInputBuilder._jinit(self)
    return self
end

function AnalogInputBuilder.new()
    return AnalogInputBuilder._jinit(setmetatable({}, AnalogInputBuilder))
end


function AnalogInputBuilder.getInstance()
        return AnalogInputBuilder.instance_f
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

AnalogInputBuilder.instance_f = AnalogInputBuilder.new()

return AnalogInputBuilder

