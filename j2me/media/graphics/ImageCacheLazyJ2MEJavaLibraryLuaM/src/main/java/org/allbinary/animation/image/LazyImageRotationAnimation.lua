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
-- package org.allbinary.animation.image

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local NullRotationAnimationFactory = require("org.allbinary.animation.NullRotationAnimationFactory")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ImageCache = require("org.allbinary.image.ImageCache")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LazyImageRotationAnimation = {}
LazyImageRotationAnimation.__index = LazyImageRotationAnimation
LazyImageRotationAnimation.className = "LazyImageRotationAnimation"
setmetatable(LazyImageRotationAnimation, {__index = RotationAnimation})

function LazyImageRotationAnimation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.layoutIndex = nil
    self.instanceId = nil
    self.animationInterfaceFactoryInterface = nil
    self.NULL_INDEX_ANIMATION = nil
    self.animation = nil
    self.scaleProperties = ScaleProperties.instance
end


function LazyImageRotationAnimation.new(layoutIndex, instanceId, scaleProperties, animationInterfaceFactoryInterface, animationBehavior)
    local self = setmetatable(RotationAnimation.new(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior), LazyImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.layoutIndex = layoutIndex
        self.instanceId = instanceId
        self.animationInterfaceFactoryInterface = animationInterfaceFactoryInterface
        local imageCache = ImageCacheFactory.getInstance()
        imageCache:add(self)
        self.scaleProperties = scaleProperties
        self.NULL_INDEX_ANIMATION = NullRotationAnimationFactory.getFactoryInstance():getInstance(0)
        local ActualRotationAnimation = {}
        ActualRotationAnimation.__index = ActualRotationAnimation
        ActualRotationAnimation.className = "ActualRotationAnimation"
        setmetatable(ActualRotationAnimation, {__index = RotationAnimation})

        function ActualRotationAnimation:_init_fields()
            self.lazyImageRotationAnimation = nil
            self.index = 0
        end
        

        function LazyImageRotationAnimation.new(lazyImageRotationAnimation)
            local self = setmetatable(RotationAnimation.new(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), self.animationBehavior), LazyImageRotationAnimation)
            self:_init_fields()
                -- super(...) made self above
                self.lazyImageRotationAnimation = lazyImageRotationAnimation
            return self
        end
        

        function LazyImageRotationAnimation:setFrame(index)
                self.index = index
        end
        

        function LazyImageRotationAnimation:getFrame()
                return self.index
        end
        

        function LazyImageRotationAnimation:paintXY(graphics, x, y)
                local try_ok, try_error = pcall(function()
                    ImageCacheFactory.getInstance():insertFirst(self)
                    self.lazyImageRotationAnimation.animation = self.lazyImageRotationAnimation.NULL_INDEX_ANIMATION
                end)
                if not try_ok then
                    local e = try_error
                    local logUtil = LogUtil.getInstance()
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
        end
        

        function LazyImageRotationAnimation:paintThreedXYZ(graphics, x, y, z)
                local try_ok, try_error = pcall(function()
                    ImageCacheFactory.getInstance():insertFirst(self)
                    self.lazyImageRotationAnimation.animation = self.lazyImageRotationAnimation.NULL_INDEX_ANIMATION
                end)
                if not try_ok then
                    local e = try_error
                    local logUtil = LogUtil.getInstance()
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
        end

        self.animation = ActualRotationAnimation.new(self)
    return self
end


function LazyImageRotationAnimation:setRealAnimation()
        local try_ok, try_error = pcall(function()
            local animation = self.animation
            self.animationInterfaceFactoryInterface:setInitialScale(self.scaleProperties)
            self.animation = self.animationInterfaceFactoryInterface:getInstance(self.instanceId)
            self.animation:setState(animation)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, LazyImageRotationAnimation.SET_REAL_ANIMATION, e)
        end
end


function LazyImageRotationAnimation:setScale(scaleX, scaleY)
        self.animation:setScale(scaleX, scaleY)
end


function LazyImageRotationAnimation:getAnimationBehavior()
        return self.animation:getAnimationBehavior()
end


-- throws Exception
function LazyImageRotationAnimation:set(gl)
        self.animation:set(gl)
end


