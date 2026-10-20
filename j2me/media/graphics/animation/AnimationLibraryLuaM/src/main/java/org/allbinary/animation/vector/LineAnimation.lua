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
-- package org.allbinary.animation.vector

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ColorCompositeInterface = require("org.allbinary.graphics.color.ColorCompositeInterface")
local PositionInterface = require("org.allbinary.layer.PositionInterface")
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

local LineAnimation = {}
LineAnimation.__index = LineAnimation
LineAnimation.className = "LineAnimation"
setmetatable(LineAnimation, {__index = Animation})

function LineAnimation:_init_fields()
    self.newLine = java_new_array(0, 2, 2)
    self.tempLine = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY
    self.line = java_new_array(0, 2, 2)
end


function LineAnimation.new(basicColor)
    local self = setmetatable(Animation.new(), LineAnimation)
    self:_init_fields()
        self:setBasicColorP(basicColor)
    return self
end


function LineAnimation:init(x, y)
        self.newLine[1][1] = x
        self.newLine[1][2] = y
        self.newLine[2][1] = x
        self.newLine[2][2] = y
        self.tempLine = self.line
        self.line = self.newLine
        self.newLine = self.tempLine
end


function LineAnimation:setPosition(x, y, z)
        self.newLine[1][1] = self.line[2][1]
        self.newLine[1][2] = self.line[2][2]
        self.newLine[2][1] = x
        self.newLine[2][2] = y
        self.tempLine = self.line
        self.line = self.newLine
        self.newLine = self.tempLine
end


function LineAnimation:paintXY(graphics, x, y)
        local currentLine = self.line
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        graphics:drawLine(currentLine[1][1], currentLine[1][2], currentLine[2][1], currentLine[2][2])
end


function LineAnimation:nextFrame()
end

return LineAnimation

