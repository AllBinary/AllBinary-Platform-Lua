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
-- package org.allbinary.graphics.opengles

local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureChoiceGroups = require("org.allbinary.game.configuration.feature.GameFeatureChoiceGroups")
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

local OpenGLOptions = {}
OpenGLOptions.__index = OpenGLOptions
OpenGLOptions.className = "OpenGLOptions"

function OpenGLOptions.new()
    local self = setmetatable({}, OpenGLOptions)
    return self
end


function OpenGLOptions:init()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if Features.getInstance():isFeature(openGLFeatureFactory.OPENGL_OPTIONS) then
            local openGLMultipleList = BasicArrayListD.new()
            openGLMultipleList:add(openGLFeatureFactory.OPENGL)
            GameFeatureChoiceGroups.getMultipleInstance():add("OpenGL (Complete Restart)", openGLMultipleList)
            local openGLVersionSelectorMultipleList = BasicArrayListD.new()
            openGLVersionSelectorMultipleList:add(openGLFeatureFactory.OPENGL_AUTO_SELECT)
            openGLVersionSelectorMultipleList:add(openGLFeatureFactory.OPENGL_MINIMUM)
            GameFeatureChoiceGroups.getExclusiveInstance():add("OpenGL Version Selector", openGLVersionSelectorMultipleList)
            local openGLImageColorMultipleList = BasicArrayListD.new()
            openGLImageColorMultipleList:add(openGLFeatureFactory.IMAGE_COLOR_DEPTH_4444)
            openGLImageColorMultipleList:add(openGLFeatureFactory.IMAGE_COLOR_DEPTH_8888)
            GameFeatureChoiceGroups.getExclusiveInstance():add("OpenGL Image Color RGBA", openGLImageColorMultipleList)
        end
end

return OpenGLOptions

