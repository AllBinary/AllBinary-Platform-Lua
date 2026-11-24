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

local ComparisonImageInputOutput = {}
package.loaded["org.allbinary.media.image.comparison.ComparisonImageInputOutput"] = ComparisonImageInputOutput

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
local ImageOutputData = java_lazy("org.allbinary.input.automation.ImageOutputData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LongUtil = java_lazy("org.allbinary.logic.java.number.LongUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AutomaticCacheInterface = java_lazy("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local MediaDataFactory = java_lazy("org.allbinary.logic.visual.media.MediaDataFactory")
local ImagePersistanceUtil = java_lazy("org.allbinary.media.image.ImagePersistanceUtil")
local BufferedImageCacheable = java_lazy("org.allbinary.media.image.cache.BufferedImageCacheable")
local ImageIOInterface = java_lazy("org.allbinary.media.image.io.ImageIOInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ChangedPixelsUtil = java_lazy("org.allbinary.media.image.comparison.ChangedPixelsUtil")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")
local ImageComparisonResultCacheSingleton = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResultCacheSingleton")
local ImageComparisonResultFrameCacheable = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResultFrameCacheable")

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

-- class table ComparisonImageInputOutput is declared before the requires
ComparisonImageInputOutput.__index = ComparisonImageInputOutput
ComparisonImageInputOutput.className = "ComparisonImageInputOutput"
ComparisonImageInputOutput.javaClassName = "org.allbinary.media.image.comparison.ComparisonImageInputOutput"
ComparisonImageInputOutput.java_implements = " ImageIOInterface "
ComparisonImageInputOutput.java_interfaces = function() return {ImageIOInterface} end

function ComparisonImageInputOutput:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ComparisonImageInputOutput._jinit(self)
    ComparisonImageInputOutput._init_fields(self)
    return self
end

function ComparisonImageInputOutput.new(...)
    local self = setmetatable({}, ComparisonImageInputOutput)
    ComparisonImageInputOutput._jinit(self, ...)
    return self
end


-- throws Exception
function ComparisonImageInputOutput:save_j1(frame)
        local commonStrings = CommonStrings.getInstance()
        if frame > 0 then
            local imageComparisonResultFrameCacheable = (ImageComparisonResultCacheSingleton.getInstance()):get(frame)
            if imageComparisonResultFrameCacheable ~= nil then
                local imageComparisonResult = imageComparisonResultFrameCacheable:getImageComparisonResult()
                self:save(imageComparisonResult, imageComparisonResultFrameCacheable:getFrame())
            else
                self.logUtil:putF("Comparison Results Not Available for Output: " .. tostring(frame), self, commonStrings.SAVE)
            end
        else
            self.logUtil:putF("No Comparison Results: for first frame: " .. tostring(frame), self, commonStrings.SAVE)
        end
end


-- throws Exception
function ComparisonImageInputOutput:save_j2(imageComparisonResult, frame)
        local commonStrings = CommonStrings.getInstance()
        local filePathStringBuffer = StringMaker.new()
        filePathStringBuffer:append(ImageOutputData.SAVE_PATH)
        filePathStringBuffer:append(LongUtil.fillIn(tostring(frame)))
        filePathStringBuffer:append(ComparisonImageInputOutput.ROOT_NAME)
        local filePathStringBuffer1 = StringMaker.new()
        filePathStringBuffer1:append(tostring(filePathStringBuffer))
        filePathStringBuffer1:append("_1")
        filePathStringBuffer1:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePath1 = tostring(filePathStringBuffer1)
        local filePathStringBuffer2 = StringMaker.new()
        filePathStringBuffer2:append(tostring(filePathStringBuffer))
        filePathStringBuffer2:append("_2")
        filePathStringBuffer2:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePath2 = tostring(filePathStringBuffer2)
        local bufferedImageCacheables = ChangedPixelsUtil.generateBufferedImageChacheables(imageComparisonResult)
        self.logUtil:putF("Comparison Image File Path 1: " .. filePath1, self, commonStrings.SAVE)
        self.logUtil:putF("Comparison Image File Path 2: " .. filePath2, self, commonStrings.SAVE)
        local bufferedImageArray = java_new_array(nil, 2)
        bufferedImageArray[1] = bufferedImageCacheables[1]:getBufferedImage()
        bufferedImageArray[2] = bufferedImageCacheables[2]:getBufferedImage()
        local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
        imagePersistanceUtil:saveWithImageIO(filePath1, bufferedImageArray[1])
        imagePersistanceUtil:saveWithImageIO(filePath2, bufferedImageArray[2])
end
function ComparisonImageInputOutput:save(...)
    local count = select("#", ...)
    if count == 1 then return self:save_j1(...) end
    if count == 2 then return self:save_j2(...) end
    error("No method save takes " .. count .. " arguments")
end
ComparisonImageInputOutput.save__jdispatcher = ComparisonImageInputOutput.save

ComparisonImageInputOutput.ROOT_NAME = "_Changed_"

return ComparisonImageInputOutput

