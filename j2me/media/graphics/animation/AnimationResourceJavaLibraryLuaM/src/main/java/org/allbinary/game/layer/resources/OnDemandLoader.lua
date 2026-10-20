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
-- package org.allbinary.game.layer.resources

local BaseResourceAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory = require("org.allbinary.game.layer.GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory")
local LayerPlacementInterfaceBasicArrayListFactoryInterface = require("org.allbinary.game.layer.LayerPlacementInterfaceBasicArrayListFactoryInterface")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local ImageCache = require("org.allbinary.image.ImageCache")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OnDemandLoader = {}
OnDemandLoader.__index = OnDemandLoader
OnDemandLoader.className = "OnDemandLoader"

function OnDemandLoader:_init_fields()
    self.onDemandResourcesFactory = nil
    self.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory = nil
    self.resourceAnimationInterfaceFactoryInterfaceFactory = nil
end


function OnDemandLoader.new(onDemandResourcesFactory, gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory, resourceAnimationInterfaceFactoryInterfaceFactory)
    local self = setmetatable({}, OnDemandLoader)
    self:_init_fields()
        self.onDemandResourcesFactory = onDemandResourcesFactory
        self.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory = gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory
        self.resourceAnimationInterfaceFactoryInterfaceFactory = resourceAnimationInterfaceFactoryInterfaceFactory
    return self
end


-- throws Exception
function OnDemandLoader:init(imageCache, level, loadingString)
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        if Features.getInstance():isFeature(MainFeatureFactory.getInstance().LOAD_ALL) then
            if self.resourceAnimationInterfaceFactoryInterfaceFactory:isInitialized() then
                return
            end
            self:initAll(imageCache, loadingString)
        elseif level ~= resourceLoadingLevelFactory.LOAD_ALL:getLevel() then
            local layerPlacementInterfaceBasicArrayListFactoryInterface = self.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory:getInstance(level)
            self:initLevel(layerPlacementInterfaceBasicArrayListFactoryInterface, imageCache, level, loadingString)
        end
end


-- throws Exception
function OnDemandLoader:initAll(imageCache, loadingString)
        local index = 0
        local portion = 120
        local onDemandResources = nil
        do
            local onDemandIndex = self.onDemandResourcesFactory:size()
            while (function() onDemandIndex = onDemandIndex - 1 return onDemandIndex end)() >= 0 do
            onDemandResources = self.onDemandResourcesFactory:remove(onDemandIndex)
            if onDemandResources ~= OnDemandResources.NULL_ON_DEMAND_RESOURCES then
                index = onDemandResources:initAt(imageCache, self.resourceAnimationInterfaceFactoryInterfaceFactory, portion, loadingString, index)
            end
            end
        end
end


-- throws Exception
function OnDemandLoader:initLevel(layerPlacementInterfaceBasicArrayListFactoryInterface, imageCache, level, loadingString)
        local commonStrings = CommonStrings.getInstance()
        local portion = 120
        local index = 0
        local onDemandArray = layerPlacementInterfaceBasicArrayListFactoryInterface:getOnDemandResources()
        PreLogUtil.put(tostring(StringMaker.new():append(commonStrings.START):appendint((onDemandArray.n or #onDemandArray))), self, "initLevel")
        local onDemandResources = nil
        do
            local onDemandIndex = (onDemandArray.n or #onDemandArray)
            while (function() onDemandIndex = onDemandIndex - 1 return onDemandIndex end)() >= 0 do
            onDemandResources = self.onDemandResourcesFactory:remove(onDemandArray[onDemandIndex + 1])
            if onDemandResources ~= OnDemandResources.NULL_ON_DEMAND_RESOURCES then
                index = onDemandResources:initAt(imageCache, self.resourceAnimationInterfaceFactoryInterfaceFactory, portion, loadingString, index)
            end
            end
        end
end

return OnDemandLoader

