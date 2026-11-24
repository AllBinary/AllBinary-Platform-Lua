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

local ImageComparator = {}
package.loaded["org.allbinary.media.image.comparison.ImageComparator"] = ImageComparator

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
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local ColorCacheFactory = java_lazy("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = java_lazy("org.allbinary.graphics.color.ColorCacheable")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AutomaticCacheInterface = java_lazy("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local PixelDeltaFactory = java_lazy("org.allbinary.media.image.comparison.pixel.PixelDeltaFactory")
local ImageComparatorConstraintsInterface = java_lazy("org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table ImageComparator is declared before the requires
ImageComparator.__index = ImageComparator
ImageComparator.className = "ImageComparator"
ImageComparator.javaClassName = "org.allbinary.media.image.comparison.ImageComparator"

function ImageComparator:_init_fields()
    if self.imageComparatorConstraintsInterface == nil then self.imageComparatorConstraintsInterface = nil end
end


function ImageComparator._jinit(self, imageComparatorConstraintsInterface)
    ImageComparator._init_fields(self)
        self.imageComparatorConstraintsInterface = imageComparatorConstraintsInterface
    return self
end

function ImageComparator.new(...)
    local self = setmetatable({}, ImageComparator)
    ImageComparator._jinit(self, ...)
    return self
end


-- throws Exception
function ImageComparator:process(imageComparisonInfo, point)
        local isCollsionWithAvoidRectangles = self.imageComparatorConstraintsInterface:isCollisionWithAvoidRectangles(point)
        if not isCollsionWithAvoidRectangles then
            local rgb1 = imageComparisonInfo:getBufferedImages()[1]:getRGB(point:getX(), point:getY())
            local rgb2 = imageComparisonInfo:getBufferedImages()[2]:getRGB(point:getX(), point:getY())
            local automaticCacheInterface = ColorCacheFactory.getInstance()
            local colorInteger = tostring(rgb1)
            local colorCacheable = automaticCacheInterface:get(colorInteger)
            local color = colorCacheable:getColor()
            local colorInteger2 = tostring(rgb2)
            local colorCacheable2 = automaticCacheInterface:get(colorInteger)
            local color2 = colorCacheable:getColor()
            if self.imageComparatorConstraintsInterface:isColorAllowed(0, point, color) or self.imageComparatorConstraintsInterface:isColorAllowed(1, point, color2) then
                if math.abs(rgb1 - rgb2) <= imageComparisonInfo:getTolerance() then
                    imageComparisonInfo.pixelsThatMatch = imageComparisonInfo.pixelsThatMatch + 1
                else
                    imageComparisonInfo:add(PixelDeltaFactory.getInstance(point:getX(), point:getY(), rgb1, rgb2))
                end
            end
        else
            imageComparisonInfo.pixelsIgnored = imageComparisonInfo.pixelsIgnored + 1
        end
end


-- throws Exception
function ImageComparator:compare_j5(bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance)
        return self:compare(bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance, StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
function ImageComparator:compare_j6(bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance, name)
        if bufferedImage1 == nil or bufferedImage2 == nil then
            error(require("java.lang.Exception").new("Input images must not be null."), 0)
        end
        local imageComparisonInfo = ImageComparisonResult.new(name, bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance)
        for indexY = 0, imageComparisonInfo.imageHeight - 1 do
            for indexX = 0, imageComparisonInfo.imageWidth - 1 do
                self:process(imageComparisonInfo, PointFactory.getInstance():createXY(indexX, indexY))
                if imageComparisonInfo:getNonMatchingPixelVector():size() > self.imageComparatorConstraintsInterface:getMaxNonMatchingPixelDeltas() then
                    break
                end
            end
        end
        return imageComparisonInfo
end
function ImageComparator:compare(...)
    local count = select("#", ...)
    if count == 5 then return self:compare_j5(...) end
    if count == 6 then return self:compare_j6(...) end
    error("No method compare takes " .. count .. " arguments")
end
ImageComparator.compare__jdispatcher = ImageComparator.compare

return ImageComparator

