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
-- package org.allbinary.device


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLESGraphicsCompositeFactory = {}
OpenGLESGraphicsCompositeFactory.__index = OpenGLESGraphicsCompositeFactory
OpenGLESGraphicsCompositeFactory.className = "OpenGLESGraphicsCompositeFactory"

function OpenGLESGraphicsCompositeFactory:_init_fields()
    self.openGLESGraphicsFactory = OpenGLESGraphicsFactory.new()
end

function OpenGLESGraphicsCompositeFactory.new()
    local self = setmetatable({}, OpenGLESGraphicsCompositeFactory)
    self:_init_fields()
    return self
end


function OpenGLESGraphicsCompositeFactory.getInstance()
        return OpenGLESGraphicsCompositeFactory.instance
end


function OpenGLESGraphicsCompositeFactory:set(openGLESGraphicsFactory)
        self.openGLESGraphicsFactory = openGLESGraphicsFactory
end


function OpenGLESGraphicsCompositeFactory:get()
        return self.openGLESGraphicsFactory
end

OpenGLESGraphicsCompositeFactory.instance = OpenGLESGraphicsCompositeFactory.new()

return OpenGLESGraphicsCompositeFactory

