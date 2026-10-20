--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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

local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLImageSpecificFactory = {}
OpenGLImageSpecificFactory.__index = OpenGLImageSpecificFactory
OpenGLImageSpecificFactory.className = "OpenGLImageSpecificFactory"

function OpenGLImageSpecificFactory:_init_fields()
    self.imageFactory = OpenGLImageFactory.NULL_OPENGL_IMAGE_FACTORY
    self.updating = false
end

function OpenGLImageSpecificFactory.new()
    local self = setmetatable({}, OpenGLImageSpecificFactory)
    self:_init_fields()
    return self
end


function OpenGLImageSpecificFactory.getInstance()
        return OpenGLImageSpecificFactory.instance
end


function OpenGLImageSpecificFactory:setImageFactory(imageFactory)
        self.imageFactory = imageFactory
        PreLogUtil.put(tostring(StringMaker.new():append("Selected Image Factory: "):append(StringUtil.getInstance():toString(self.imageFactory))), self, "setImageFactory")
end


function OpenGLImageSpecificFactory:getImageFactory()
        return self.imageFactory
end

OpenGLImageSpecificFactory.instance = OpenGLImageSpecificFactory.new()

return OpenGLImageSpecificFactory

