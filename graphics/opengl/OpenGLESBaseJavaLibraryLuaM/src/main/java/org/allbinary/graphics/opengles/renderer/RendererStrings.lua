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
-- package org.allbinary.graphics.opengles.renderer


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RendererStrings = {}
RendererStrings.__index = RendererStrings
RendererStrings.className = "RendererStrings"

function RendererStrings:_init_fields()
    self.ON_SURFACE_CREATED = "onSurfaceCreated"
    self.ON_SURFACE_CHANGED = "onSurfaceChanged"
    self.ON_DRAW_FRAME = "onDrawFrame"
    self.ON_DRAW_FRAME_THREED = "onDrawFrameThreed"
    self.ON_DRAW_FRAME_2D = "onDrawFrame2d"
end

function RendererStrings.new()
    local self = setmetatable({}, RendererStrings)
    self:_init_fields()
    return self
end


function RendererStrings.getInstance()
        return RendererStrings.instance
end

RendererStrings.instance = RendererStrings.new()

return RendererStrings

