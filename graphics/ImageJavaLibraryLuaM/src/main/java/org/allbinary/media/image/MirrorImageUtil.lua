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

-- local awt = require("java.awt")
-- local AffineTransform = require("java.awt.geom.AffineTransform")
-- local AffineTransformOp = require("java.awt.image.AffineTransformOp")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

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

local MirrorImageUtil = {}
MirrorImageUtil.__index = MirrorImageUtil
MirrorImageUtil.className = "MirrorImageUtil"

function MirrorImageUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageUtil = ImageUtil.getInstance()
end


function MirrorImageUtil.getInstance()
        return MirrorImageUtil.instance
end


function MirrorImageUtil.new()
    local self = setmetatable({}, MirrorImageUtil)
    self:_init_fields()
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
        self.logUtil:putF("numberOfFramesPerOrientation: " .. tostring(numberOfFramesPerOrientation) .. " numberOfFrames: " .. tostring(numberOfFrames), self, "getImages")
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

MirrorImageUtil.instance = MirrorImageUtil.new()

return MirrorImageUtil

