-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.image

-- local InputStream = require("java.io.InputStream")
-- local Image = require("javax.microedition.lcdui.Image")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ImageCacheBaseJavaLibrary - J2ME
local ImageFactory = {}
ImageFactory.__index = ImageFactory
ImageFactory.className = "ImageFactory"

function ImageFactory.new()
    local self = setmetatable({}, ImageFactory)
    return self
end


function ImageFactory.getInstance()
        return ImageFactory.instance
end


-- throws Exception
function ImageFactory:createImageUrl(url)
        return Image.createImage(url)
end


-- throws Exception
function ImageFactory:createImage(caller, width, height)
        return Image.createImage(width, height)
end


-- throws Exception
function ImageFactory:createImageFromInputStream(key, inputStream)
        local image = Image.createImage(inputStream)
        return image
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ImageFactory:createImageFromInputStream(inputStream)
        return Image.createImage(inputStream)
end

ImageFactory.instance = ImageFactory.new()

return ImageFactory

