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

local ImageAnalysisResults = {}
ImageAnalysisResults.__index = ImageAnalysisResults
ImageAnalysisResults.className = "ImageAnalysisResults"

function ImageAnalysisResults:_init_fields()
    self.imageColorRangeResults = nil
    self.imageColorResults = nil
    self.averageAmbientLevel = 0.0
end


function ImageAnalysisResults.new()
    local self = setmetatable({}, ImageAnalysisResults)
    self:_init_fields()
        self.imageColorRangeResults = ImageColorRangeResults.new()
        self.imageColorResults = ImageColorResults.new()
    return self
end


function ImageAnalysisResults:getImageColorRangeResults()
        return self.imageColorRangeResults
end


function ImageAnalysisResults:setImageColorRangeResults(imageColorRangeResults)
        self.imageColorRangeResults = imageColorRangeResults
end


function ImageAnalysisResults:getAverageAmbientLevel()
        return self.averageAmbientLevel
end


function ImageAnalysisResults:setAverageAmbientLevel(averageAmbientLevel)
        self.averageAmbientLevel = averageAmbientLevel
end


function ImageAnalysisResults:getImageColorResults()
        return self.imageColorResults
end


function ImageAnalysisResults:setImageColorResults(imageColorResults)
        self.imageColorResults = imageColorResults
end

return ImageAnalysisResults

