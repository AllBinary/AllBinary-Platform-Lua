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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageColorRangeResults = {}
ImageColorRangeResults.__index = ImageColorRangeResults
ImageColorRangeResults.className = "ImageColorRangeResults"

function ImageColorRangeResults:_init_fields()
    self.colorRangeInterface = nil
    self.matchingPixelsChecked = 0
    self.totalPixelsChecked = 0
end


function ImageColorRangeResults.new()
    local self = setmetatable({}, ImageColorRangeResults)
    self:_init_fields()
        self:setColorRangeInterface(ColorRange.new())
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

