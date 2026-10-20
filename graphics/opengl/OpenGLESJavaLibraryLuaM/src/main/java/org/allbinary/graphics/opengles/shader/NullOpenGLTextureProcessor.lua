-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.graphics.opengles.shader


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullOpenGLTextureProcessor = {}
NullOpenGLTextureProcessor.__index = NullOpenGLTextureProcessor
NullOpenGLTextureProcessor.className = "NullOpenGLTextureProcessor"

function NullOpenGLTextureProcessor.new()
    local self = setmetatable({}, NullOpenGLTextureProcessor)
    return self
end


function NullOpenGLTextureProcessor.getInstance()
        return NullOpenGLTextureProcessor.instance
end

NullOpenGLTextureProcessor.instance = OpenGLObject3dProcessor.new()

return NullOpenGLTextureProcessor

