-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.media

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local RenderedImage = require("java.awt.image.RenderedImage")
-- local ImageIO = require("javax.imageio.ImageIO")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = require("org.allbinary.logic.io.file.AbFileNativeUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageIOUtil = {}
ImageIOUtil.__index = ImageIOUtil
ImageIOUtil.className = "ImageIOUtil"

function ImageIOUtil.new()
    local self = setmetatable({}, ImageIOUtil)
    return self
end


-- throws Exception
function ImageIOUtil.read(file)
        return ImageIO.read(AbFileNativeUtil.get(file))
end


-- throws Exception
function ImageIOUtil.write(renderedImage, name, file)
        return ImageIO.write(renderedImage, name, AbFileNativeUtil.get(file))
end

return ImageIOUtil

