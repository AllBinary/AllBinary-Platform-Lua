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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local GameFeatureImageCacheFactory = require("org.allbinary.image.GameFeatureImageCacheFactory")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local ScreenRelationalUtil = require("org.allbinary.graphics.displayable.ScreenRelationalUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local ImageScaleUtil = require("org.allbinary.media.image.ImageScaleUtil")
local AndroidImageInterface = require("org.microemu.android.device.AndroidImageInterface")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryScreenRelationalImageAnimationInterfaceFactory = {}
AllBinaryScreenRelationalImageAnimationInterfaceFactory.__index = AllBinaryScreenRelationalImageAnimationInterfaceFactory
AllBinaryScreenRelationalImageAnimationInterfaceFactory.className = "AllBinaryScreenRelationalImageAnimationInterfaceFactory"
setmetatable(AllBinaryScreenRelationalImageAnimationInterfaceFactory, {__index = BaseImageAnimationFactory})

function AllBinaryScreenRelationalImageAnimationInterfaceFactory:_init_fields()
    self.lastImage = NullImage.NULL_IMAGE
end


function AllBinaryScreenRelationalImageAnimationInterfaceFactory.new(image, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), 0, 0, 0, 0, animationBehaviorFactory), AllBinaryScreenRelationalImageAnimationInterfaceFactory)
    self:_init_fields()
        -- super(...) made self above
        if self.lastImage ~= NullImage.NULL_IMAGE then
            local androidImageInterface = self.lastImage
            androidImageInterface:getBitmap():recycle()
        end
        local scale = ScreenRelationalUtil.getInstance():getScaleImage(image)
        self.lastImage = ImageScaleUtil.getInstance():createImage(GameFeatureImageCacheFactory.getInstance(), self:getImage(), scale, scale, false)
    return self
end


-- throws Exception
function AllBinaryScreenRelationalImageAnimationInterfaceFactory:getInstance(instanceId)
        return ImageAnimation.new(self.lastImage, self.animationBehaviorFactory:getOrCreateInstance())
end

return AllBinaryScreenRelationalImageAnimationInterfaceFactory

