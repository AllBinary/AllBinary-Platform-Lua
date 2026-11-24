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

local ImageAnalysisResults = {}
package.loaded["org.allbinary.media.image.analysis.ImageAnalysisResults"] = ImageAnalysisResults

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

local ImageColorRangeResults = java_lazy("org.allbinary.media.image.analysis.ImageColorRangeResults")
local ImageColorResults = java_lazy("org.allbinary.media.image.analysis.ImageColorResults")

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

-- class table ImageAnalysisResults is declared before the requires
ImageAnalysisResults.__index = ImageAnalysisResults
ImageAnalysisResults.className = "ImageAnalysisResults"
ImageAnalysisResults.javaClassName = "org.allbinary.media.image.analysis.ImageAnalysisResults"

function ImageAnalysisResults:_init_fields()
    if self.imageColorRangeResults == nil then self.imageColorRangeResults = nil end
    if self.imageColorResults == nil then self.imageColorResults = nil end
    if self.averageAmbientLevel == nil then self.averageAmbientLevel = 0.0 end
end


function ImageAnalysisResults._jinit(self)
    ImageAnalysisResults._init_fields(self)
        self.imageColorRangeResults = ImageColorRangeResults.new()
        self.imageColorResults = ImageColorResults.new()
    return self
end

function ImageAnalysisResults.new(...)
    local self = setmetatable({}, ImageAnalysisResults)
    ImageAnalysisResults._jinit(self, ...)
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

