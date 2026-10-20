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

local OpenGLESImageDraw = {}
OpenGLESImageDraw.__index = OpenGLESImageDraw
OpenGLESImageDraw.className = "OpenGLESImageDraw"

function OpenGLESImageDraw.new()
    local self = setmetatable({}, OpenGLESImageDraw)
    return self
end


function OpenGLESImageDraw.getInstance()
        return OpenGLESImageDraw.instance
end


function OpenGLESImageDraw:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
end


function OpenGLESImageDraw:draw(gl, x, y, z)
end

OpenGLESImageDraw.instance = OpenGLESImageDraw.new()

return OpenGLESImageDraw

