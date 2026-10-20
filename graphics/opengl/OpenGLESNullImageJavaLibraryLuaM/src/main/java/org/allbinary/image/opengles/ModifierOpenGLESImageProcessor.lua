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

local OpenGLESImageProcessor = require("org.allbinary.image.opengles.OpenGLESImageProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ModifierOpenGLESImageProcessor = {}
ModifierOpenGLESImageProcessor.__index = ModifierOpenGLESImageProcessor
ModifierOpenGLESImageProcessor.className = "ModifierOpenGLESImageProcessor"
setmetatable(ModifierOpenGLESImageProcessor, {__index = OpenGLESImageProcessor})

function ModifierOpenGLESImageProcessor.new()
    local self = setmetatable(OpenGLESImageProcessor.new(), ModifierOpenGLESImageProcessor)
    return self
end


function ModifierOpenGLESImageProcessor.getInstance()
        return ModifierOpenGLESImageProcessor.instanceC
end

ModifierOpenGLESImageProcessor.instanceC = ModifierOpenGLESImageProcessor.new()

return ModifierOpenGLESImageProcessor

