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
-- package org.allbinary.platform.opengles

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlatformTextureBaseFactory = {}
PlatformTextureBaseFactory.__index = PlatformTextureBaseFactory
PlatformTextureBaseFactory.className = "PlatformTextureBaseFactory"

function PlatformTextureBaseFactory:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function PlatformTextureBaseFactory.new()
    local self = setmetatable({}, PlatformTextureBaseFactory)
    self:_init_fields()
    return self
end


function PlatformTextureBaseFactory:load(gl, target, level, image, border, flip)
end

PlatformTextureBaseFactory.NULL_PLATFORM_TEXTURE_BASE_FACTORY = PlatformTextureBaseFactory.new()

return PlatformTextureBaseFactory

