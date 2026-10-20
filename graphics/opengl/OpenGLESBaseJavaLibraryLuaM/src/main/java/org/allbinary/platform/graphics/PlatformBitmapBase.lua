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
-- package org.allbinary.platform.graphics

-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlatformBitmapBase = {}
PlatformBitmapBase.__index = PlatformBitmapBase
PlatformBitmapBase.className = "PlatformBitmapBase"

function PlatformBitmapBase:_init_fields()
    self.alpha = 255
    self.basicColor = BasicColorFactory.getInstance().NULL_COLOR
end

function PlatformBitmapBase.new()
    local self = setmetatable({}, PlatformBitmapBase)
    self:_init_fields()
    return self
end


function PlatformBitmapBase:getWidth()
        return 0
end


function PlatformBitmapBase:getHeight()
        return 0
end


function PlatformBitmapBase:getImage()
        return NullImage.NULL_IMAGE
end

PlatformBitmapBase.NULL_PLATFORM_BITMAP_BASE = PlatformBitmapBase.new()

return PlatformBitmapBase

