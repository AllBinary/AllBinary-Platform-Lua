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
-- package javax.microedition.lcdui

local PlatformImage = require("javax.microedition.lcdui.PlatformImage")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--PlatformNullImageJavaLibrary
local PostLoadPlatformImage = {}
PostLoadPlatformImage.__index = PostLoadPlatformImage
PostLoadPlatformImage.className = "PostLoadPlatformImage"
setmetatable(PostLoadPlatformImage, {__index = PlatformImage})

function PostLoadPlatformImage.new()
    local self = setmetatable(PlatformImage.new(), PostLoadPlatformImage)
    return self
end


function PostLoadPlatformImage.getInstance()
        return PostLoadPlatformImage.instance
end

PostLoadPlatformImage.instance = PostLoadPlatformImage.new()

return PostLoadPlatformImage

