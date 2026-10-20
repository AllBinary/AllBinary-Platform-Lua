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
-- package org.allbinary.graphics.opengles

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLVUtilBase = {}
OpenGLVUtilBase.__index = OpenGLVUtilBase
OpenGLVUtilBase.className = "OpenGLVUtilBase"

function OpenGLVUtilBase.new()
    local self = setmetatable({}, OpenGLVUtilBase)
    return self
end


function OpenGLVUtilBase:glTexEnvix(gl, target, pname, param)
end


function OpenGLVUtilBase:glTexParameterix(gl, target, pname, param)
end


function OpenGLVUtilBase:glGenerateMipmap(gl, textureId, target, generateMipMap)
end

return OpenGLVUtilBase

