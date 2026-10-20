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
-- package org.allbinary.image.opengles

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

local OpenGLESImageProcessor = {}
OpenGLESImageProcessor.__index = OpenGLESImageProcessor
OpenGLESImageProcessor.className = "OpenGLESImageProcessor"

function OpenGLESImageProcessor.new()
    local self = setmetatable({}, OpenGLESImageProcessor)
    return self
end


function OpenGLESImageProcessor.getInstance()
        return OpenGLESImageProcessor.instance
end


function OpenGLESImageProcessor:translate(gl, translateX, translateY)
end


function OpenGLESImageProcessor:rotate(gl, angle)
end


function OpenGLESImageProcessor:scale(gl, scaleX, scaleY)
end


function OpenGLESImageProcessor:colorMask(gl, red, green, blue, alpha)
end

OpenGLESImageProcessor.instance = OpenGLESImageProcessor.new()

return OpenGLESImageProcessor

