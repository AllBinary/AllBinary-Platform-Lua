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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrthogonalLightingOpenGLProcessorFactory = {}
OrthogonalLightingOpenGLProcessorFactory.__index = OrthogonalLightingOpenGLProcessorFactory
OrthogonalLightingOpenGLProcessorFactory.className = "OrthogonalLightingOpenGLProcessorFactory"

function OrthogonalLightingOpenGLProcessorFactory:_init_fields()
    self.sceneLightingOrthogonalModeOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.sceneLightsOrthogonalModeOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
end

function OrthogonalLightingOpenGLProcessorFactory.new()
    local self = setmetatable({}, OrthogonalLightingOpenGLProcessorFactory)
    self:_init_fields()
    return self
end


function OrthogonalLightingOpenGLProcessorFactory.getInstance()
        return OrthogonalLightingOpenGLProcessorFactory.instance
end

OrthogonalLightingOpenGLProcessorFactory.instance = OrthogonalLightingOpenGLProcessorFactory.new()

return OrthogonalLightingOpenGLProcessorFactory

