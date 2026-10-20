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
-- package org.allbinary.graphics.draw

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local CharArrayFactory = require("org.allbinary.logic.java.character.CharArrayFactory")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeyValueDrawCharArray = {}
KeyValueDrawCharArray.__index = KeyValueDrawCharArray
KeyValueDrawCharArray.className = "KeyValueDrawCharArray"

function KeyValueDrawCharArray:_init_fields()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.LABEL = nil
    self.labelX = nil
    self.valueX = 0
    self.value = CharArrayFactory.getInstance():getZeroCharArray()
    self.len = 0
end


function KeyValueDrawCharArray.new(label, x)
    local self = setmetatable({}, KeyValueDrawCharArray)
    self:_init_fields()
        self.LABEL = label
        self.labelX = x
    return self
end


function KeyValueDrawCharArray:updateMeasurement(graphics)
        local labelWidth = graphics:getFont():stringWidth(self.LABEL) - #self.LABEL
        self.valueX = labelWidth + self.labelX
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function KeyValueDrawCharArray:paint(graphics, y)
        self.myFontProcessor:process(graphics)
        graphics:drawString(self.LABEL, self.labelX, y, 0)
        graphics:drawChars(self.value, 0, self.len, self.valueX, y, 0)
end


function KeyValueDrawCharArray:update(value, len)
        self.value = value
        self.len = len
end

return KeyValueDrawCharArray

