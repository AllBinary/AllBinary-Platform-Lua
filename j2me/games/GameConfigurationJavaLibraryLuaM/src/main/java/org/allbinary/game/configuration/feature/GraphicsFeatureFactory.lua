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
-- package org.allbinary.game.configuration.feature

local GraphicsFeatureFactory = {}
package.loaded["org.allbinary.game.configuration.feature.GraphicsFeatureFactory"] = GraphicsFeatureFactory

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local GraphicsFeature = java_lazy("org.allbinary.game.configuration.feature.GraphicsFeature")

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

-- class table GraphicsFeatureFactory is declared before the requires
GraphicsFeatureFactory.__index = GraphicsFeatureFactory
GraphicsFeatureFactory.className = "GraphicsFeatureFactory"
GraphicsFeatureFactory.javaClassName = "org.allbinary.game.configuration.feature.GraphicsFeatureFactory"

function GraphicsFeatureFactory:_init_fields()
    self.NONE = GraphicsFeature.new(StringUtil.getInstance().NULL_STRING)
    self.TRANSPARENT_IMAGE_CREATION = GraphicsFeature.new("Transparent Image Creation")
    self.IMAGE_GRAPHICS = GraphicsFeature.new("Image Graphics")
    self.IMAGE_ROTATION_ON_THE_FLY = GraphicsFeature.new("Image Rotated On The Fly")
    self.IMAGE_TO_ARRAY_GRAPHICS = GraphicsFeature.new("Image To Array Graphics")
    self.SPRITE_QUARTER_ROTATION_GRAPHICS = GraphicsFeature.new("Sprite Quarter Rotation Graphics")
    self.SPRITE_FULL_GRAPHICS = GraphicsFeature.new("Sprite Full Rotation Graphics")
    self.VECTOR_GRAPHICS = GraphicsFeature.new("BasicArrayList Graphics")
    self.VECTOR_TO_IMAGE_GRAPHICS = GraphicsFeature.new("BasicArrayList To Image Graphics")
end


function GraphicsFeatureFactory.getInstance()
        return GraphicsFeatureFactory.instance_f
end


function GraphicsFeatureFactory._jinit(self)
    GraphicsFeatureFactory._init_fields(self)
    return self
end

function GraphicsFeatureFactory.new(...)
    local self = setmetatable({}, GraphicsFeatureFactory)
    GraphicsFeatureFactory._jinit(self, ...)
    return self
end

GraphicsFeatureFactory.instance_f = GraphicsFeatureFactory.new()

return GraphicsFeatureFactory

