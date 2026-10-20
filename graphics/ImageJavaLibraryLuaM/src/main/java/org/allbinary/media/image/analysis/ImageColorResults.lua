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

local ImageColorResults = {}
ImageColorResults.__index = ImageColorResults
ImageColorResults.className = "ImageColorResults"

function ImageColorResults:_init_fields()
    self.colorRange = nil
    self.colorAverage = nil
end


function ImageColorResults.new()
    local self = setmetatable({}, ImageColorResults)
    self:_init_fields()
        self:setColorRange(ColorRange.new())
        self:getColorRange():setMaxRed(-1)
        self:getColorRange():setMaxGreen(-1)
        self:getColorRange():setMaxBlue(-1)
        self:getColorRange():setMinRed(256)
        self:getColorRange():setMinGreen(256)
        self:getColorRange():setMinBlue(256)
        self:setColorAverage(ColorAverage.new())
    return self
end


function ImageColorResults:getColorRange()
        return self.colorRange
end


function ImageColorResults:setColorRange(colorRange)
        self.colorRange = colorRange
end


function ImageColorResults:getColorAverage()
        return self.colorAverage
end


function ImageColorResults:setColorAverage(colorAverage)
        self.colorAverage = colorAverage
end

return ImageColorResults