function LazyImageRotationAnimation:setAlpha(alpha)
        self.animation:setAlpha(alpha)
end


function LazyImageRotationAnimation:setDx(dx)
        self.animation:setDx(dx)
end


function LazyImageRotationAnimation:setDy(dy)
        self.animation:setDy(dy)
end


function LazyImageRotationAnimation:setMaxScale(maxScaleX, maxScaleY)
        self.animation:setMaxScale(maxScaleX, maxScaleY)
end


function LazyImageRotationAnimation:nextRotation()
        local rotationAnimation = (self.animation)
        rotationAnimation:nextRotation()
end


function LazyImageRotationAnimation:previousRotation()
        local rotationAnimation = (self.animation)
        rotationAnimation:previousRotation()
end


function LazyImageRotationAnimation:nextRotationX()
        local rotationAnimation = (self.animation)
        rotationAnimation:nextRotationX()
end


function LazyImageRotationAnimation:previousRotationX()
        local rotationAnimation = (self.animation)
        rotationAnimation:previousRotationX()
end


function LazyImageRotationAnimation:nextRotationZ()
        local rotationAnimation = (self.animation)
        rotationAnimation:nextRotationZ()
end


function LazyImageRotationAnimation:previousRotationZ()
        local rotationAnimation = (self.animation)
        rotationAnimation:previousRotationZ()
end


function LazyImageRotationAnimation:changeBasicColor(basicColor)
        self.animation:changeBasicColor(basicColor)
end


function LazyImageRotationAnimation:getBasicColorP()
        return self.animation:getBasicColorP()
end


function LazyImageRotationAnimation:getChangeBasicColor()
        return self.animation:getChangeBasicColor()
end


function LazyImageRotationAnimation:getChangeColor()
        return self.animation:getChangeColor()
end


function LazyImageRotationAnimation:getColor()
        return self.animation:getColor()
end


function LazyImageRotationAnimation:getDx()
        return self.animation:getDx()
end


function LazyImageRotationAnimation:getDy()
        return self.animation:getDy()
end


function LazyImageRotationAnimation:isThreed()
        return self.animation:isThreed()
end


-- throws Exception
function LazyImageRotationAnimation:nextFrame()
        self.animation:nextFrame()
end


function LazyImageRotationAnimation:reset()
        self.animation:reset()
end


function LazyImageRotationAnimation:setFrame(index)
        self.animation:setFrame(index)
end


function LazyImageRotationAnimation:getFrame()
        return self.animation:getFrame()
end


-- throws Exception
function LazyImageRotationAnimation:getAnimationSize()
        return self.animation:getAnimationSize()
end


function LazyImageRotationAnimation:getSize()
        return self.animation:getSize()
end


function LazyImageRotationAnimation:previousFrame()
        self.animation:previousFrame()
end


function LazyImageRotationAnimation:isLastFrame()
        return self.animation:isLastFrame()
end


function LazyImageRotationAnimation:setSequence(sequence)
        self.animation:setSequence(sequence)
end


function LazyImageRotationAnimation:getSequence()
        return self.animation:getSequence()
end


function LazyImageRotationAnimation:getWidth()
        return self.animation:getWidth()
end


function LazyImageRotationAnimation:paintXY(graphics, x, y)
        local try_ok, try_error = pcall(function()
            self.animation:paintXY(graphics, x, y)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end


function LazyImageRotationAnimation:paintThreedXYZ(graphics, x, y, z)
        local try_ok, try_error = pcall(function()
            self.animation:paintThreedXYZ(graphics, x, y, z)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end


function LazyImageRotationAnimation:toString()
        local commonSeps = CommonSeps.getInstance()
        local image = self.animationInterfaceFactoryInterface:getImage()
        return tostring(StringMaker.new():append(tostring(RotationAnimation)):append(commonSeps.SPACE):append(image:getName()):append(commonSeps.SPACE):appendint(java_int(image:getWidth())):append(commonSeps.SPACE):appendint(java_int(image:getHeight())))
end
LazyImageRotationAnimation.__tostring = function(self) return self:toString() end

LazyImageRotationAnimation.SET_REAL_ANIMATION = "setRealAnimation"

return LazyImageRotationAnimation

