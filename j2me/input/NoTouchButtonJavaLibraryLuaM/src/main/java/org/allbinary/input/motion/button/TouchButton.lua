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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local AnimationInterface = require("org.allbinary.animation.AnimationInterface")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButton = {}
TouchButton.__index = TouchButton
TouchButton.className = "TouchButton"
setmetatable(TouchButton, {__index = Paintable})

function TouchButton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.touchButtonInput = nil
    self.animationInterface = nil
    self.rawRectangle = nil
    self.xBorder = nil
    self.yBorder = nil
    self.rectangle = RectangleFactory.SINGLETON
    self.cellPosition = nil
    self.animationX = 0
    self.animationY = 0
end


function TouchButton.new(touchButtonInput, animationInterface, rawRectangle, cellPosition, xBorder, yBorder)
    local self = setmetatable(Paintable.new(), TouchButton)
    self:_init_fields()
        self.touchButtonInput = touchButtonInput
        self.animationInterface = animationInterface
        self.rawRectangle = rawRectangle
        self.cellPosition = cellPosition
        self.xBorder = xBorder
        self.yBorder = yBorder
        self:updateRectangle()
        self.logUtil:putF(tostring(StringMaker.new():append("Created: "):append(tostring(self))), self, self.commonStrings.CONSTRUCTOR)
    return self
end


function TouchButton:paint(graphics)
        self.animationInterface:paintXY(graphics, self.animationX, self.animationY)
end


function TouchButton:updateRectangle()
        local try_ok, try_error = pcall(function()
            local x = self.rawRectangle:getWidth() * self.cellPosition:getColumn()
            local y = self.rawRectangle:getHeight() * self.cellPosition:getRow()
            local pointFactory = PointFactory.getInstance()
            self.rectangle = Rectangle.new(pointFactory:createXY(x + self.xBorder, y + self.yBorder), self.rawRectangle:getWidth(), self.rawRectangle:getHeight())
            local point = self.rectangle:getPoint()
            self.animationX = point:getX()
            self.animationY = point:getY()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateRectangle", e)
        end
end


function TouchButton:getCellPositionP()
        return self.cellPosition
end


function TouchButton:getRectangleP()
        return self.rectangle
end


function TouchButton:getTouchButtonInput()
        return self.touchButtonInput
end


function TouchButton:toString()
        local stringBuffer = StringMaker.new()
        local stringUtil = StringUtil.getInstance()
        stringBuffer:append("TouchButton: ")
        stringBuffer:append(stringUtil:toString(self.rectangle))
        stringBuffer:append(" CellPosition: ")
        stringBuffer:append(stringUtil:toString(self.cellPosition))
        stringBuffer:append(" xBorder: ")
        stringBuffer:appendint(self.xBorder)
        stringBuffer:append(" yBorder: ")
        stringBuffer:appendint(self.yBorder)
        return tostring(stringBuffer)
end
TouchButton.__tostring = function(self) return self:toString() end

return TouchButton

