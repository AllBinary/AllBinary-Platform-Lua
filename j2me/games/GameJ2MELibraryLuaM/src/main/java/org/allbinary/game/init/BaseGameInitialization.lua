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
-- package org.allbinary.game.init

local BaseGameInitialization = {}
package.loaded["org.allbinary.game.init.BaseGameInitialization"] = BaseGameInitialization

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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = java_lazy("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local ChangedGameFeatureListener = java_lazy("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local PlatformInputMappingFactory = java_lazy("org.allbinary.game.input.PlatformInputMappingFactory")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local FeaturedResourceRelativeRelationshipFactory = java_lazy("org.allbinary.game.resource.FeaturedResourceRelativeRelationshipFactory")
local ResourceInitialization = java_lazy("org.allbinary.game.resource.ResourceInitialization")
local ResourceLoadingLevelFactory = java_lazy("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local GameFeatureImageCacheFactory = java_lazy("org.allbinary.image.GameFeatureImageCacheFactory")
local CompleteMotionGestureInputToGameMotionGestureInput = java_lazy("org.allbinary.input.motion.CompleteMotionGestureInputToGameMotionGestureInput")
local BasicTouchInputFactory = java_lazy("org.allbinary.input.motion.button.BasicTouchInputFactory")
local CancelTouchButtonInputFactory = java_lazy("org.allbinary.input.motion.button.CancelTouchButtonInputFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local GameInitializationInterface = require("org.allbinary.game.init.GameInitializationInterface")

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

-- class table BaseGameInitialization is declared before the requires
BaseGameInitialization.__index = BaseGameInitialization
BaseGameInitialization.className = "BaseGameInitialization"
BaseGameInitialization.javaClassName = "org.allbinary.game.init.BaseGameInitialization"
BaseGameInitialization.java_implements = " GameInitializationInterface "
BaseGameInitialization.java_interfaces = function() return {GameInitializationInterface} end

function BaseGameInitialization:_init_fields()
    if self.resourceInitializationArray == nil then self.resourceInitializationArray = nil end
    if self.portion == nil then self.portion = nil end
    if self.initialized == nil then self.initialized = false end
    self.EARLY_RESOURCES = 0
    self.GAME_RESOURCES = 1
    self.EARLY_CHANGABLE_RESOURCES = 2
    self.GAME_CHANGABLE_RESOURCES = 3
    if self.gameInitialized == nil then self.gameInitialized = false end
    if self.allLoaded == nil then self.allLoaded = false end
end


function BaseGameInitialization._jinit(self, resourceInitializationArray, portion)
    BaseGameInitialization._init_fields(self)
        self.resourceInitializationArray = resourceInitializationArray
        self.portion = portion
    return self
end

function BaseGameInitialization.new(...)
    local self = setmetatable({}, BaseGameInitialization)
    BaseGameInitialization._jinit(self, ...)
    return self
end


-- throws Exception
function BaseGameInitialization:initKey(portion)
end


-- throws Exception
function BaseGameInitialization:initKeyMapping(abeClientInformation, portion)
        if ChangedGameFeatureListener.getInstance():isChangedFeature(InputFeatureFactory.getInstance().INPUT_MAPPING) then
            PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():init(abeClientInformation)
            ProgressCanvasFactory.getInstance():addNormalPortion(50, "Game Keys")
            ChangedGameFeatureListener.getInstance():remove(InputFeatureFactory.getInstance().INPUT_MAPPING)
        end
end


-- throws Exception
function BaseGameInitialization:init(abeClientInformation, commandListener, level)
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        if not self:isInitialized() and (level == resourceLoadingLevelFactory.LOAD_ALL:getLevel() or level == resourceLoadingLevelFactory.LOAD_EARLY:getLevel()) then
            local localPortion = 40
            if level == resourceLoadingLevelFactory.LOAD_EARLY:getLevel() then
                localPortion = 8
            end
            self:setInitialized(true)
            self:initKey(self:getPortion())
            self:initKeyMapping(abeClientInformation, self:getPortion())
            GameKeyEventFactory.getInstance():init()
            local progressCanvas = ProgressCanvasFactory.getInstance()
            progressCanvas:addNormalPortion(localPortion, "Game Key Events")
            BasicTouchInputFactory.getInstance():init(PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping())
            CancelTouchButtonInputFactory.getInstance()
            progressCanvas:addNormalPortion(localPortion, "Touch Input")
            CompleteMotionGestureInputToGameMotionGestureInput.getInstance():init()
            progressCanvas:addNormalPortion(localPortion, "Motion Input")
            GameFeatureImageCacheFactory.init()
            progressCanvas:addNormalPortion(localPortion, "Image Cache")
            self.resourceInitializationArray[self.EARLY_RESOURCES + 1]:init()
        end
end


-- throws Exception
function BaseGameInitialization:resourceInitialization(level)
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        if self:resourceAnimationChange() and level == resourceLoadingLevelFactory.LOAD_EARLY:getLevel() then
            self:clearResources()
            self.resourceInitializationArray[self.EARLY_CHANGABLE_RESOURCES + 1]:init()
        end
        if self:resourceAnimationChange() and level == resourceLoadingLevelFactory.LOAD_ALL:getLevel() then
            if self.allLoaded then
                self:clearResources()
            end
            if FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():getList():size() == 0 then
                self.resourceInitializationArray[self.EARLY_CHANGABLE_RESOURCES + 1]:init()
            end
            self.resourceInitializationArray[self.GAME_CHANGABLE_RESOURCES + 1]:init()
            self.allLoaded = true
        end
end


function BaseGameInitialization:resourceAnimationChange()
        local changedGameFeatureListener = ChangedGameFeatureListener.getInstance()
        local gameConfigurationCentral = GameConfigurationCentral.getInstance()
        if changedGameFeatureListener:isChangedGameConfiguration(gameConfigurationCentral.SCALE) then
            return true
        end
        if ChangedGameFeatureListener.getInstance():isChangedFeature(MainFeatureFactory.getInstance().STATIC) then
            return true
        end
        return false
end


function BaseGameInitialization:clearResources()
        self.allLoaded = false
        GameFeatureImageCacheFactory.releaseAll()
        local featuredAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()
        featuredAnimationInterfaceFactoryInterfaceFactory:clear()
        FeaturedResourceRelativeRelationshipFactory.getInstance():clear()
end


function BaseGameInitialization:setGameInitialized(gameInitialized)
        self.gameInitialized = gameInitialized
end


function BaseGameInitialization:isGameInitialized()
        return self.gameInitialized
end


function BaseGameInitialization:getPortion()
        return self.portion
end


function BaseGameInitialization:setInitialized(initialized)
        self.initialized = initialized
end


function BaseGameInitialization:isInitialized()
        return self.initialized
end

BaseGameInitialization.NULL_BASE_GAME_INITIALIZATION = BaseGameInitialization.new(java_new_array(nil, 0), 0)

return BaseGameInitialization

