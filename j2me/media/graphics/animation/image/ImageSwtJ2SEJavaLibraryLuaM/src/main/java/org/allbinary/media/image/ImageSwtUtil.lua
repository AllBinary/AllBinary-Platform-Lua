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

local Color = require("org.eclipse.swt.graphics.Color")
local RGB = require("org.eclipse.swt.graphics.RGB")
local BareMain = require("org.microemu.app.BareMain")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageSwtUtil = {}
ImageSwtUtil.__index = ImageSwtUtil
ImageSwtUtil.className = "ImageSwtUtil"

function ImageSwtUtil.new()
    local self = setmetatable({}, ImageSwtUtil)
    return self
end


function ImageSwtUtil.getInstance()
        return ImageSwtUtil.instance
end

ImageSwtUtil.instance = ImageSwtUtil.new()

return ImageSwtUtil

