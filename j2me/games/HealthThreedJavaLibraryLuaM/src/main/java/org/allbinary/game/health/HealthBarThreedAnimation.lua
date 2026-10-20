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
-- package org.allbinary.game.health

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local ColorBufferList = require("min3d.core.ColorBufferList")
local Number3dBufferList = require("min3d.core.Number3dBufferList")
local Rectangle = require("min3d.objectPrimitives.Rectangle")
local Number3d = require("min3d.vos.Number3d")
local OpenGLESGraphics = require("org.allbinary.device.OpenGLESGraphics")
local Object3dProcessor = require("org.allbinary.graphics.threed.min3d.renderer.Object3dProcessor")
local Object3dProcessorUtil = require("org.allbinary.graphics.threed.min3d.renderer.Object3dProcessorUtil")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local HealthBarAnimation = require("org.allbinary.game.health.HealthBarAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealthBarThreedAnimation = {}
HealthBarThreedAnimation.__index = HealthBarThreedAnimation
HealthBarThreedAnimation.className = "HealthBarThreedAnimation"
setmetatable(HealthBarThreedAnimation, {__index = HealthBarAnimation})

function HealthBarThreedAnimation:_init_fields()
    self.rectangle = nil
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.object3dProcessor = Object3dProcessorUtil.getInstance():getInstanceObject3dProcessor()
end


function HealthBarThreedAnimation.new(layerInterface, location)
    local self = setmetatable(HealthBarAnimation.new(layerInterface, location), HealthBarThreedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.basicColor = self.basicColorFactory.GREEN
        self.colorP = math.tointeger(self.basicColor // 1)
        self.rectangle = Rectangle.new(0, 0, 1, 1, self.basicColor)
        self.rectangle:setDoubleSidedEnabled(true)
        self.rectangle:setNormalsEnabled(false)
        self.rectangle:setTexturesEnabled(false)
    return self
end


function HealthBarThreedAnimation:updateColor()
        local colorBufferList = self.rectangle:getVertices():getColor4BufferList()
        local size = colorBufferList:size()
        do
            local index = size
            while (function() index = index - 1 return index end)() >= 0 do
            colorBufferList:set(index, self.basicColor)
            end
        end
end


function HealthBarThreedAnimation:updateSize()
        local number3dBufferList = self.rectangle:getVertices():getPointsOnFacesNumber3dBufferList()
        local width = self.x2
        local height = self.thickness * 2
        local segsH = 1
        local segsW = 1
        local row = 0
        local col = 0
        local w = (java_idiv(width, segsW) + 0.0)
        local h = (java_idiv(height, segsH) + 0.0)
        local width5 = (width + 0.0) / 2.0
        local height5 = (height + 0.0) / 2.0
        local index = 0
        for row = 0, segsH do
            for col = 0, segsW do
                number3dBufferList:set((function() local value = index index = value + 1 return value end)(), (col + 0.0) * w - width5, (row + 0.0) * h - height5, 0.0)
            end
        end
end


function HealthBarThreedAnimation:onHealthChange(newX2)
        HealthBarAnimation.onHealthChange(self, newX2)
        self:updateColor()
        self:updateSize()
end


function HealthBarThreedAnimation:paintThreedXYZ(graphics, x, y, z)
        local openGLESGraphics = graphics
        local gl = openGLESGraphics:getGl10()
        local viewPosition = self.allbinaryLayer:getViewPosition()
        local positionNumber3d = self.rectangle:getPosition()
        positionNumber3d.x = -((viewPosition:getX() + 0.0))
        positionNumber3d.z = -((viewPosition:getY() + 0.0))
        positionNumber3d.y = viewPosition:getZ() + self.allbinaryLayer:getHeight()
        self.object3dProcessor:drawObject(gl, self.rectangle)
end

return HealthBarThreedAnimation

