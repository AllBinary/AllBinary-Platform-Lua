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
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageArrayRotationUtil = {}
ImageArrayRotationUtil.__index = ImageArrayRotationUtil
ImageArrayRotationUtil.className = "ImageArrayRotationUtil"

function ImageArrayRotationUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.TOTAL_ANGLE = "totalAngle: "
end

function ImageArrayRotationUtil.new()
    local self = setmetatable({}, ImageArrayRotationUtil)
    self:_init_fields()
    return self
end


function ImageArrayRotationUtil.getInstance()
        return ImageArrayRotationUtil.instance
end


-- throws IOException
function ImageArrayRotationUtil:process(imageProcessorInput, input, visitor)
        local totalAngle = nil
        if input == self.commonStrings.UP then
            totalAngle = tostring(-90)
        elseif input == self.commonStrings.DOWN then
            totalAngle = tostring(90)
        else
            totalAngle = tostring(input)
        end
        local generatedBufferedImage = nil
        local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
        for index = 0, (bufferedImageArray.n or #bufferedImageArray) - 1 do
            self.logUtil:putF(self.TOTAL_ANGLE .. tostring(totalAngle), self, self.commonStrings.RUN)
            generatedBufferedImage = ImageJ2SERotationUtil.getInstance():getRotatedImage(bufferedImageArray[index + 1], math.tointeger(totalAngle // 1))
            visitor:visit(generatedBufferedImage, input, index)
        end
end

ImageArrayRotationUtil.instance = ImageArrayRotationUtil.new()

return ImageArrayRotationUtil

