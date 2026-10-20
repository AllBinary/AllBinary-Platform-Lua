-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.unit

-- local Image = require("javax.microedition.lcdui.Image")
-- local ImageItem = require("javax.microedition.lcdui.ImageItem")
local RTSGameStrings = require("org.allbinary.game.layer.RTSGameStrings")
local LayerInterfaceFactoryImageItem = require("org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem")
local RTSLayerTextAnimation = require("org.allbinary.game.layer.item.RTSLayerTextAnimation")
local BasicGameResources = require("org.allbinary.game.layer.resources.BasicGameResources")
local FlagGameResources = require("org.allbinary.game.layer.waypoint.FlagGameResources")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local GameFeatureImageCacheFactory = require("org.allbinary.image.GameFeatureImageCacheFactory")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Animation = require("org.allbinary.animation.Animation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CustomItemUtil = require("org.allbinary.graphics.form.item.CustomItemUtil")
local ItemArraySingletonFactoryInterface = require("org.allbinary.graphics.form.item.ItemArraySingletonFactoryInterface")
local ImageCache = require("org.allbinary.image.ImageCache")
local LayerInterfaceFactoryInterface = require("org.allbinary.layer.LayerInterfaceFactoryInterface")

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

local UnitItemArrayFactory = {}
UnitItemArrayFactory.__index = UnitItemArrayFactory
UnitItemArrayFactory.className = "UnitItemArrayFactory"

function UnitItemArrayFactory:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.resources = nil
end


function UnitItemArrayFactory.new(resources)
    local self = setmetatable({}, UnitItemArrayFactory)
    self:_init_fields()
        self.resources = resources
    return self
end


-- throws Exception
function UnitItemArrayFactory:createFlagItem(flagResources, layerInterfaceFactoryInterface)
        local name = flagResources.NAME
        local index = ((string.find(name, self.commonSeps.SPACE, 1, true) or 0) - 1)
        if index >= 0 then
            name = string.sub(name, (index) + 1)
        end
        return self:createNamedFlagItem(flagResources, name, layerInterfaceFactoryInterface)
end


-- throws Exception
function UnitItemArrayFactory:createNamedFlagItem(flagResources, name, layerInterfaceFactoryInterface)
        local IMAGE_CACHE = GameFeatureImageCacheFactory.getInstance()
        local image = IMAGE_CACHE:getWithKey(flagResources.RESOURCE_ICON)
        local item = LayerInterfaceFactoryImageItem.new(name, image, ImageItem.LAYOUT_DEFAULT, flagResources.NAME, self.basicColor, {RTSLayerTextAnimation.new(RTSGameStrings.getInstance().DRAGGABLE, image)}, layerInterfaceFactoryInterface)
        return item
end


-- throws Exception
function UnitItemArrayFactory:getItems()
        return UnitItemArrayFactory.ITEMS
end


function UnitItemArrayFactory:getResources()
        return self.resources
end


function UnitItemArrayFactory:indexOf(basicGameResources)
        for index = (self.resources.n or #self.resources) - 1, 0, -1 do
            if self.resources[index + 1] == basicGameResources then
                return index
            end
        end
        return -1
end

UnitItemArrayFactory.ITEMS = CustomItemUtil.getInstance().CUSTOM_ITEM_ARRAY

return UnitItemArrayFactory

