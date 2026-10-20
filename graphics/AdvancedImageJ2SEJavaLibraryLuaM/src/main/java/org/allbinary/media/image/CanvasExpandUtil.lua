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

local CanvasExpandUtil = {}
CanvasExpandUtil.__index = CanvasExpandUtil
CanvasExpandUtil.className = "CanvasExpandUtil"

function CanvasExpandUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
end

function CanvasExpandUtil.new()
    local self = setmetatable({}, CanvasExpandUtil)
    self:_init_fields()
    return self
end


function CanvasExpandUtil.getInstance()
        return CanvasExpandUtil.instance
end


-- throws Exception
function CanvasExpandUtil:process(imageProcessorInput, increaseX, increaseY, visitor)
        local imageUtil = ImageUtil.getInstance()
        local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
        local subBufferedImageArray = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local bufferedImage = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            subBufferedImageArray[index + 1] = imageUtil:createBufferedImage(bufferedImage, bufferedImage:getWidth() + increaseX, bufferedImage:getHeight() + increaseY, false)
            visitor:visit(subBufferedImageArray[index + 1], self.stringUtil.EMPTY_STRING, index)
        end
end

CanvasExpandUtil.instance = CanvasExpandUtil.new()

return CanvasExpandUtil

