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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local File = require("java.io.File")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageProcessorInput = {}
ImageProcessorInput.__index = ImageProcessorInput
ImageProcessorInput.className = "ImageProcessorInput"

function ImageProcessorInput:_init_fields()
    self.bufferedImageArray = nil
    self.files = nil
end


function ImageProcessorInput.new(files, bufferedImageArray)
    local self = setmetatable({}, ImageProcessorInput)
    self:_init_fields()
        -- super(...) made self above
        self.bufferedImageArray = bufferedImageArray
        self.files = files
    return self
end


function ImageProcessorInput:getBufferedImageArray()
        return self.bufferedImageArray
end


function ImageProcessorInput:getFiles()
        return self.files
end

return ImageProcessorInput

