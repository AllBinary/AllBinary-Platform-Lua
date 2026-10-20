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
-- package org.allbinary.game.displayable.canvas

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local RectangleFilledAnimation = require("org.allbinary.animation.vector.RectangleFilledAnimation")
local Features = require("org.allbinary.game.configuration.feature.Features")
local SWTUtil = require("org.allbinary.game.layer.SWTUtil")
local GPoint = require("org.allbinary.graphics.GPoint")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local DrawVerticalStringUtil = require("org.allbinary.graphics.draw.DrawVerticalStringUtil")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local SWTJOGLProcessor = require("org.allbinary.graphics.threed.SWTJOGLProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicPopupMenuPaintable = {}
BasicPopupMenuPaintable.__index = BasicPopupMenuPaintable
BasicPopupMenuPaintable.className = "BasicPopupMenuPaintable"
setmetatable(BasicPopupMenuPaintable, {__index = Paintable})

function BasicPopupMenuPaintable:_init_fields()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.drawStringUtil = DrawVerticalStringUtil.getInstance()
    self.label = nil
    self.foregroundBasicColor = nil
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.rectangle = nil
    self.BORDER = 0
    self.heightOffset = 0
    self.offset = 0
    self.animationInterface = nil
end


function BasicPopupMenuPaintable.new(rectangle, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(Paintable.new(), BasicPopupMenuPaintable)
    self:_init_fields()
        self.foregroundBasicColor = foregroundBasicColor
        self.label = BasicPopupMenuPaintable.NAME
        self.rectangle = rectangle
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
        else
            self.animationInterface = RectangleFilledAnimation.new(self.rectangle:getWidth(), self.rectangle:getHeight(), BasicColorFactory.getInstance().TRANSPARENT_GREY)
        end
        self:init(rectangle)
    return self
end


function BasicPopupMenuPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        local features = Features.getInstance()
        local isOpenGL = features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL)
        self.drawStringUtil:updateMeasurement(graphics, self.label)
        local BORDER = 0
        if J2MEUtil.isHTML() or isOpenGL then
            BORDER = MyFontProcessor.defaultCharWidth(font) / 2
        elseif AndroidUtil.isAndroid() or J2MEUtil.isJ2SE() or SWTUtil.isSWT then
            BORDER = MyFontProcessor.defaultCharWidth(font)
        else
            BORDER = MyFontProcessor.defaultCharWidth(font) * 2
        end
        self.BORDER = BORDER
        self.heightOffset = self.rectangle:getHeight() - (font:getHeight() * BasicPopupMenuPaintable.NAME:length())
        if OpenGLFeatureUtil.getInstance():isAnyThreed() then
            self.heightOffset = self.heightOffset - (font:getHeight() + 2)
            if AndroidUtil.isAndroid() then
                self.heightOffset = font:getHeight()
            else
                self.heightOffset = self.heightOffset - (font:getHeight() + 2)
            end
        end
        self.offset = (((self.heightOffset) // (1 << (1)))) + ((function() if SWTJOGLProcessor.getInstance():isJOGL() then return 4 else return 0 end end)())
        self.myFontProcessor = MyFontProcessor.getInstance()
end


-- throws Exception
function BasicPopupMenuPaintable:init(rectangle)
        self.rectangle = rectangle
        local width = self.rectangle:getWidth()
        local height = self.rectangle:getHeight()
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
        else
            local rectangleFilledAnimation = self.animationInterface
            rectangleFilledAnimation:setWidth(width)
            rectangleFilledAnimation:setHeight(height)
        end
end


function BasicPopupMenuPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local point = self.rectangle:getPoint()
        local x = point:getX()
        local y = point:getY()
        local width = self.rectangle:getWidth()
        local height = self.rectangle:getHeight()
        self.animationInterface:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP(graphics, self.foregroundBasicColor)
        self.drawStringUtil:paintVerticle(graphics, self.label, x + self.BORDER, y + self.offset, 0)
        graphics:drawRect(x, y, width, height)
end

BasicPopupMenuPaintable.NAME = "MENU"

return BasicPopupMenuPaintable

