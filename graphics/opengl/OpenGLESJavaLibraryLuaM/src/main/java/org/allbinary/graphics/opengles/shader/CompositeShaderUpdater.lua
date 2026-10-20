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
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local ShaderUpdater = require("org.allbinary.graphics.opengles.shader.ShaderUpdater")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CompositeShaderUpdater = {}
CompositeShaderUpdater.__index = CompositeShaderUpdater
CompositeShaderUpdater.className = "CompositeShaderUpdater"
setmetatable(CompositeShaderUpdater, {__index = ShaderUpdater})

function CompositeShaderUpdater:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    self.shaderStrings = ShaderStrings.getInstance()
    self.uniformBlockHandleArray = nil
    self.uniformBlockArray = nil
    self.uniformHandleArray = nil
    self.uniformArray = nil
    self.attributeHandleArray = nil
    self.attributeArray = nil
end


function CompositeShaderUpdater.getInstance()
        return CompositeShaderUpdater.instanceC
end


function CompositeShaderUpdater.new(uniformBlockArray, uniformArray, attributeArray, attributeHandleArray)
    local self = setmetatable(ShaderUpdater.new(), CompositeShaderUpdater)
    self:_init_fields()
        self.uniformBlockArray = uniformBlockArray
        self.uniformBlockHandleArray = java_new_array(0, (self.uniformBlockArray.n or #self.uniformBlockArray))
        self.uniformArray = uniformArray
        self.uniformHandleArray = java_new_array(0, (self.uniformArray.n or #self.uniformArray))
        self.attributeArray = attributeArray
        self.attributeHandleArray = attributeHandleArray
    return self
end


function CompositeShaderUpdater:onSurfaceCreated(gl, eglConfig, programHandle)
end


function CompositeShaderUpdater:onSurfaceDestroyed(gl)
end

CompositeShaderUpdater.instanceC = CompositeShaderUpdater.new(StringUtil.getInstance():getArrayInstance(), StringUtil.getInstance():getArrayInstance(), StringUtil.getInstance():getArrayInstance(), NullUtil.getInstance().NULL_INT_ARRAY)

return CompositeShaderUpdater

