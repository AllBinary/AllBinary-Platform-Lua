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

local GraphicsFeatureFactory = {}
GraphicsFeatureFactory.__index = GraphicsFeatureFactory
GraphicsFeatureFactory.className = "GraphicsFeatureFactory"

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
        return GraphicsFeatureFactory.instance
end


function GraphicsFeatureFactory.new()
    local self = setmetatable({}, GraphicsFeatureFactory)
    self:_init_fields()
    return self
end

GraphicsFeatureFactory.instance = GraphicsFeatureFactory.new()

return GraphicsFeatureFactory

