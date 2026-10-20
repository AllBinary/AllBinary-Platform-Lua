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
-- package org.allbinary.animation.caption

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local TextAnimation = require("org.allbinary.animation.text.TextAnimation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local CaptionAnimationHelperBase = require("org.allbinary.animation.caption.CaptionAnimationHelperBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CaptionAnimationHelper = {}
CaptionAnimationHelper.__index = CaptionAnimationHelper
CaptionAnimationHelper.className = "CaptionAnimationHelper"
setmetatable(CaptionAnimationHelper, {__index = CaptionAnimationHelperBase})

function CaptionAnimationHelper:_init_fields()
    self.timeHelper = TimeDelayHelper.new(620)
    self.textAnimation = TextAnimation.new(StringUtil.getInstance().EMPTY_STRING, AnimationBehavior.getInstance())
    self.captionAnimation = nil
    self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
end


function CaptionAnimationHelper.new(captionAnimation, captionDx, captionDy, dx, dy)
    local self = setmetatable(CaptionAnimationHelperBase.new(), CaptionAnimationHelper)
    self:_init_fields()
        self.captionAnimation = CaptionAnimation.new(captionAnimation, self.textAnimation, captionDx, captionDy, dx, dy)
    return self
end


function CaptionAnimationHelper:isShowing()
        if self.animation == self.captionAnimation then
            return true
        else
            return false
        end
end


function CaptionAnimationHelper:tick()
        if self.timeHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        end
end


function CaptionAnimationHelper:update(message, basicColor)
        self.textAnimation:setBasicColorP(basicColor)
        self.textAnimation:setText(message)
        self.animation = self.captionAnimation
        self.timeHelper:setStartTimeTNT()
end


function CaptionAnimationHelper:paintXY(graphics, x, y)
        self.animation:paintXY(graphics, x, y)
end

return CaptionAnimationHelper

