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
-- package org.allbinary.media.image.comparison.motion

local MotionRectanglesImageInputOutput = {}
package.loaded["org.allbinary.media.image.comparison.motion.MotionRectanglesImageInputOutput"] = MotionRectanglesImageInputOutput

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

-- local Graphics = require("java.awt.Graphics")
-- local Rectangle = require("java.awt.Rectangle")
-- local Color = require("java.awt.Color")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ImageOutputData = java_lazy("org.allbinary.input.automation.ImageOutputData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LongUtil = java_lazy("org.allbinary.logic.java.number.LongUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AutomaticCacheInterface = java_lazy("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local PoolInterface = java_lazy("org.allbinary.logic.util.cache.PoolInterface")
local MediaDataFactory = java_lazy("org.allbinary.logic.visual.media.MediaDataFactory")
local ImagePersistanceUtil = java_lazy("org.allbinary.media.image.ImagePersistanceUtil")
local BufferedImageCacheable = java_lazy("org.allbinary.media.image.cache.BufferedImageCacheable")
local BufferedImageInfo = java_lazy("org.allbinary.media.image.cache.BufferedImageInfo")
local BufferedImageInfoFactory = java_lazy("org.allbinary.media.image.cache.BufferedImageInfoFactory")
local BufferedImagePoolSingleton = java_lazy("org.allbinary.media.image.cache.BufferedImagePoolSingleton")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")
local ImageIOInterface = java_lazy("org.allbinary.media.image.io.ImageIOInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AllMotionRectanglesResultsCacheSingleton = java_lazy("org.allbinary.media.image.comparison.motion.AllMotionRectanglesResultsCacheSingleton")
local ConsolidatedMotionRectanglesResultsCacheSingleton = java_lazy("org.allbinary.media.image.comparison.motion.ConsolidatedMotionRectanglesResultsCacheSingleton")
local ConstrainedMotionRectanglesResultsCacheSingleton = java_lazy("org.allbinary.media.image.comparison.motion.ConstrainedMotionRectanglesResultsCacheSingleton")
local MotionRectangle = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangle")
local MotionRectangles = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangles")
local MotionRectanglesResultsFrameCacheable = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsFrameCacheable")

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

-- class table MotionRectanglesImageInputOutput is declared before the requires
MotionRectanglesImageInputOutput.__index = MotionRectanglesImageInputOutput
MotionRectanglesImageInputOutput.className = "MotionRectanglesImageInputOutput"
MotionRectanglesImageInputOutput.javaClassName = "org.allbinary.media.image.comparison.motion.MotionRectanglesImageInputOutput"
MotionRectanglesImageInputOutput.java_implements = " ImageIOInterface "
MotionRectanglesImageInputOutput.java_interfaces = function() return {ImageIOInterface} end

function MotionRectanglesImageInputOutput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NUMBER_OF_IMAGES = 1
end


function MotionRectanglesImageInputOutput._jinit(self)
    MotionRectanglesImageInputOutput._init_fields(self)
    return self
end

function MotionRectanglesImageInputOutput.new(...)
    local self = setmetatable({}, MotionRectanglesImageInputOutput)
    MotionRectanglesImageInputOutput._jinit(self, ...)
    return self
end


-- throws Exception
function MotionRectanglesImageInputOutput:save_j1(frame)
        local commonStrings = CommonStrings.getInstance()
        local motionRectanglesResultsFrameCacheable = (AllMotionRectanglesResultsCacheSingleton.getInstance()):get(frame)
        if motionRectanglesResultsFrameCacheable ~= nil then
            local motionRectangles = motionRectanglesResultsFrameCacheable:getMotionRectangles()
            self:save(motionRectangles, frame)
            motionRectanglesResultsFrameCacheable = (ConsolidatedMotionRectanglesResultsCacheSingleton.getInstance()):get(frame)
            motionRectangles = motionRectanglesResultsFrameCacheable:getMotionRectangles()
            self:save(motionRectangles, frame)
            motionRectanglesResultsFrameCacheable = (ConstrainedMotionRectanglesResultsCacheSingleton.getInstance()):get(frame)
            motionRectangles = motionRectanglesResultsFrameCacheable:getMotionRectangles()
            self:save(motionRectangles, frame)
        else
            self.logUtil:putF("No Motion Rectangle Results for Frame: " .. tostring(frame), self, commonStrings.SAVE)
        end
end


-- throws Exception
function MotionRectanglesImageInputOutput:save_j2(motionRectangles, frame)
        local commonStrings = CommonStrings.getInstance()
        local filePathStringBuffer = StringMaker.new()
        filePathStringBuffer:append(ImageOutputData.SAVE_PATH)
        filePathStringBuffer:append(LongUtil.fillIn(tostring(frame)))
        filePathStringBuffer:append("_")
        filePathStringBuffer:append(motionRectangles:getName())
        local filePathStringBuffer1 = StringMaker.new()
        filePathStringBuffer1:append(tostring(filePathStringBuffer))
        filePathStringBuffer1:append("_1")
        filePathStringBuffer1:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePathStringBuffer2 = StringMaker.new()
        filePathStringBuffer2:append(tostring(filePathStringBuffer))
        filePathStringBuffer2:append("_2")
        filePathStringBuffer2:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePathStringBuffer3 = StringMaker.new()
        filePathStringBuffer3:append(tostring(filePathStringBuffer))
        filePathStringBuffer3:append(MediaDataFactory.getInstance().JPG:getExtension())
        self.logUtil:putF("Motion Image File Path 1: " .. tostring(filePathStringBuffer1), self, commonStrings.SAVE)
        self.logUtil:putF("Motion Image File Path 2: " .. tostring(filePathStringBuffer2), self, commonStrings.SAVE)
        self.logUtil:putF("Motion Image File Path 2: " .. tostring(filePathStringBuffer3), self, commonStrings.SAVE)
        local bufferedImageCacheables = java_new_array(nil, self.NUMBER_OF_IMAGES)
        local imageComparisonInfo = motionRectangles:getImageComparisonResult()
        local originalBufferedImage = imageComparisonInfo:getBufferedImages()[1]
        local bufferedImageInfo = BufferedImageInfoFactory.getInstance(imageComparisonInfo.imageWidth, imageComparisonInfo.imageHeight, originalBufferedImage:getType())
        local poolInterface = BufferedImagePoolSingleton.getInstance()
        for index = 0, self.NUMBER_OF_IMAGES - 1 do
            bufferedImageCacheables[index + 1] = poolInterface:remove(bufferedImageInfo)
        end
        bufferedImageCacheables[1]:getBufferedImage():setData(imageComparisonInfo:getBufferedImages()[2]:getData())
        if self.NUMBER_OF_IMAGES > 1 then
            bufferedImageCacheables[2]:getBufferedImage():setData(imageComparisonInfo:getBufferedImages()[2]:getData())
        end
        local bufferedImageGraphicsArray = nil
        bufferedImageGraphicsArray = java_new_array(nil, self.NUMBER_OF_IMAGES)
        for index = 0, self.NUMBER_OF_IMAGES - 1 do
            bufferedImageGraphicsArray[index + 1] = bufferedImageCacheables[index + 1]:getBufferedImage():getGraphics()
        end
        local rectangelList = motionRectangles:getVector()
        local size = rectangelList:size()
        for index2 = 0, size - 1 do
            local motionRectangle = rectangelList:get(index2)
            local rectangle = motionRectangle:getRectangle()
            for index = 0, self.NUMBER_OF_IMAGES - 1 do
                bufferedImageGraphicsArray[index + 1]:setColor(Color.ORANGE)
                bufferedImageGraphicsArray[index + 1]:drawRect(rectangle.x, rectangle.y, rectangle.width, rectangle.height)
            end
        end
        local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
        if self.NUMBER_OF_IMAGES > 1 then
            imagePersistanceUtil:saveWithImageIO(tostring(filePathStringBuffer1), bufferedImageCacheables[2]:getBufferedImage())
        end
        imagePersistanceUtil:saveWithImageIO(tostring(filePathStringBuffer2), bufferedImageCacheables[1]:getBufferedImage())
        if self.NUMBER_OF_IMAGES > 2 then
            imagePersistanceUtil:saveWithImageIO(tostring(filePathStringBuffer3), bufferedImageCacheables[3]:getBufferedImage())
        end
end
function MotionRectanglesImageInputOutput:save(...)
    local count = select("#", ...)
    if count == 1 then return self:save_j1(...) end
    if count == 2 then return self:save_j2(...) end
    error("No method save takes " .. count .. " arguments")
end
MotionRectanglesImageInputOutput.save__jdispatcher = MotionRectanglesImageInputOutput.save

return MotionRectanglesImageInputOutput

