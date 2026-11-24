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

local OpenGLOptions = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLOptions"] = OpenGLOptions

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureChoiceGroups = java_lazy("org.allbinary.game.configuration.feature.GameFeatureChoiceGroups")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table OpenGLOptions is declared before the requires
OpenGLOptions.__index = OpenGLOptions
OpenGLOptions.className = "OpenGLOptions"
OpenGLOptions.javaClassName = "org.allbinary.graphics.opengles.OpenGLOptions"

function OpenGLOptions._jinit(self)
    return self
end

function OpenGLOptions.new()
    return OpenGLOptions._jinit(setmetatable({}, OpenGLOptions))
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

