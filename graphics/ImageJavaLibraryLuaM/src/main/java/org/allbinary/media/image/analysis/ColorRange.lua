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
-- package org.allbinary.media.image.analysis

local ColorRange = {}
package.loaded["org.allbinary.media.image.analysis.ColorRange"] = ColorRange

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

-- local Color = require("java.awt.Color")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local ColorRangeInterface = require("org.allbinary.media.image.analysis.ColorRangeInterface")

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

-- class table ColorRange is declared before the requires
ColorRange.__index = ColorRange
ColorRange.className = "ColorRange"
ColorRange.javaClassName = "org.allbinary.media.image.analysis.ColorRange"
ColorRange.java_implements = " ColorRangeInterface "
ColorRange.java_interfaces = function() return {ColorRangeInterface} end

function ColorRange:_init_fields()
    if self.minRed == nil then self.minRed = 0 end
    if self.maxRed == nil then self.maxRed = 0 end
    if self.minGreen == nil then self.minGreen = 0 end
    if self.maxGreen == nil then self.maxGreen = 0 end
    if self.minBlue == nil then self.minBlue = 0 end
    if self.maxBlue == nil then self.maxBlue = 0 end
end


function ColorRange._jinit(self)
    ColorRange._init_fields(self)
        self.minRed = 0
        self.maxRed = 0
        self.minGreen = 0
        self.maxGreen = 0
        self.minBlue = 0
        self.maxBlue = 0
    return self
end

function ColorRange.new(...)
    local self = setmetatable({}, ColorRange)
    ColorRange._jinit(self, ...)
    return self
end


function ColorRange:getMinRed()
        return self.minRed
end


function ColorRange:setMinRed(minRed)
        self.minRed = minRed
end


function ColorRange:getMaxRed()
        return self.maxRed
end


function ColorRange:setMaxRed(maxRed)
        self.maxRed = maxRed
end


function ColorRange:getMinGreen()
        return self.minGreen
end


function ColorRange:setMinGreen(minGreen)
        self.minGreen = minGreen
end


function ColorRange:getMaxGreen()
        return self.maxGreen
end


function ColorRange:setMaxGreen(maxGreen)
        self.maxGreen = maxGreen
end


function ColorRange:getMinBlue()
        return self.minBlue
end


function ColorRange:setMinBlue(minBlue)
        self.minBlue = minBlue
end


function ColorRange:getMaxBlue()
        return self.maxBlue
end


function ColorRange:setMaxBlue(maxBlue)
        self.maxBlue = maxBlue
end


function ColorRange:isInRange(color)
        if color:getRed() >= self:getMinRed() and color:getRed() <= self:getMaxRed() and color:getGreen() >= self:getMinGreen() and color:getGreen() <= self:getMaxGreen() and color:getBlue() >= self:getMinBlue() and color:getBlue() <= self:getMaxBlue() then
            return true
        else
            return false
        end
end


function ColorRange:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("getMinRed(): ")
        stringBuffer:appendint(self:getMinRed())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMaxRed(): ")
        stringBuffer:appendint(self:getMaxRed())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMinGreen(): ")
        stringBuffer:appendint(self:getMinGreen())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMaxGreen(): ")
        stringBuffer:appendint(self:getMaxGreen())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMinBlue(): ")
        stringBuffer:appendint(self:getMinGreen())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMaxBlue(): ")
        stringBuffer:appendint(self:getMaxBlue())
        return tostring(stringBuffer)
end
ColorRange.__tostring = function(self) return self:toString() end

return ColorRange

