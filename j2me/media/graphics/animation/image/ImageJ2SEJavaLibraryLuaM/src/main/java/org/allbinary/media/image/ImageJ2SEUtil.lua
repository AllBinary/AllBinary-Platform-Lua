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

-- local Color = require("java.awt.Color")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageJ2SEUtil = {}
ImageJ2SEUtil.__index = ImageJ2SEUtil
ImageJ2SEUtil.className = "ImageJ2SEUtil"

function ImageJ2SEUtil:_init_fields()
    self.TRANSPARENT_COLOR = Color.new(0, 0, 0, 0)
end

function ImageJ2SEUtil.new()
    local self = setmetatable({}, ImageJ2SEUtil)
    self:_init_fields()
    return self
end


function ImageJ2SEUtil.getInstance()
        return ImageJ2SEUtil.instance
end

ImageJ2SEUtil.instance = ImageJ2SEUtil.new()

return ImageJ2SEUtil

