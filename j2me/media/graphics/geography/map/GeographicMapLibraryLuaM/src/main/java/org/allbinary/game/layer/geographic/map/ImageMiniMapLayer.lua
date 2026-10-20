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
-- package org.allbinary.game.layer.geographic.map

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local Anchor = require("org.allbinary.graphics.Anchor")
local PaintableToImageUtil = require("org.allbinary.image.PaintableToImageUtil")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local MiniMapLayer = require("org.allbinary.game.layer.geographic.map.MiniMapLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageMiniMapLayer = {}
ImageMiniMapLayer.__index = ImageMiniMapLayer
ImageMiniMapLayer.className = "ImageMiniMapLayer"
setmetatable(ImageMiniMapLayer, {__index = MiniMapLayer})

function ImageMiniMapLayer:_init_fields()
    self.image = NullImage.NULL_IMAGE
    self.anchor = Anchor.TOP_LEFT
end


function ImageMiniMapLayer.new(geographicMapInterface, viewPosition)
    local self = setmetatable(MiniMapLayer.new(geographicMapInterface, viewPosition), ImageMiniMapLayer)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function ImageMiniMapLayer:init()
        local aWidth = self.allBinaryTiledLayer:getWidth()
        local aHeight = self.allBinaryTiledLayer:getHeight()
        self.image = PaintableToImageUtil.getImage(self.allBinaryTiledLayer, aWidth, aHeight)
end


function ImageMiniMapLayer:paint(graphics)
        graphics:drawImage(self.image, self.x, self.y, self.anchor)
        self:paintDots(graphics)
end

return ImageMiniMapLayer

