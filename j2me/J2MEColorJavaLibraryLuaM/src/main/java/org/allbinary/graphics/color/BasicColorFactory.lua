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
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local JsMethod = require("jsinterop.annotations.JsMethod")
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

local BasicColorFactory = {}
BasicColorFactory.__index = BasicColorFactory
BasicColorFactory.className = "BasicColorFactory"

function BasicColorFactory:_init_fields()
    self.NULL_COLOR = self:createInstanceARGB(255, 255, 255, 255, "null color")
    self.TAN = self:createInstance(0xE9D8B5)
    self.SKIN_PINK = self:createInstance(0xFDCECE)
    self.RED = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFF0000, "red")
    self.LIGHT_RED = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFFA0A0, "light red")
    self.DARK_GREEN = self:createInstance(0x00FF00)
    self.GREEN = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x00DD00, "green")
    self.LIGHT_GREEN = self:createInstance(0x007700)
    self.PURPLE = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x400040, "purple")
    self.BLUE = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x0000FF, "blue")
    self.LIGHT_BLUE = self:createInstance(0x00aaff)
    self.VERY_LIGHT_BLUE = self:createInstance(0x000033)
    self.PUCE = self:createInstance(0xFF00AA)
    self.AQUA = self:createInstance(0x00FFFF)
    self.YELLOW = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xFFFF00, "yellow")
    self.PINK = self:createInstance(0xFF00FF)
    self.BLACK = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0x000000, "black")
    self.GREY = self:createInstanceAN(BasicColorUtil.getInstance().ALPHA, 0xAAAAAA, "grey")
    self.LIGHT_GREY = self:createInstance(0xC0C0C0)
    self.DARK_GREY = self:createInstance(0x404040)
    self.ORANGE = self:createInstance(0xe07718)
    self.BROWN = self:createInstance(0x956B00)
    self.WHITE = self:createInstance(0xFFFFFF)
    self.TRANSPARENT_COLOR = self:createInstanceAN(0x00000000, 0x000000, StringUtil.getInstance().EMPTY_STRING)
    self.TRANSPARENT_GREY = self:createInstanceAN(0x52000000, 0xECECEC, StringUtil.getInstance().EMPTY_STRING)
    self.TRANSPARENT_BLACK = self:createInstanceAN(0x52000000, 0x000000, StringUtil.getInstance().EMPTY_STRING)
    self.TRANSPARENT_RED = self:createInstanceAN(0x52000000, 0xFF0000, StringUtil.getInstance().EMPTY_STRING)
    self.CLEAR_COLOR = self.BLACK
    self.BORDER_COLOR = self.WHITE
end

function BasicColorFactory.new()
    local self = setmetatable({}, BasicColorFactory)
    self:_init_fields()
    return self
end


function BasicColorFactory.getInstance()
        return BasicColorFactory.instance
end


function BasicColorFactory:createInstance(value)
        return BasicColor.new(BasicColorUtil.getInstance().ALPHA, value, StringUtil.getInstance().EMPTY_STRING)
end


function BasicColorFactory:createInstanceA(alphaValue, value)
        return BasicColor.new(alphaValue, value, StringUtil.getInstance().EMPTY_STRING)
end


function BasicColorFactory:createInstanceAN(alphaValue, value, name)
        return BasicColor.new(alphaValue, value, name)
end


function BasicColorFactory:createInstanceARGB(alphaValue, r, g, b, name)
        local ALPHA_MASK = 0xFF000000
        return BasicColor.new(alphaValue, ((alphaValue << 24) & ALPHA_MASK) + ((r << 16) & 0x00FF0000) + ((g << 8) & 0x0000FF00) + (b & 0x000000FF), StringUtil.getInstance().EMPTY_STRING)
end

BasicColorFactory.instance = BasicColorFactory.new()

return BasicColorFactory

