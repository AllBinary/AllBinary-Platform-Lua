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

-- local Image = require("javax.microedition.lcdui.Image")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLESImageExclusionUtil = {}
OpenGLESImageExclusionUtil.__index = OpenGLESImageExclusionUtil
OpenGLESImageExclusionUtil.className = "OpenGLESImageExclusionUtil"

function OpenGLESImageExclusionUtil:_init_fields()
    self.list = BasicArrayListD.new()
end

function OpenGLESImageExclusionUtil.new()
    local self = setmetatable({}, OpenGLESImageExclusionUtil)
    self:_init_fields()
    return self
end


function OpenGLESImageExclusionUtil.getInstance()
        return OpenGLESImageExclusionUtil.instance
end


function OpenGLESImageExclusionUtil:isCustomScaling(image)
        return false
end

OpenGLESImageExclusionUtil.instance = OpenGLESImageExclusionUtil.new()

return OpenGLESImageExclusionUtil

