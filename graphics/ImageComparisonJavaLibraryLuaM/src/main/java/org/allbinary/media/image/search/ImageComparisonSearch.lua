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
-- package org.allbinary.media.image.search

local ImageComparisonSearch = {}
package.loaded["org.allbinary.media.image.search.ImageComparisonSearch"] = ImageComparisonSearch

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")
local PixelDelta = java_lazy("org.allbinary.media.image.comparison.pixel.PixelDelta")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table ImageComparisonSearch is declared before the requires
ImageComparisonSearch.__index = ImageComparisonSearch
ImageComparisonSearch.className = "ImageComparisonSearch"
ImageComparisonSearch.javaClassName = "org.allbinary.media.image.search.ImageComparisonSearch"

function ImageComparisonSearch:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.isSameHeight == nil then self.isSameHeight = false end
    if self.isSameWidth == nil then self.isSameWidth = false end
    if self.pixelsThatMatch == nil then self.pixelsThatMatch = 0 end
    if self.pixelsIgnored == nil then self.pixelsIgnored = 0 end
    if self.imageHeight == nil then self.imageHeight = nil end
    if self.imageWidth == nil then self.imageWidth = nil end
    if self.tolerance == nil then self.tolerance = 0 end
    if self.nonMatchingPixelVector == nil then self.nonMatchingPixelVector = nil end
    if self.bufferedImages == nil then self.bufferedImages = nil end
    self.matchingPercent = (-1 + 0.0)
end


function ImageComparisonSearch._jinit(self, bufferedImage, bufferedImage2, tolerance)
    ImageComparisonSearch._init_fields(self)
        self.nonMatchingPixelVector = BasicArrayListD.new()
        self:setBufferedImages(java_new_array(nil, 2))
        self:getBufferedImages()[1] = bufferedImage
        self:getBufferedImages()[2] = bufferedImage2
        self.imageHeight = bufferedImage:getHeight()
        self.imageWidth = bufferedImage:getWidth()
        if bufferedImage:getHeight() ~= bufferedImage2:getHeight() then
            self.isSameHeight = false
            if self.imageHeight > bufferedImage2:getHeight() then
                self.imageHeight = bufferedImage2:getHeight()
            end
        else
            self.isSameHeight = true
        end
        if bufferedImage:getWidth() ~= bufferedImage2:getWidth() then
            self.isSameWidth = false
            if self.imageWidth > bufferedImage2:getWidth() then
                self.imageWidth = bufferedImage2:getWidth()
            end
        else
            self.isSameWidth = true
        end
        if not self.isSameWidth or not self.isSameHeight then
            local imageUtil = ImageUtil.getInstance()
            self.logUtil:putF("Images were not the same size? Most likely a resolution change.", self, self.commonStrings.CONSTRUCTOR)
            self.logUtil:putF("1: " .. imageUtil:toString(bufferedImage), self, self.commonStrings.CONSTRUCTOR)
            self.logUtil:putF("2: " .. imageUtil:toString(bufferedImage2), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function ImageComparisonSearch.new(...)
    local self = setmetatable({}, ImageComparisonSearch)
    ImageComparisonSearch._jinit(self, ...)
    return self
end


function ImageComparisonSearch:getMatchingPercent()
        if self.matchingPercent == (-1 + 0.0) then
            self.matchingPercent = (self.pixelsThatMatch + 0.0) / ((self.imageWidth * self.imageHeight) + 0.0)
        end
        return self.matchingPercent
end


function ImageComparisonSearch:add(pixel)
        self.nonMatchingPixelVector:add(pixel)
end


function ImageComparisonSearch:getNonMatchingPixelVector()
        return self.nonMatchingPixelVector
end


function ImageComparisonSearch:toString()
        return "ImageComparisonInfo: " .. " Number Of Matching Pixels: " .. tostring(self.pixelsThatMatch) .. "\nNumber Of Non-Matching Pixels: " .. tostring(self:getNonMatchingPixelVector():size()) .. "\nNumber Of Pixels Ignored: " .. tostring(self.pixelsIgnored) .. "\nMatching Percentage: " .. tostring(self:getMatchingPercent())
end
ImageComparisonSearch.__tostring = function(self) return self:toString() end


function ImageComparisonSearch:getBufferedImages()
        return self.bufferedImages
end


function ImageComparisonSearch:setBufferedImages(bufferedImages)
        self.bufferedImages = bufferedImages
end


function ImageComparisonSearch:getTolerance()
        return self.tolerance
end


function ImageComparisonSearch:setTolerance(tolerance)
        self.tolerance = tolerance
end

return ImageComparisonSearch

