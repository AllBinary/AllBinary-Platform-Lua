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
local PreLoadPlatformImage = {}
PreLoadPlatformImage.__index = PreLoadPlatformImage
PreLoadPlatformImage.className = "PreLoadPlatformImage"
setmetatable(PreLoadPlatformImage, {__index = PlatformImage})

function PreLoadPlatformImage.new()
    local self = setmetatable(PlatformImage.new(), PreLoadPlatformImage)
    return self
end


function PreLoadPlatformImage.getInstance()
        return PreLoadPlatformImage.instance
end

PreLoadPlatformImage.instance = PreLoadPlatformImage.new()

return PreLoadPlatformImage

