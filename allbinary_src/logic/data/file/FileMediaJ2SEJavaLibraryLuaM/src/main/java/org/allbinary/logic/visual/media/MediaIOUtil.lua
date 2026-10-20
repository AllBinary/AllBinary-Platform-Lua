-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.media

-- local ImageIO = require("javax.imageio.ImageIO")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MediaIOUtil = {}
MediaIOUtil.__index = MediaIOUtil
MediaIOUtil.className = "MediaIOUtil"

function MediaIOUtil.new()
    local self = setmetatable({}, MediaIOUtil)
    return self
end


function MediaIOUtil.getInstance()
        return MediaIOUtil.instance
end


function MediaIOUtil:getReaderFormatNames()
        return ImageIO.getReaderFormatNames()
end


function MediaIOUtil:getWriterFormatNames()
        return ImageIO.getWriterFormatNames()
end

MediaIOUtil.instance = MediaIOUtil.new()

return MediaIOUtil

