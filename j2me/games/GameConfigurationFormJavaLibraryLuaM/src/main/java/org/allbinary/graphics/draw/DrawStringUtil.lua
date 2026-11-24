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

local DrawStringUtil = {}
package.loaded["org.allbinary.graphics.draw.DrawStringUtil"] = DrawStringUtil

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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AndroidUtil = java_lazy("org.allbinary.AndroidUtil")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
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

-- class table DrawStringUtil is declared before the requires
DrawStringUtil.__index = DrawStringUtil
DrawStringUtil.className = "DrawStringUtil"
DrawStringUtil.javaClassName = "org.allbinary.graphics.draw.DrawStringUtil"

function DrawStringUtil:_init_fields()
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.anchor = Anchor.TOP_LEFT
end

function DrawStringUtil._jinit(self)
    DrawStringUtil._init_fields(self)
    return self
end

function DrawStringUtil.new()
    return DrawStringUtil._jinit(setmetatable({}, DrawStringUtil))
end


function DrawStringUtil.getInstance()
        return DrawStringUtil.instance_f
end


function DrawStringUtil:drawCenterString(graphics, string_, offset, length, x, y)
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


function DrawStringUtil:drawCenterStrings(graphics, stringArray, maxWidth, charHeight, x, y)
        local extraLines = 0
        for index = 0, (stringArray.n or #stringArray) - 1 do
            local string_ = stringArray[index + 1]
            if string_ ~= self.EMPTY_STRING then
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
                    if offset + currentLength ~= size then
                        while currentLength > 0 and stringArray[index + 1]:charAt(offset + currentLength) ~= " " do
                            currentLength = currentLength - 1
                        end
                        if currentLength <= 4 then
                            currentLength = linePortion
                        end
                    end
                    self:drawCenterString(graphics, string_, offset, currentLength, x, y + ((index + (function() local value = extraLines extraLines = value + 1 return value end)()) * charHeight))
                    offset = offset + currentLength
                    currentLength = linePortion
                end
                extraLines = extraLines - 1
            end
        end
end

DrawStringUtil.instance_f = DrawStringUtil.new()

return DrawStringUtil

