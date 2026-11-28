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
-- package org.allbinary.media.image.comparison

local ChangedPixelsUtil = {}
package.loaded["org.allbinary.media.image.comparison.ChangedPixelsUtil"] = ChangedPixelsUtil

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
local PoolInterface = java_lazy("org.allbinary.logic.util.cache.PoolInterface")
local BufferedImageCacheable = java_lazy("org.allbinary.media.image.cache.BufferedImageCacheable")
local BufferedImageInfo = java_lazy("org.allbinary.media.image.cache.BufferedImageInfo")
local BufferedImageInfoFactory = java_lazy("org.allbinary.media.image.cache.BufferedImageInfoFactory")
local BufferedImagePoolSingleton = java_lazy("org.allbinary.media.image.cache.BufferedImagePoolSingleton")
local PixelDelta = java_lazy("org.allbinary.media.image.comparison.pixel.PixelDelta")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")

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

-- class table ChangedPixelsUtil is declared before the requires
ChangedPixelsUtil.__index = ChangedPixelsUtil
ChangedPixelsUtil.className = "ChangedPixelsUtil"
ChangedPixelsUtil.javaClassName = "org.allbinary.media.image.comparison.ChangedPixelsUtil"


function ChangedPixelsUtil._jinit(self)
    return self
end

function ChangedPixelsUtil.new(...)
    local self = setmetatable({}, ChangedPixelsUtil)
    ChangedPixelsUtil._jinit(self, ...)
    return self
end


-- throws Exception
function ChangedPixelsUtil.generateBufferedImageChacheables(imageComparisonInfo)
        local bufferedImageCacheables = nil
        local originalBufferedImage = imageComparisonInfo:getBufferedImages()[1]
        bufferedImageCacheables = java_new_array(nil, 2)
        local bufferedImageInfo = BufferedImageInfoFactory.getInstance(imageComparisonInfo.imageWidth, imageComparisonInfo.imageHeight, originalBufferedImage:getType())
        local poolInterface = BufferedImagePoolSingleton.getInstance()
        for index = 0, (bufferedImageCacheables.n or #bufferedImageCacheables) - 1 do
            local bufferedImageCacheable = poolInterface:remove(bufferedImageInfo)
            bufferedImageCacheables[index + 1] = bufferedImageCacheable
            bufferedImageCacheables[index + 1]:getBufferedImage():setRGB(ChangedPixelsUtil.START_X, ChangedPixelsUtil.START_Y, bufferedImageInfo:getWidth(), bufferedImageInfo:getHeight(), ChangedPixelsUtil.CLEAR_INT_ARRAY, ChangedPixelsUtil.OFFSET, ChangedPixelsUtil.SCAN_SIZE)
        end
        local vector = imageComparisonInfo:getNonMatchingPixelVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local pixelDelta = vector:get(index)
            if rawequal(pixelDelta:getColorDelta(), nil) then
                io.write(tostring("ColorDelta"))
                os.exit(0)
            end
            bufferedImageCacheables[1]:getBufferedImage():setRGB(pixelDelta:getPoint():getX(), pixelDelta:getPoint():getY(), pixelDelta:getColorDelta():getRgb1())
            bufferedImageCacheables[2]:getBufferedImage():setRGB(pixelDelta:getPoint():getX(), pixelDelta:getPoint():getY(), pixelDelta:getColorDelta():getRgb2())
        end
        return bufferedImageCacheables
end

ChangedPixelsUtil.START_X = 0
ChangedPixelsUtil.START_Y = 0
ChangedPixelsUtil.OFFSET = 0
ChangedPixelsUtil.SCAN_SIZE = 0
ChangedPixelsUtil.CLEAR_INT_ARRAY = java_typed_array("I", java_new_array(0, 1800 * 1600))

return ChangedPixelsUtil

