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
local ImageProcessorInputCompositeInterface = require("org.allbinary.media.image.ImageProcessorInputCompositeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ImageProcessedVisitor = {}
ImageProcessedVisitor.__index = ImageProcessedVisitor
ImageProcessedVisitor.className = "ImageProcessedVisitor"
setmetatable(ImageProcessedVisitor, {__index = ImageProcessorInputCompositeInterface})


-- throws IOException
function ImageProcessedVisitor:visit(generatedBufferedImage, nameEnding, index)
    error("abstract method visit")
end

return ImageProcessedVisitor

