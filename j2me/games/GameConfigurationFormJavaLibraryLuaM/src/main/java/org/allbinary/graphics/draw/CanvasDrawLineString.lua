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

local CanvasDrawLineString = {}
package.loaded["org.allbinary.graphics.draw.CanvasDrawLineString"] = CanvasDrawLineString

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

local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local DrawStringUtil = java_lazy("org.allbinary.graphics.draw.DrawStringUtil")

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

-- class table CanvasDrawLineString is declared before the requires
CanvasDrawLineString.__index = CanvasDrawLineString
CanvasDrawLineString.className = "CanvasDrawLineString"
CanvasDrawLineString.javaClassName = "org.allbinary.graphics.draw.CanvasDrawLineString"
CanvasDrawLineString.java_implements = " UpdateMyFontInterface "
CanvasDrawLineString.java_interfaces = function() return {UpdateMyFontInterface} end

function CanvasDrawLineString:_init_fields()
    self.drawStringUtil = DrawStringUtil.getInstance()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    if self.x == nil then self.x = 0 end
    if self.y == nil then self.y = 0 end
    self.fontHeight = 0
end


function CanvasDrawLineString._jinit(self, x, y)
    CanvasDrawLineString._init_fields(self)
        self.x = x
        self.y = y
    return self
end

function CanvasDrawLineString.new(...)
    local self = setmetatable({}, CanvasDrawLineString)
    CanvasDrawLineString._jinit(self, ...)
    return self
end


function CanvasDrawLineString:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function CanvasDrawLineString:paint(graphics, string_, line)
        self.myFontProcessor:process(graphics)
        self.drawStringUtil:drawCenterString(graphics, string_, 0, #string_, self.x, self.y + (line * self.fontHeight))
end

CanvasDrawLineString.NULL_CANVAS_DRAW_LINE_STRING = CanvasDrawLineString.new(0, 0)

return CanvasDrawLineString

