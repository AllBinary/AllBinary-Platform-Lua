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
-- package org.allbinary.game.layer.pickup

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ViewPosition = require("org.allbinary.view.ViewPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local IconLayer = {}
IconLayer.__index = IconLayer
IconLayer.className = "IconLayer"
setmetatable(IconLayer, {__index = AllBinaryLayer})

function IconLayer:_init_fields()
    self.animationInterface = nil
end


function IconLayer.new(animationInterface, width, height)
    local self = setmetatable(AllBinaryLayer.new(StringUtil.getInstance().EMPTY_STRING, Rectangle.new(PointFactory.getInstance().ZERO_ZERO, width, height), ViewPosition.getInstanceD()), IconLayer)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterface = animationInterface
    return self
end


function IconLayer:paint(graphics)
        self.animationInterface:paintXY(graphics, self.x, self.y)
end


function IconLayer:paintThreed(graphics)
        self.animationInterface:paintThreedXYZ(graphics, self.x, self.y, self.z)
end


function IconLayer:getAnimationInterface()
        return self.animationInterface
end

IconLayer.NULL_ICON_LAYER = IconLayer.new(NullAnimationFactory.getFactoryInstance():getInstance(0), 0, 0)

return IconLayer

