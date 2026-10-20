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
-- package org.allbinary.image

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local Animation = require("org.allbinary.animation.Animation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnimationFrameToImageUtil = {}
AnimationFrameToImageUtil.__index = AnimationFrameToImageUtil
AnimationFrameToImageUtil.className = "AnimationFrameToImageUtil"

function AnimationFrameToImageUtil.new()
    local self = setmetatable({}, AnimationFrameToImageUtil)
    return self
end


function AnimationFrameToImageUtil.getInstance()
        return AnimationFrameToImageUtil.instance
end


-- throws Exception
function AnimationFrameToImageUtil:getInstanceTranslate(width, height, animationInterface)
        local image = GameFeatureImageCacheFactory.getInstance():get(getmetatable(AnimationFrameToImageUtil.instance).className, ((((width * 3)) // (1 << (1)))), ((((height * 3)) // (1 << (1)))))
        local graphics = image:getGraphics()
        local tranlateX = (((width) // (1 << (2))))
        local tranlateY = (((height) // (1 << (2))))
        graphics:translate(tranlateX, tranlateY)
        animationInterface:paintXY(graphics, 0, 0)
        graphics:translate(-tranlateX, -tranlateY)
        return image
end


-- throws Exception
function AnimationFrameToImageUtil:getInstanceWH(width, height, animationInterface)
        local image = GameFeatureImageCacheFactory.getInstance():get(getmetatable(AnimationFrameToImageUtil.instance).className, width, height)
        local graphics = image:getGraphics()
        animationInterface:paintXY(graphics, 0, 0)
        return image
end

AnimationFrameToImageUtil.instance = AnimationFrameToImageUtil.new()

return AnimationFrameToImageUtil

