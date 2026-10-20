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
-- package org.allbinary.image

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageTypeUtil = {}
ImageTypeUtil.__index = ImageTypeUtil
ImageTypeUtil.className = "ImageTypeUtil"

function ImageTypeUtil:_init_fields()
    self.PNG = "png"
    self.JPG = "jpg"
    self.GIF = "gif"
    self.list = BasicArrayListD.new()
end


function ImageTypeUtil.new()
    local self = setmetatable({}, ImageTypeUtil)
    self:_init_fields()
        self.list:add(self.JPG)
        self.list:add(self.GIF)
        self.list:add(self.PNG)
    return self
end


function ImageTypeUtil:isSupported(mediaFileType)
        mediaFileType = string.lower(mediaFileType)
        for index = self.list:size() - 1, 0, -1 do
            local name = self.list:get(index)
            if ((mediaFileType < name and -1) or (mediaFileType > name and 1) or 0) == 0 then
                return true
            end
        end
        return false
end


function ImageTypeUtil.getInstance()
        return ImageTypeUtil.SINGLETON
end

ImageTypeUtil.SINGLETON = ImageTypeUtil.new()

return ImageTypeUtil

