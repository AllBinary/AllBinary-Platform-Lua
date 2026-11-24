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

local ImageColorRangeResults = {}
package.loaded["org.allbinary.media.image.analysis.ImageColorRangeResults"] = ImageColorRangeResults

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

local ColorRange = java_lazy("org.allbinary.media.image.analysis.ColorRange")
local ColorRangeInterface = java_lazy("org.allbinary.media.image.analysis.ColorRangeInterface")

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

-- class table ImageColorRangeResults is declared before the requires
ImageColorRangeResults.__index = ImageColorRangeResults
ImageColorRangeResults.className = "ImageColorRangeResults"
ImageColorRangeResults.javaClassName = "org.allbinary.media.image.analysis.ImageColorRangeResults"

function ImageColorRangeResults:_init_fields()
    if self.colorRangeInterface == nil then self.colorRangeInterface = nil end
    if self.matchingPixelsChecked == nil then self.matchingPixelsChecked = 0 end
    if self.totalPixelsChecked == nil then self.totalPixelsChecked = 0 end
end


function ImageColorRangeResults._jinit(self)
    ImageColorRangeResults._init_fields(self)
        self:setColorRangeInterface(ColorRange.new())
    return self
end

function ImageColorRangeResults.new(...)
    local self = setmetatable({}, ImageColorRangeResults)
    ImageColorRangeResults._jinit(self, ...)
    return self
end


function ImageColorRangeResults:getColorRangeInterface()
        return self.colorRangeInterface
end


function ImageColorRangeResults:setColorRangeInterface(colorRangeInterface)
        self.colorRangeInterface = colorRangeInterface
end


function ImageColorRangeResults:getMatchingPixelsChecked()
        return self.matchingPixelsChecked
end


function ImageColorRangeResults:setMatchingPixelsChecked(matchingPixelsChecked)
        self.matchingPixelsChecked = matchingPixelsChecked
end


function ImageColorRangeResults:addMatchingPixelsChecked()
        self.matchingPixelsChecked = self.matchingPixelsChecked + 1
end


function ImageColorRangeResults:getTotalPixelsChecked()
        return self.totalPixelsChecked
end


function ImageColorRangeResults:addTotalPixelsChecked()
        self.totalPixelsChecked = self.totalPixelsChecked + 1
end


function ImageColorRangeResults:setTotalPixelsChecked(totalPixelsChecked)
        self.totalPixelsChecked = totalPixelsChecked
end


function ImageColorRangeResults:getPercent()
        return ((self:getMatchingPixelsChecked() + 0.0) / (self:getTotalPixelsChecked() + 0.0))
end

return ImageColorRangeResults

