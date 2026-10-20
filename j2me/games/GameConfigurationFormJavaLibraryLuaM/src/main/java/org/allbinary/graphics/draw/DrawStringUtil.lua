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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local Anchor = require("org.allbinary.graphics.Anchor")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DrawStringUtil = {}
DrawStringUtil.__index = DrawStringUtil
DrawStringUtil.className = "DrawStringUtil"

function DrawStringUtil:_init_fields()
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.anchor = Anchor.TOP_LEFT
end

function DrawStringUtil.new()
    local self = setmetatable({}, DrawStringUtil)
    self:_init_fields()
    return self
end


function DrawStringUtil.getInstance()
        return DrawStringUtil.instance
end


function DrawStringUtil:drawCenterString(graphics, string, offset, length, x, y)
        local width = (((graphics:getFont():substringWidth(string, offset, length)) // (1 << (1))))
        local try_ok, try_error = pcall(function()
            graphics:drawSubstring(string, offset, length, x - width, y, self.anchor)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.put(tostring(StringMaker.new():append("Exception: stringLength: "):appendint(#string):append(" offset: "):appendint(offset):append(" currentLength: "):appendint(length)), self, "drawCenterString")
        end
end


function DrawStringUtil:drawCenterStrings(graphics, stringArray, maxWidth, charHeight, x, y)
        local extraLines = 0
        for index = 0, (stringArray.n or #stringArray) - 1 do
            local string = stringArray[index + 1]
            if string ~= self.EMPTY_STRING then
                local width = graphics:getFont():stringWidth(string)
                local minTotalLines = 1
                if width > maxWidth then
                    minTotalLines = (java_idiv(width, maxWidth)) + 1
                end
                local linePortion = java_idiv(#string, minTotalLines)
                local offset = 0
                local currentLength = linePortion
                local size = #string
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
                    self:drawCenterString(graphics, string, offset, currentLength, x, y + ((index + (function() local value = extraLines extraLines = value + 1 return value end)()) * charHeight))
                    offset = offset + currentLength
                    currentLength = linePortion
                end
                extraLines = extraLines - 1
            end
        end
end

DrawStringUtil.instance = DrawStringUtil.new()

return DrawStringUtil

