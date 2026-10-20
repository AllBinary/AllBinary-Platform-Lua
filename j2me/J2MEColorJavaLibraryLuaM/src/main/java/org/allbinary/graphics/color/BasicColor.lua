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
-- package org.allbinary.graphics.color

local JsType = require("jsinterop.annotations.JsType")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicColor = {}
BasicColor.__index = BasicColor
BasicColor.className = "BasicColor"

function BasicColor:_init_fields()
    self.name = nil
    self.value = nil
    self.redComponent = nil
    self.greenComponent = nil
    self.blueComponent = nil
    self.alphaComponent = nil
    self.red = nil
    self.green = nil
    self.blue = nil
    self.alpha = nil
end


function BasicColor.new(alphaValue, value, name)
    local self = setmetatable({}, BasicColor)
    self:_init_fields()
        self.name = name
        local tempValue = 0
        local basicColorUtil = BasicColorUtil.getInstance()
        if basicColorUtil.isAlpha then
            if basicColorUtil.ffOpaque then
                tempValue = alphaValue | value
            else
                tempValue = 0x00000000 | value
            end
        else
            tempValue = value
        end
        local alphaInt = ((((tempValue) // (1 << (24)))) & 255)
        self.alpha = alphaInt
        self.alphaComponent = ((alphaInt + 0.0)) / 255.0
        local redInt = ((((tempValue) // (1 << (16)))) & 255)
        self.red = redInt
        self.redComponent = ((redInt + 0.0)) / 255.0
        local greenInt = ((((tempValue) // (1 << (8)))) & 255)
        self.green = greenInt
        self.greenComponent = ((greenInt + 0.0)) / 255.0
        local blueInt = ((tempValue) & 255)
        self.blue = blueInt
        self.blueComponent = ((blueInt + 0.0)) / 255.0
        self.value = tempValue
    return self
end


function BasicColor:intValue()
        return self.value
end


function BasicColor:toInt()
        return self.value
end


function BasicColor:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("BasicColor: ")
        stringBuffer:append("Alpha: ")
        stringBuffer:appendshort(self.alpha)
        stringBuffer:append(" Red: ")
        stringBuffer:appendshort(self.red)
        stringBuffer:append(" Green: ")
        stringBuffer:appendshort(self.green)
        stringBuffer:append(" Blue: ")
        stringBuffer:appendshort(self.blue)
        stringBuffer:append(" Value: ")
        stringBuffer:appendint(self.value)
        return tostring(stringBuffer)
end
BasicColor.__tostring = function(self) return self:toString() end


function BasicColor:getName()
        return self.name
end


function BasicColor:getRedComponent()
        return self.redComponent
end


function BasicColor:getGreenComponent()
        return self.greenComponent
end


function BasicColor:getBlueComponent()
        return self.blueComponent
end


function BasicColor:getAlphaComponent()
        return self.alphaComponent
end

return BasicColor

