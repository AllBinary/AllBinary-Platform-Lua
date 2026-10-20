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

local AppRendererShaderUpdaterFactory = {}
AppRendererShaderUpdaterFactory.__index = AppRendererShaderUpdaterFactory
AppRendererShaderUpdaterFactory.className = "AppRendererShaderUpdaterFactory"
setmetatable(AppRendererShaderUpdaterFactory, {__index = ShaderUpdater})

function AppRendererShaderUpdaterFactory:_init_fields()
    self.NULL_SHADER_COMPOSITE_ARRAY = java_new_array(nil, 0)
    self.shaderCompositeArray = self.NULL_SHADER_COMPOSITE_ARRAY
    self.shaderOpenGLProcessorArray = java_new_array(nil, 0)
end

function AppRendererShaderUpdaterFactory.new()
    local self = setmetatable(ShaderUpdater.new(), AppRendererShaderUpdaterFactory)
    self:_init_fields()
    return self
end


function AppRendererShaderUpdaterFactory.getInstance()
        return AppRendererShaderUpdaterFactory.instanceC
end


function AppRendererShaderUpdaterFactory:getTestShaders()
        return self.shaderOpenGLProcessorArray
end


function AppRendererShaderUpdaterFactory:setShaderComposite(object3d)
end

AppRendererShaderUpdaterFactory.instanceC = AppRendererShaderUpdaterFactory.new()

return AppRendererShaderUpdaterFactory

