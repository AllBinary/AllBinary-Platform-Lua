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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlatformBitmapBaseFactory = {}
PlatformBitmapBaseFactory.__index = PlatformBitmapBaseFactory
PlatformBitmapBaseFactory.className = "PlatformBitmapBaseFactory"

function PlatformBitmapBaseFactory.new()
    local self = setmetatable({}, PlatformBitmapBaseFactory)
    return self
end


function PlatformBitmapBaseFactory:createBitmap(image)
        return PlatformBitmapBase.NULL_PLATFORM_BITMAP_BASE
end

PlatformBitmapBaseFactory.NULL_PLATFORM_BITMAP_BASE_FACTORY = PlatformBitmapBaseFactory.new()

return PlatformBitmapBaseFactory

