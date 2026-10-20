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

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local ColorCacheFactory = require("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = require("org.allbinary.graphics.color.ColorCacheable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageAnalysis = {}
ImageAnalysis.__index = ImageAnalysis
ImageAnalysis.className = "ImageAnalysis"

function ImageAnalysis:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ImageAnalysis.getInstance()
        return ImageAnalysis.instance
end


function ImageAnalysis.new()
    local self = setmetatable({}, ImageAnalysis)
    self:_init_fields()
    return self
end


-- throws Exception
function ImageAnalysis:process(bufferedImageArray, colorRangeInterface)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. tostring(colorRangeInterface), self, commonStrings.PROCESS)
        local imageAnalysisResultsArray = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            imageAnalysisResultsArray[index + 1] = ImageAnalysis.process(bufferedImageArray[index + 1], colorRangeInterface)
        end
        return imageAnalysisResultsArray
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ImageAnalysis.process(bufferedImage, colorRangeInterface)
        local imageAnalysisResults = ImageAnalysisResults.new()
        local redTotal = 0
        local greenTotal = 0
        local blueTotal = 0
        for indexY = 0, bufferedImage:getHeight() - 1 do
            for indexX = 0, bufferedImage:getWidth() - 1 do
                local keyInteger = tostring(bufferedImage:getRGB(indexX, indexY))
                local colorCacheable = ColorCacheFactory.getInstance():get(keyInteger)
                local color = colorCacheable:getColor()
                ImageAnalysis.processColorRangeResults(imageAnalysisResults, colorRangeInterface, color)
                ImageAnalysis.processImageColorResults(imageAnalysisResults:getImageColorResults(), colorRangeInterface, color)
                redTotal = redTotal + (color:getRed())
                greenTotal = greenTotal + (color:getGreen())
                blueTotal = blueTotal + (color:getBlue())
            end
        end
        local totalPixels = imageAnalysisResults:getImageColorRangeResults():getTotalPixelsChecked()
        local colorAverage = imageAnalysisResults:getImageColorResults():getColorAverage()
        colorAverage:setAvgRed((redTotal + 0.0) / (totalPixels + 0.0))
        colorAverage:setAvgGreen((greenTotal + 0.0) / (totalPixels + 0.0))
        colorAverage:setAvgBlue((blueTotal + 0.0) / (totalPixels + 0.0))
        return imageAnalysisResults
end


function ImageAnalysis.processColorRangeResults(imageAnalysisResults, colorRangeInterface, color)
        if colorRangeInterface:isInRange(color) then
            imageAnalysisResults:getImageColorRangeResults():addMatchingPixelsChecked()
        else
        end
        imageAnalysisResults:getImageColorRangeResults():addTotalPixelsChecked()
end


function ImageAnalysis.processImageColorResults(imageColorResults, colorRangeInterface, color)
        if color:getRed() < imageColorResults:getColorRange():getMinRed() then
            imageColorResults:getColorRange():setMinRed(color:getRed())
        end
        if color:getGreen() < imageColorResults:getColorRange():getMinGreen() then
            imageColorResults:getColorRange():setMinGreen(color:getGreen())
        end
        if color:getBlue() < imageColorResults:getColorRange():getMinBlue() then
            imageColorResults:getColorRange():setMinBlue(color:getBlue())
        end
        if color:getRed() > imageColorResults:getColorRange():getMaxRed() then
            imageColorResults:getColorRange():setMaxRed(color:getRed())
        end
        if color:getGreen() > imageColorResults:getColorRange():getMaxGreen() then
            imageColorResults:getColorRange():setMaxGreen(color:getGreen())
        end
        if color:getBlue() > imageColorResults:getColorRange():getMaxBlue() then
            imageColorResults:getColorRange():setMaxBlue(color:getBlue())
        end
end

ImageAnalysis.instance = ImageAnalysis.new()

return ImageAnalysis

