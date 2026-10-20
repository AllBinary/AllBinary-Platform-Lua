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
-- package org.allbinary.game.layer.hud.basic

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationInterface = require("org.allbinary.animation.AnimationInterface")
local HealthInterface = require("org.allbinary.game.health.HealthInterface")
local Anchor = require("org.allbinary.graphics.Anchor")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local HealthGraphic = require("org.allbinary.game.layer.hud.basic.HealthGraphic")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageHealthGraphic = {}
ImageHealthGraphic.__index = ImageHealthGraphic
ImageHealthGraphic.className = "ImageHealthGraphic"
setmetatable(ImageHealthGraphic, {__index = HealthGraphic})

function ImageHealthGraphic:_init_fields()
    self.image = nil
end


function ImageHealthGraphic.new(animationInterface, healthInterface, location, direction)
    local self = setmetatable(HealthGraphic.new(animationInterface, healthInterface, location, direction), ImageHealthGraphic)
    self:_init_fields()
        -- super(...) made self above
        self.image = java_new_array(nil, self.healthInterface:getMaxHealth())
        local imageCacheFactory = ImageCacheFactory.getInstance()
        for numOfHealth = 0, self.max do
            self.image[numOfHealth + 1] = imageCacheFactory:get(self, numOfHealth + 1 * 10, 10)
        end
        for numOfHealth = 0, self.max do
            for index = 0, numOfHealth - 1 do
                self.animationInterface:paint(self.image[numOfHealth + 1]:getGraphics(), numOfHealth * 10, 0)
            end
        end
    return self
end


function ImageHealthGraphic:paint(graphics)
        graphics:drawImage(self.image[self.max + 1], self.x, self.y, Anchor.TOP_LEFT)
end

return ImageHealthGraphic

