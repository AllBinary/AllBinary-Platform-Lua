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

local MirrorImageUtil = {}
package.loaded["org.allbinary.media.image.MirrorImageUtil"] = MirrorImageUtil

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

-- local Graphics2D = require("java.awt.Graphics2D")
-- local AffineTransform = require("java.awt.geom.AffineTransform")
-- local AffineTransformOp = require("java.awt.image.AffineTransformOp")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")

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

-- class table MirrorImageUtil is declared before the requires
MirrorImageUtil.__index = MirrorImageUtil
MirrorImageUtil.className = "MirrorImageUtil"
MirrorImageUtil.javaClassName = "org.allbinary.media.image.MirrorImageUtil"

function MirrorImageUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageUtil = ImageUtil.getInstance()
end


function MirrorImageUtil.getInstance()
        return MirrorImageUtil.instance_f
end


function MirrorImageUtil._jinit(self)
    MirrorImageUtil._init_fields(self)
    return self
end

function MirrorImageUtil.new(...)
    local self = setmetatable({}, MirrorImageUtil)
    MirrorImageUtil._jinit(self, ...)
    return self
end


function MirrorImageUtil:getImage(bufferedImage, verticle, horizontal)
        self.logUtil:putF("Starting", self, "getImage")
        local newBufferedImage = self.imageUtil:create(bufferedImage:getWidth(nil), bufferedImage:getHeight(nil))
        local g = newBufferedImage:createGraphics()
        if verticle then
            local tx = AffineTransform.getScaleInstance(1, -1)
            tx:translate(0, -bufferedImage:getHeight(nil))
            local op = AffineTransformOp.new(tx, AffineTransformOp.TYPE_NEAREST_NEIGHBOR)
            bufferedImage = op:filter(bufferedImage, nil)
        end
        if horizontal then
            local tx = AffineTransform.getScaleInstance(-1, 1)
            tx:translate(-bufferedImage:getWidth(nil), 0)
            local op = AffineTransformOp.new(tx, AffineTransformOp.TYPE_NEAREST_NEIGHBOR)
            bufferedImage = op:filter(bufferedImage, nil)
        end
        g:drawImage(bufferedImage, 0, 0, bufferedImage:getWidth(nil), bufferedImage:getHeight(nil), nil)
        g:dispose()
        return newBufferedImage
end


function MirrorImageUtil:getImages(bufferedImage, verticle, horizontal)
        local width = bufferedImage:getWidth()
        local height = bufferedImage:getHeight()
        local cellHeight = height
        local cellWidth = height
        local numberOfFramesPerOrientation = java_idiv(width, cellWidth)
        local numberOfFrames = numberOfFramesPerOrientation
        if verticle then
            numberOfFrames = numberOfFrames * (2)
        end
        if horizontal then
            numberOfFrames = numberOfFrames * (2)
        end
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("numberOfFramesPerOrientation: ") .. require("allbinary_java").to_string(numberOfFramesPerOrientation)) .. require("allbinary_java").to_string(" numberOfFrames: ")) .. require("allbinary_java").to_string(numberOfFrames), self, "getImages")
        local bufferedImageArray = java_new_array(nil, numberOfFrames)
        local y = 0
        for index = 0, numberOfFramesPerOrientation - 1 do
            local x = index * cellWidth
            bufferedImageArray[index + 1] = bufferedImage:getSubimage(x, y, cellWidth, cellHeight)
        end
        for index = 0, numberOfFramesPerOrientation - 1 do
            bufferedImageArray[index + numberOfFramesPerOrientation + 1] = self:getImage(bufferedImageArray[index + 1], verticle, horizontal)
        end
        return bufferedImageArray
end

MirrorImageUtil.instance_f = MirrorImageUtil.new()

return MirrorImageUtil

