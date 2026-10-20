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
-- package org.allbinary.animation

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local OpenGLSurfaceChangedInterface = require("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local AnimationInterface = require("org.allbinary.animation.AnimationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Animation = {}
Animation.__index = Animation
Animation.className = "Animation"

function Animation:_init_fields()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.colorP = 0
    self.changeBasicColorP = BasicColorFactory.getInstance().NULL_COLOR
    self.changeColorP = 0
    self.alphaP = 0
end


function Animation.new()
    local self = setmetatable({}, Animation)
    self:_init_fields()
    return self
end


function Animation:setAlpha(alpha)
        self.alphaP = alpha
end


-- throws Exception
function Animation:nextFrame()
end


function Animation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
end


function Animation:paintThreedXYZ(graphics, x, y, z)
end


function Animation:isThreed()
        return false
end


function Animation:getBasicColorP()
        return self.basicColor
end


function Animation:setBasicColorP(basicColor)
        self.basicColor = basicColor
        self.colorP = math.tointeger(self.basicColor // 1)
end


function Animation:setBackgroundBasicColorP(basicColor)
end


function Animation:getChangeBasicColor()
        return self.changeBasicColorP
end


function Animation:changeBasicColor(basicColor)
        self.changeBasicColorP = basicColor
        self.changeColorP = math.tointeger(self.changeBasicColorP // 1)
end


function Animation:getChangeColor()
        return self.changeColorP
end


function Animation:getColor()
        return self.colorP
end


function Animation:setScale(scaleX, scaleY)
end


function Animation:setMaxScale(maxScaleX, maxScaleY)
end


-- throws Exception
function Animation:set(gl)
end


function Animation:setDx(dx)
end


function Animation:getDx()
        return 0
end


function Animation:setDy(dy)
end


function Animation:getDy()
        return 0
end

return Animation

