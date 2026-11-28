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

local UnitItemArrayFactory = {}
package.loaded["org.allbinary.game.layer.unit.UnitItemArrayFactory"] = UnitItemArrayFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Image = java_lazy("javax.microedition.lcdui.Image")
local ImageItem = java_lazy("javax.microedition.lcdui.ImageItem")
local RTSGameStrings = java_lazy("org.allbinary.game.layer.RTSGameStrings")
local LayerInterfaceFactoryImageItem = java_lazy("org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem")
local RTSLayerTextAnimation = java_lazy("org.allbinary.game.layer.item.RTSLayerTextAnimation")
local BasicGameResources = java_lazy("org.allbinary.game.layer.resources.BasicGameResources")
local FlagGameResources = java_lazy("org.allbinary.game.layer.waypoint.FlagGameResources")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local GameFeatureImageCacheFactory = java_lazy("org.allbinary.image.GameFeatureImageCacheFactory")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Animation = java_lazy("org.allbinary.animation.Animation")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local CustomItemUtil = java_lazy("org.allbinary.graphics.form.item.CustomItemUtil")
local ItemArraySingletonFactoryInterface = java_lazy("org.allbinary.graphics.form.item.ItemArraySingletonFactoryInterface")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")
local LayerInterfaceFactoryInterface = java_lazy("org.allbinary.layer.LayerInterfaceFactoryInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table UnitItemArrayFactory is declared before the requires
UnitItemArrayFactory.__index = UnitItemArrayFactory
UnitItemArrayFactory.className = "UnitItemArrayFactory"
UnitItemArrayFactory.javaClassName = "org.allbinary.game.layer.unit.UnitItemArrayFactory"
UnitItemArrayFactory.java_implements = " ItemArraySingletonFactoryInterface "
UnitItemArrayFactory.java_interfaces = function() return {ItemArraySingletonFactoryInterface} end

function UnitItemArrayFactory:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    self.basicColor = BasicColorFactory.getInstance().WHITE
    if self.resources == nil then self.resources = nil end
end


function UnitItemArrayFactory._jinit(self, resources)
    UnitItemArrayFactory._init_fields(self)
        self.resources = resources
    return self
end

function UnitItemArrayFactory.new(...)
    local self = setmetatable({}, UnitItemArrayFactory)
    UnitItemArrayFactory._jinit(self, ...)
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
            if rawequal(self.resources[index + 1], basicGameResources) then
                return index
            end
        end
        return -1
end

UnitItemArrayFactory.ITEMS = CustomItemUtil.getInstance().CUSTOM_ITEM_ARRAY

return UnitItemArrayFactory

