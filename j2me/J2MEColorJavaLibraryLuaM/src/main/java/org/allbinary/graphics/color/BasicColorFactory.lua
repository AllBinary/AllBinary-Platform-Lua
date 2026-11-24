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

local BasicColorFactory = {}
package.loaded["org.allbinary.graphics.color.BasicColorFactory"] = BasicColorFactory

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorUtil = java_lazy("org.allbinary.graphics.color.BasicColorUtil")

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

-- class table BasicColorFactory is declared before the requires
BasicColorFactory.__index = BasicColorFactory
BasicColorFactory.className = "BasicColorFactory"
BasicColorFactory.javaClassName = "org.allbinary.graphics.color.BasicColorFactory"

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

function BasicColorFactory._jinit(self)
    BasicColorFactory._init_fields(self)
    return self
end

function BasicColorFactory.new()
    return BasicColorFactory._jinit(setmetatable({}, BasicColorFactory))
end


function BasicColorFactory.getInstance()
        return BasicColorFactory.instance_f
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
        local ALPHA_MASK = (0xFF000000 - 0x100000000)
        return BasicColor.new(alphaValue, ((alphaValue << 24) & ALPHA_MASK) + ((r << 16) & 0x00FF0000) + ((g << 8) & 0x0000FF00) + (b & 0x000000FF), StringUtil.getInstance().EMPTY_STRING)
end

BasicColorFactory.instance_f = BasicColorFactory.new()

return BasicColorFactory

