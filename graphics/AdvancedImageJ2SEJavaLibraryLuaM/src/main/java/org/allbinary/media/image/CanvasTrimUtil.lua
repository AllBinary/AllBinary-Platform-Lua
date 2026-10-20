-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local IOException = require("java.io.IOException")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

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

local CanvasTrimUtil = {}
CanvasTrimUtil.__index = CanvasTrimUtil
CanvasTrimUtil.className = "CanvasTrimUtil"

function CanvasTrimUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
end

function CanvasTrimUtil.new()
    local self = setmetatable({}, CanvasTrimUtil)
    self:_init_fields()
    return self
end


function CanvasTrimUtil.getInstance()
        return CanvasTrimUtil.instance
end


-- throws IOException
function CanvasTrimUtil:process(imageProcessorInput, cutCanvasFromLeftReduction, cutCanvasFromTopReduction, cutCanvasFromRightReduction, cutCanvasFromBottomReduction, visitor)
        local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
        local subBufferedImageArray = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local bufferedImage = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            subBufferedImageArray[index + 1] = bufferedImage:getSubimage(cutCanvasFromLeftReduction, cutCanvasFromTopReduction, bufferedImage:getWidth() - cutCanvasFromLeftReduction - cutCanvasFromRightReduction, bufferedImage:getHeight() - cutCanvasFromTopReduction - cutCanvasFromBottomReduction)
            visitor:visit(subBufferedImageArray[index + 1], self.stringUtil.EMPTY_STRING, index)
        end
end

CanvasTrimUtil.instance = CanvasTrimUtil.new()

return CanvasTrimUtil

