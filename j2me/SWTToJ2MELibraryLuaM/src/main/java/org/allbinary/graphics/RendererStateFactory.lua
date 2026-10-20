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
-- package org.allbinary.graphics


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RendererStateFactory = {}
RendererStateFactory.__index = RendererStateFactory
RendererStateFactory.className = "RendererStateFactory"

function RendererStateFactory:_init_fields()
    self.loaded = false
    self.surfaceChanged = false
end

function RendererStateFactory.new()
    local self = setmetatable({}, RendererStateFactory)
    self:_init_fields()
    return self
end


function RendererStateFactory.getInstance()
        return RendererStateFactory.instance
end


function RendererStateFactory:setLoaded(loaded)
        self.loaded = loaded
end


function RendererStateFactory:isLoaded()
        return self.loaded
end


function RendererStateFactory:setSurfaceChanged(initialized)
        self.surfaceChanged = initialized
end


function RendererStateFactory:isSurfaceChanged()
        return self.surfaceChanged
end

RendererStateFactory.instance = RendererStateFactory.new()

return RendererStateFactory

