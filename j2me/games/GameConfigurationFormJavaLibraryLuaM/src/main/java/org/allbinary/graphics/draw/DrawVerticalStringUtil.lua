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

local DrawVerticalStringUtil = {}
package.loaded["org.allbinary.graphics.draw.DrawVerticalStringUtil"] = DrawVerticalStringUtil

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
local AndroidUtil = java_lazy("org.allbinary.AndroidUtil")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table DrawVerticalStringUtil is declared before the requires
DrawVerticalStringUtil.__index = DrawVerticalStringUtil
DrawVerticalStringUtil.className = "DrawVerticalStringUtil"
DrawVerticalStringUtil.javaClassName = "org.allbinary.graphics.draw.DrawVerticalStringUtil"

function DrawVerticalStringUtil:_init_fields()
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.anchor = Anchor.TOP_LEFT
    if self.charHeight == nil then self.charHeight = 0 end
    if self.offsetY == nil then self.offsetY = 0 end
    self.offsetXArray = NullUtil.getInstance().NULL_INT_ARRAY
end

function DrawVerticalStringUtil._jinit(self)
    DrawVerticalStringUtil._init_fields(self)
    return self
end

function DrawVerticalStringUtil.new()
    return DrawVerticalStringUtil._jinit(setmetatable({}, DrawVerticalStringUtil))
end


function DrawVerticalStringUtil.getInstance()
        return DrawVerticalStringUtil.instance_f
end


function DrawVerticalStringUtil:updateMeasurement(graphics, string_)
        local openGLFeatureUtil = OpenGLFeatureUtil.getInstance()
        local font = graphics:getFont()
        self.charHeight = font:getHeight()
        self.offsetY = 0
        if J2MEUtil.isHTML() then
            self.charHeight = self.charHeight + (1)
        elseif openGLFeatureUtil:isAnyThreed() then
            self.charHeight = self.charHeight + (2)
            if AndroidUtil.isAndroid() then
            else
                self.offsetY = 2 + (java_idiv(self.charHeight * 2, 3))
            end
        end
        local size = #string_
        local aChar = "\0"
        local offsetXArray = java_typed_array("I", java_new_array(0, size))
        for index = size - 1, 0, -1 do
            aChar = string.sub(string_, (index) + 1, (index) + 1)
            if openGLFeatureUtil:isAnyThreed() then
                offsetXArray[index + 1] = font:charWidth(aChar) / 2
            end
        end
        self.offsetXArray = offsetXArray
end


function DrawVerticalStringUtil:paintVerticle(graphics, string_, x, y, anchor)
        local size = #string_
        local aChar = "\0"
        for index = size - 1, 0, -1 do
            aChar = string.sub(string_, (index) + 1, (index) + 1)
            graphics:drawChar(aChar, x + self.offsetXArray[index + 1], y + (self.charHeight * index) + self.offsetY, anchor)
        end
end


function DrawVerticalStringUtil:drawCenterString(graphics, string_, offset, length, x, y)
        local width = (((graphics:getFont():substringWidth(string_, offset, length)) // (1 << (1))))
        local try_ok, try_error, try_value = pcall(function()
            graphics:drawSubstring(string_, offset, length, x - width, y, self.anchor)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.put(tostring(StringMaker.new():append("Exception: stringLength: "):appendint(#string_):append(" offset: "):appendint(offset):append(" currentLength: "):appendint(length)), self, "drawCenterString")
        end
end


function DrawVerticalStringUtil:drawCenterStrings(graphics, stringArray, maxWidth, x, y)
        local extraLines = 0
        for index = 0, (stringArray.n or #stringArray) - 1 do
            local string_ = stringArray[index + 1]
            if not rawequal(string_, self.EMPTY_STRING) then
                local width = graphics:getFont():stringWidth(string_)
                local minTotalLines = 1
                if width > maxWidth then
                    minTotalLines = (java_idiv(width, maxWidth)) + 1
                end
                local linePortion = java_idiv(#string_, minTotalLines)
                local offset = 0
                local currentLength = linePortion
                local size = #string_
                while offset < size do
                    if offset + currentLength > size then
                        currentLength = size - offset
                    end
                    if not rawequal(offset + currentLength, size) then
                        while currentLength > 0 and not rawequal(stringArray[index + 1]:charAt(offset + currentLength), " ") do
                            currentLength = currentLength - 1
                        end
                        if currentLength <= 4 then
                            currentLength = linePortion
                        end
                    end
                    self:drawCenterString(graphics, string_, offset, currentLength, x, y + ((index + (function() local value = extraLines extraLines = value + 1 return value end)()) * self.charHeight))
                    offset = offset + currentLength
                    currentLength = linePortion
                end
                extraLines = extraLines - 1
            end
        end
end

DrawVerticalStringUtil.instance_f = DrawVerticalStringUtil.new()

return DrawVerticalStringUtil

