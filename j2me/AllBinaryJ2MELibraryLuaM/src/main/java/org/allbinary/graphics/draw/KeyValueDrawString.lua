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

local KeyValueDrawString = {}
package.loaded["org.allbinary.graphics.draw.KeyValueDrawString"] = KeyValueDrawString

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table KeyValueDrawString is declared before the requires
KeyValueDrawString.__index = KeyValueDrawString
KeyValueDrawString.className = "KeyValueDrawString"
KeyValueDrawString.javaClassName = "org.allbinary.graphics.draw.KeyValueDrawString"
KeyValueDrawString.java_implements = " UpdateMyFontInterface "
KeyValueDrawString.java_interfaces = function() return {UpdateMyFontInterface} end

function KeyValueDrawString:_init_fields()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    if self.LABEL == nil then self.LABEL = nil end
    if self.labelX == nil then self.labelX = 0 end
    if self.valueX == nil then self.valueX = 0 end
    self.value = StringUtil.getInstance().EMPTY_STRING
end


function KeyValueDrawString._jinit(self, label, x)
    KeyValueDrawString._init_fields(self)
        self.LABEL = label
        self.labelX = x
    return self
end

function KeyValueDrawString.new(...)
    local self = setmetatable({}, KeyValueDrawString)
    KeyValueDrawString._jinit(self, ...)
    return self
end


function KeyValueDrawString:updateMeasurement(graphics)
        local labelWidth = graphics:getFont():stringWidth(self.LABEL) - #self.LABEL
        self.valueX = labelWidth + self.labelX
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function KeyValueDrawString:paint(graphics, y)
        self.myFontProcessor:process(graphics)
        graphics:drawString(self.LABEL, self.labelX, y, 0)
        graphics:drawString(self.value, self.valueX, y, 0)
end


function KeyValueDrawString:update(value)
        self.value = value
end

return KeyValueDrawString

