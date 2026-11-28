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

local ImageAnalysis = {}
package.loaded["org.allbinary.media.image.analysis.ImageAnalysis"] = ImageAnalysis

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
-- local BufferedImage = require("java.awt.image.BufferedImage")
local ColorCacheFactory = java_lazy("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = java_lazy("org.allbinary.graphics.color.ColorCacheable")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ColorAverage = java_lazy("org.allbinary.media.image.analysis.ColorAverage")
local ColorRangeInterface = java_lazy("org.allbinary.media.image.analysis.ColorRangeInterface")
local ImageAnalysisResults = java_lazy("org.allbinary.media.image.analysis.ImageAnalysisResults")
local ImageColorResults = java_lazy("org.allbinary.media.image.analysis.ImageColorResults")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table ImageAnalysis is declared before the requires
ImageAnalysis.__index = ImageAnalysis
ImageAnalysis.className = "ImageAnalysis"
ImageAnalysis.javaClassName = "org.allbinary.media.image.analysis.ImageAnalysis"

function ImageAnalysis:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ImageAnalysis.getInstance()
        return ImageAnalysis.instance_f
end


function ImageAnalysis._jinit(self)
    ImageAnalysis._init_fields(self)
    return self
end

function ImageAnalysis.new(...)
    local self = setmetatable({}, ImageAnalysis)
    ImageAnalysis._jinit(self, ...)
    return self
end


-- throws Exception
function ImageAnalysis:process(bufferedImageArray, colorRangeInterface)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(require("allbinary_java").to_string(CommonLabels.getInstance().START) .. require("allbinary_java").to_string(tostring(colorRangeInterface)), self, commonStrings.PROCESS)
        local imageAnalysisResultsArray = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            imageAnalysisResultsArray[index + 1] = ImageAnalysis.process(bufferedImageArray[index + 1], colorRangeInterface)
        end
        return imageAnalysisResultsArray
end


-- throws Exception
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

ImageAnalysis.instance_f = ImageAnalysis.new()

return ImageAnalysis

