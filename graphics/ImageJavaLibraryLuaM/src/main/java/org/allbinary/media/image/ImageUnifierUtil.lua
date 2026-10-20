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
-- local BufferedImage = require("java.awt.image.BufferedImage")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageUnifierUtil = {}
ImageUnifierUtil.__index = ImageUnifierUtil
ImageUnifierUtil.className = "ImageUnifierUtil"

function ImageUnifierUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageUtil = ImageUtil.getInstance()
end


function ImageUnifierUtil.getInstance()
        return ImageUnifierUtil.instance
end


function ImageUnifierUtil.new()
    local self = setmetatable({}, ImageUnifierUtil)
    self:_init_fields()
    return self
end


function ImageUnifierUtil:getDefaultConfiguration()
        local ge = GraphicsEnvironment.getLocalGraphicsEnvironment()
        local gd = ge:getDefaultScreenDevice()
        return gd:getDefaultConfiguration()
end


function ImageUnifierUtil:getImage(bufferedImageArray, imageUnifierProperties)
        local newBufferedImage = self.imageUtil:create(imageUnifierProperties:getWidth(), imageUnifierProperties:getHeight())
        local commonLabels = CommonLabels.getInstance()
        self.logUtil:putF("Setting Image - " .. tostring(commonLabels.WIDTH_LABEL) .. tostring(newBufferedImage:getWidth()) .. tostring(commonLabels.HEIGHT_LABEL) .. tostring(newBufferedImage:getHeight()), self, "getImage")
        local g = newBufferedImage:createGraphics()
        local columnIndex = 0
        local rowIndex = 0
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            local x = math.tointeger(imageUnifierProperties:getImageUnifierCell():getWidth() // 1) * (function() local value = columnIndex columnIndex = value + 1 return value end)()
            local y = math.tointeger(imageUnifierProperties:getImageUnifierCell():getHeight() // 1) * rowIndex
            self.logUtil:putF("Adding Image: " .. tostring(index) .. " x: " .. tostring(x) .. " y: " .. tostring(y), self, "getImage")
            g:drawImage(bufferedImageArray[index + 1], x, y, math.tointeger(imageUnifierProperties:getImageUnifierCell():getWidth() // 1), math.tointeger(imageUnifierProperties:getImageUnifierCell():getHeight() // 1), nil)
            local totalColumnsMinusOne = (math.tointeger(imageUnifierProperties:getColumns() // 1) - 1)
            if columnIndex > totalColumnsMinusOne then
                rowIndex = rowIndex + 1
                columnIndex = 0
            end
        end
        g:dispose()
        return newBufferedImage
end

ImageUnifierUtil.instance = ImageUnifierUtil.new()

return ImageUnifierUtil

