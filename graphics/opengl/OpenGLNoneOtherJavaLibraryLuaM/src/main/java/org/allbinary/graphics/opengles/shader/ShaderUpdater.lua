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

-- local EGLConfig = require("javax.microedition.khronos.egl.EGLConfig")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local RendererStrings = require("org.allbinary.graphics.opengles.renderer.RendererStrings")
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

local ShaderUpdater = {}
ShaderUpdater.__index = ShaderUpdater
ShaderUpdater.className = "ShaderUpdater"

function ShaderUpdater:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.rendererStrings = RendererStrings.getInstance()
end

function ShaderUpdater.new()
    local self = setmetatable({}, ShaderUpdater)
    self:_init_fields()
    return self
end


function ShaderUpdater.getInstance()
        return ShaderUpdater.instance
end


function ShaderUpdater:onSurfaceCreated(gl, eglConfig)
end

ShaderUpdater.instance = ShaderUpdater.new()

return ShaderUpdater

