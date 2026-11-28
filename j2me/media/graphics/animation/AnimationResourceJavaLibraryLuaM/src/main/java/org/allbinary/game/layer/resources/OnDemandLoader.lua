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

local OnDemandLoader = {}
package.loaded["org.allbinary.game.layer.resources.OnDemandLoader"] = OnDemandLoader

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

local BaseResourceAnimationInterfaceFactoryInterfaceFactory = java_lazy("org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory = java_lazy("org.allbinary.game.layer.GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory")
local LayerPlacementInterfaceBasicArrayListFactoryInterface = java_lazy("org.allbinary.game.layer.LayerPlacementInterfaceBasicArrayListFactoryInterface")
local ResourceLoadingLevelFactory = java_lazy("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local OnDemandResources = java_lazy("org.allbinary.game.layer.resources.OnDemandResources")
local OnDemandResourcesFactory = java_lazy("org.allbinary.game.layer.resources.OnDemandResourcesFactory")

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

-- class table OnDemandLoader is declared before the requires
OnDemandLoader.__index = OnDemandLoader
OnDemandLoader.className = "OnDemandLoader"
OnDemandLoader.javaClassName = "org.allbinary.game.layer.resources.OnDemandLoader"

function OnDemandLoader:_init_fields()
    if self.onDemandResourcesFactory == nil then self.onDemandResourcesFactory = nil end
    if self.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory == nil then self.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory = nil end
    if self.resourceAnimationInterfaceFactoryInterfaceFactory == nil then self.resourceAnimationInterfaceFactoryInterfaceFactory = nil end
end


function OnDemandLoader._jinit(self, onDemandResourcesFactory, gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory, resourceAnimationInterfaceFactoryInterfaceFactory)
    OnDemandLoader._init_fields(self)
        self.onDemandResourcesFactory = onDemandResourcesFactory
        self.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory = gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory
        self.resourceAnimationInterfaceFactoryInterfaceFactory = resourceAnimationInterfaceFactoryInterfaceFactory
    return self
end

function OnDemandLoader.new(...)
    local self = setmetatable({}, OnDemandLoader)
    OnDemandLoader._jinit(self, ...)
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
        elseif not rawequal(level, resourceLoadingLevelFactory.LOAD_ALL:getLevel()) then
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
            if not rawequal(onDemandResources, OnDemandResources.NULL_ON_DEMAND_RESOURCES) then
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
            if not rawequal(onDemandResources, OnDemandResources.NULL_ON_DEMAND_RESOURCES) then
                index = onDemandResources:initAt(imageCache, self.resourceAnimationInterfaceFactoryInterfaceFactory, portion, loadingString, index)
            end
            end
        end
end

return OnDemandLoader

