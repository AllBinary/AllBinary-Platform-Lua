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
-- package org.allbinary.media.image

local ImagesRatioUtil = {}
package.loaded["org.allbinary.media.image.ImagesRatioUtil"] = ImagesRatioUtil

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

-- local Point = require("java.awt.Point")
-- local Graphics2D = require("java.awt.Graphics2D")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")

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

-- class table ImagesRatioUtil is declared before the requires
ImagesRatioUtil.__index = ImagesRatioUtil
ImagesRatioUtil.className = "ImagesRatioUtil"
ImagesRatioUtil.javaClassName = "org.allbinary.media.image.ImagesRatioUtil"

function ImagesRatioUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageUtil = ImageUtil.getInstance()
end


function ImagesRatioUtil.getInstance()
        return ImagesRatioUtil.instance_f
end


function ImagesRatioUtil._jinit(self)
    ImagesRatioUtil._init_fields(self)
    return self
end

function ImagesRatioUtil.new(...)
    local self = setmetatable({}, ImagesRatioUtil)
    ImagesRatioUtil._jinit(self, ...)
    return self
end


function ImagesRatioUtil:isEqual(bufferedImageArray, totalImages)
        local end_ = totalImages
        if (bufferedImageArray.n or #bufferedImageArray) < totalImages then
            end_ = (bufferedImageArray.n or #bufferedImageArray)
        end
        local ratio = ((bufferedImageArray[1]:getWidth() + 0.0) / bufferedImageArray[1]:getHeight())
        for index = 1, end_ - 1 do
            if ratio ~= ((bufferedImageArray[index + 1]:getWidth() + 0.0) / bufferedImageArray[index + 1]:getHeight()) then
                return false
            end
        end
        return true
end


function ImagesRatioUtil:getAverage(bufferedImageArray, totalImages)
        local ratio = 0.0
        local end_ = totalImages
        if (bufferedImageArray.n or #bufferedImageArray) < totalImages then
            end_ = (bufferedImageArray.n or #bufferedImageArray)
        end
        for index = 0, end_ - 1 do
            ratio = ratio + (((bufferedImageArray[index + 1]:getWidth() + 0.0) / bufferedImageArray[index + 1]:getHeight()))
        end
        return (ratio / (end_ + 0.0))
end


-- throws Exception
function ImagesRatioUtil:fudge_j2(bufferedImage, ratio)
        local imageRatio = ((bufferedImage:getWidth() + 0.0) / bufferedImage:getHeight())
        local point = Point.new()
        local newHeight = bufferedImage:getHeight()
        local newWidth = bufferedImage:getWidth()
        if ratio > imageRatio then
            newWidth = java_int(((bufferedImage:getHeight() + 0.0) * ratio))
            point.x = (newWidth - bufferedImage:getWidth()) / 2
        else
            newHeight = java_int(((bufferedImage:getWidth() + 0.0) / ratio))
            point.y = (newHeight - bufferedImage:getHeight()) / 2
        end
        local commonLabels = CommonLabels.getInstance()
        self.logUtil:putF(tostring(commonLabels.WIDTH_LABEL + bufferedImage:getWidth()) .. " newWidth: " .. tostring(newWidth) .. tostring(commonLabels.HEIGHT_LABEL) .. tostring(bufferedImage:getHeight()) .. " newHeight: " .. tostring(newHeight) .. " needed ratio: " .. tostring(((newWidth + 0.0) / (newHeight + 0.0))), self, "fudge")
        local newBufferedImage = self.imageUtil:create(newWidth, newHeight)
        local g = newBufferedImage:createGraphics()
        if point.x > 0 then
            local firstColumnBufferedImage = bufferedImage:getSubimage(0, 0, 1, bufferedImage:getHeight())
            local lastColumnBufferedImage = bufferedImage:getSubimage(bufferedImage:getWidth() - 1, 0, 1, bufferedImage:getHeight())
            self.logUtil:putF("Draw some columns to fill in gap", self, "fudge")
            for index = 0, point.x - 1 do
                g:drawImage(firstColumnBufferedImage, index, 0, nil)
                g:drawImage(lastColumnBufferedImage, newWidth - index, 0, nil)
            end
        end
        if point.y > 0 then
            local firstRowBufferedImage = bufferedImage:getSubimage(0, 0, bufferedImage:getWidth(), 1)
            local lastRowBufferedImage = bufferedImage:getSubimage(0, bufferedImage:getHeight() - 1, bufferedImage:getWidth(), 1)
            self.logUtil:putF("Draw some rows to fill in gap", self, "fudge")
            for index = 0, point.y - 1 do
                g:drawImage(firstRowBufferedImage, 0, index, nil)
                g:drawImage(lastRowBufferedImage, 0, newHeight - index, nil)
            end
        end
        g:drawImage(bufferedImage, point.x, point.y, bufferedImage:getWidth(), bufferedImage:getHeight(), nil)
        return newBufferedImage
end


-- throws Exception
function ImagesRatioUtil:fudge_j3(bufferedImageArray, totalImages, ratio)
        local end_ = totalImages
        if (bufferedImageArray.n or #bufferedImageArray) < totalImages then
            end_ = (bufferedImageArray.n or #bufferedImageArray)
        end
        local fudgedBufferedImageArray = java_new_array(nil, end_)
        for index = 0, end_ - 1 do
            fudgedBufferedImageArray[index + 1] = self:fudge(bufferedImageArray[index + 1], ratio)
        end
        return fudgedBufferedImageArray
end
function ImagesRatioUtil:fudge(...)
    local count = select("#", ...)
    if count == 2 then return self:fudge_j2(...) end
    if count == 3 then return self:fudge_j3(...) end
    error("No method fudge takes " .. count .. " arguments")
end
ImagesRatioUtil.fudge__jdispatcher = ImagesRatioUtil.fudge

ImagesRatioUtil.instance_f = ImagesRatioUtil.new()

return ImagesRatioUtil

