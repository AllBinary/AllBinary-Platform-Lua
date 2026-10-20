-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local CommonButtons = require("org.allbinary.input.motion.button.CommonButtons")
local TouchButtonLocationHelper = require("org.allbinary.input.motion.button.TouchButtonLocationHelper")
local PrimitiveLongUtil = require("org.allbinary.logic.math.PrimitiveLongUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SelectionHudPaintable = {}
SelectionHudPaintable.__index = SelectionHudPaintable
SelectionHudPaintable.className = "SelectionHudPaintable"
setmetatable(SelectionHudPaintable, {__index = InitUpdatePaintable})

function SelectionHudPaintable:_init_fields()
    self.y = CommonButtons.getInstance().STANDARD_BUTTON_SIZE + 17
    self.primitiveLongUtil = nil
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.x = 0
    self.textX = 0
    self.imageX = 0
    self.basicColor = BasicColorFactory.getInstance().BLACK
    self.color = 0
    self.width = 0
    self.height = 0
    self.name = StringUtil.getInstance().EMPTY_STRING
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
    self.backgroundColor = math.tointeger(BasicColorFactory.getInstance().GREY // 1)
end


function SelectionHudPaintable.new()
    local self = setmetatable(InitUpdatePaintable.new(), SelectionHudPaintable)
    self:_init_fields()
        self:update()
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000)
    return self
end


function SelectionHudPaintable:updateMeasurement(graphics)
        local commonButtons = CommonButtons.getInstance()
        local font = graphics:getFont()
        self:setHeight(commonButtons.STANDARD_BUTTON_SIZE + font:getHeight())
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function SelectionHudPaintable:update()
        local commonButtons = CommonButtons.getInstance()
        local touchButtonLocationHelper = TouchButtonLocationHelper.new()
        local displayInfoSingleton = DisplayInfoSingleton.getInstance()
        self.x = commonButtons.STANDARD_BUTTON_SIZE + touchButtonLocationHelper:getColumnsRemainderHalf()
        self.textX = self:getX() + 4
        self.width = displayInfoSingleton:getLastWidth() - self:getX() * 2
        self.imageX = self:getWidth() + touchButtonLocationHelper:getColumnsRemainderHalf() - 10
        self.myFontProcessor = self.updateMyFontProcessor
end


function SelectionHudPaintable:updateSelectionInfo()
end


function SelectionHudPaintable:updateInfo()
end


function SelectionHudPaintable:getPrimitiveLongUtil()
        return self.primitiveLongUtil
end


function SelectionHudPaintable:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end


function SelectionHudPaintable:getAnimationInterface()
        return self.animationInterface
end


function SelectionHudPaintable:setName(name)
        self.name = name
end


function SelectionHudPaintable:getName()
        return self.name
end


function SelectionHudPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
        self:setColor(math.tointeger(basicColor // 1))
end


function SelectionHudPaintable:getBasicColorP()
        return self.basicColor
end


function SelectionHudPaintable:setColor(color)
        self.color = color
end


function SelectionHudPaintable:getColor()
        return self.color
end


function SelectionHudPaintable:getWidth()
        return self.width
end


function SelectionHudPaintable:setHeight(height)
        self.height = height
end


function SelectionHudPaintable:getHeight()
        return self.height
end


function SelectionHudPaintable:getX()
        return self.x
end


function SelectionHudPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:drawRect(self:getX(), self.y, self:getWidth(), self:getHeight())
        graphics:setColor(self:getColor())
        graphics:drawString(self:getName(), self.textX, self.y, 0)
end

return SelectionHudPaintable

