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
-- package org.allbinary.animation.image

-- local Image = require("javax.microedition.lcdui.Image")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local AnimationFactoryImageScaleUtil = require("org.allbinary.image.AnimationFactoryImageScaleUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseImageAnimationFactory = {}
BaseImageAnimationFactory.__index = BaseImageAnimationFactory
BaseImageAnimationFactory.className = "BaseImageAnimationFactory"

function BaseImageAnimationFactory:_init_fields()
    self.animationFactoryImageScaleUtil = AnimationFactoryImageScaleUtil.getInstance()
    self.image = nil
    self.animationBehaviorFactory = nil
    self.sequenceArray = nil
    self.animationFactoryInitializationVisitor = nil
    self.scaleProperties = ScaleProperties.instance
end


-- throws Exception
function BaseImageAnimationFactory.createFactoryBase(image, sequenceArray, width, height, animationBehaviorFactory)
        return BaseImageAnimationFactory.new(image, sequenceArray, width, height, 0, 0, animationBehaviorFactory)
end


function BaseImageAnimationFactory.new(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory)
    local self = setmetatable({}, BaseImageAnimationFactory)
    self:_init_fields()
        self.animationFactoryInitializationVisitor = AnimationFactoryInitializationVisitor.new()
        self.image = image
        self.animationFactoryInitializationVisitor.width = width
        self.animationFactoryInitializationVisitor.height = height
        self.animationBehaviorFactory = animationBehaviorFactory
        self.sequenceArray = sequenceArray
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
    return self
end


-- throws Exception
function BaseImageAnimationFactory:getInstance(instanceId)
        return NullAnimationFactory.getFactoryInstance():getInstance(instanceId)
end


function BaseImageAnimationFactory:getImage()
        return self.image
end


function BaseImageAnimationFactory:getSequenceArray()
        return self.sequenceArray
end


function BaseImageAnimationFactory:setInitialScale(scaleProperties)
        self.scaleProperties = scaleProperties
        if self.scaleProperties.shouldScale then
            self.scaleProperties.scaleWidth = java_int((self.animationFactoryInitializationVisitor.width * self.scaleProperties.scaleX))
            self.scaleProperties.scaleHeight = java_int((self.animationFactoryInitializationVisitor.height * self.scaleProperties.scaleY))
        else
        end
end


function BaseImageAnimationFactory:getAnimationFactoryInitializationVisitorP()
        return self.animationFactoryInitializationVisitor
end


function BaseImageAnimationFactory:getScalePropertiesP()
        return self.scaleProperties
end


function BaseImageAnimationFactory:toString()
        local commonSeps = CommonSeps.getInstance()
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(.toString(self))
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(java_int(self.image:getHeight()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(tostring(self.animationFactoryInitializationVisitor))
        return tostring(stringBuffer)
end
BaseImageAnimationFactory.__tostring = function(self) return self:toString() end

return BaseImageAnimationFactory

