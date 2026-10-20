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
-- package min3d.core

-- local EGLConfig = require("javax.microedition.khronos.egl.EGLConfig")
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

-- Java interface
local Renderer = {}
Renderer.__index = Renderer
Renderer.className = "Renderer"


function Renderer:onSurfaceCreated(gl, config)
    error("abstract method onSurfaceCreated")
end


function Renderer:onSurfaceChanged(gl, width, height)
    error("abstract method onSurfaceChanged")
end


function Renderer:onDrawFrame(gl)
    error("abstract method onDrawFrame")
end

return Renderer

