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
-- package org.allbinary.game.layer.building

local BuildingLayer = {}
package.loaded["org.allbinary.game.layer.building.BuildingLayer"] = BuildingLayer

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local ExplosionBasicSound = java_lazy("org.allbinary.ag.weapon.media.audio.ExplosionBasicSound")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = java_lazy("org.allbinary.animation.NullIndexedAnimationFactory")
local GroupFactory = java_lazy("org.allbinary.game.identification.GroupFactory")
local NullRTSFormInputFactory = java_lazy("org.allbinary.game.input.form.NullRTSFormInputFactory")
local RTSFormInput = java_lazy("org.allbinary.game.input.form.RTSFormInput")
local VisibleCellPositionsSingleton = java_lazy("org.allbinary.game.input.form.VisibleCellPositionsSingleton")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local AdvancedRTSProperties = java_lazy("org.allbinary.game.layer.AdvancedRTSProperties")
local CollidableRTSBehavior = java_lazy("org.allbinary.game.layer.CollidableRTSBehavior")
local RTSLayerUtil = java_lazy("org.allbinary.game.layer.RTSLayerUtil")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local SelectionHudPaintable = java_lazy("org.allbinary.game.layer.SelectionHudPaintable")
local Waypoint = java_lazy("org.allbinary.game.layer.waypoint.Waypoint")
local TileLayerPositionIntoViewPosition = java_lazy("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local RotationAnimationInterfaceCompositeInterface = java_lazy("org.allbinary.animation.RotationAnimationInterfaceCompositeInterface")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local DamageFloaters = java_lazy("org.allbinary.game.combat.damage.DamageFloaters")
local Health = java_lazy("org.allbinary.game.health.Health")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GeographicMapCellPositionAreaBase = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = java_lazy("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = java_lazy("org.allbinary.game.tracking.TrackingEventListenerInterface")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = java_lazy("org.allbinary.media.audio.SelectSound")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapDirectionUtil = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local RotationAnimation = java_lazy("org.allbinary.animation.RotationAnimation")
local BuildingInfoHudPaintable = java_lazy("org.allbinary.game.layer.building.BuildingInfoHudPaintable")
local BuildingPropertiesFactory = java_lazy("org.allbinary.game.layer.building.BuildingPropertiesFactory")
local SimulatedBuildingPropertiesFactory = java_lazy("org.allbinary.game.layer.building.SimulatedBuildingPropertiesFactory")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table BuildingLayer is declared before the requires
BuildingLayer.__index = BuildingLayer
BuildingLayer.className = "BuildingLayer"
BuildingLayer.javaClassName = "org.allbinary.game.layer.building.BuildingLayer"
setmetatable(BuildingLayer, {__index = AdvancedRTSGameLayer})
BuildingLayer.java_implements = " RotationAnimationInterfaceCompositeInterface TrackingEventListenerInterface "
BuildingLayer.java_interfaces = function() return {RotationAnimationInterfaceCompositeInterface, TrackingEventListenerInterface} end

function BuildingLayer:_init_fields()
    if self.buildingLevelCost == nil then self.buildingLevelCost = 0 end
    if self.productivity == nil then self.productivity = 0 end
    if self.efficiency == nil then self.efficiency = 0 end
    if self.efficiencyPerLevel == nil then self.efficiencyPerLevel = 0 end
    if self.trackingEvent == nil then self.trackingEvent = nil end
    if self.damageFloaters == nil then self.damageFloaters = nil end
    if self.damageFloatersPaintableInterface == nil then self.damageFloatersPaintableInterface = nil end
    if self.healthBar == nil then self.healthBar = nil end
    if self.pathsHashtable == nil then self.pathsHashtable = nil end
    if self.local_ == nil then self.local_ = false end
    self.timeDelayHelper = TimeDelayHelper.new(3000)
end


-- throws Exception
function BuildingLayer.createSimulated()
        local nullAnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance()
        local nullIndexedAnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance()
        return BuildingLayer.new(RemoteInfo.REMOTE_INFO, SimulatedBuildingPropertiesFactory.getInstance(), AdvancedRTSProperties.createPropertiesSimulated(), GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0)
end


function BuildingLayer._jinit(self, remoteInfo, buildingPropertiesFactory, advancedRTSProperties, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y)
    java_super_init(AdvancedRTSGameLayer, self, remoteInfo, NullPathFindingLayer.NULL_PATH_FINDING_LAYER, advancedRTSProperties, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, TileLayerPositionIntoViewPosition.new())
    BuildingLayer._init_fields(self)
        -- super(...) made self above
        self:setCollidableInferface(CollidableRTSBehavior.new(true))
        self:getWaypointBehavior():setWaypoint(Waypoint.new(self, SelectSound.getInstance()))
        self.damageFloaters = buildingPropertiesFactory:getDamageFloaters(self)
        self.damageFloatersPaintableInterface = buildingPropertiesFactory.damageFloatersPaintableInterface
        self.healthBar = buildingPropertiesFactory:getHealthBar(self)
        self.pathsHashtable = buildingPropertiesFactory:getHashtable()
        self:setMaxLevel(30)
        self:setProductivity(1)
        self:setEfficiency(self:calculateEfficiency())
        self.efficiencyPerLevel = buildingPropertiesFactory:getEfficiencyPerLevel(self)
        self.efficiency = self.efficiencyPerLevel
        self:generateMoveOutOfBuildAreaPaths()
        self.trackingEvent = buildingPropertiesFactory:getTrackingEvent(self)
    return self
end

function BuildingLayer.new(...)
    local self = setmetatable({}, BuildingLayer)
    BuildingLayer._jinit(self, ...)
    return self
end


function BuildingLayer:initVisibility(rtsPlayerLayerInterface)
        local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
        if advancedRTSPlayerLayerInterface:isLocalPlayer() then
            self.local_ = true
            self:addVisibility()
        else
            self.local_ = false
        end
        java_super(AdvancedRTSGameLayer, "initVisibility", 1)(self, rtsPlayerLayerInterface)
end
java_overload(BuildingLayer, "initVisibility", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) end)


-- throws Exception
function BuildingLayer:construct(rtsPlayerLayerInterface)
        java_super(AdvancedRTSGameLayer, "construct", 1)(self, rtsPlayerLayerInterface)
        TrackingEventHandler.getInstance():addListenerInterface(self)
end
java_overload(BuildingLayer, "construct", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) end)


function BuildingLayer:onMovement(trackingEvent)
        local try_ok, try_error, try_value = pcall(function()
            local layerInterface = trackingEvent:getLayerInterface()
            if not rawequal(layerInterface:getGroupInterface()[1], self:getGroupInterface()[1]) then
                layerInterface:onMovementFound(self.trackingEvent)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onMovement", e)
        end
end
java_overload(BuildingLayer, "onMovement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TrackingEvent")) end)


-- throws Exception
function BuildingLayer:processBuiltTick(allBinaryLayerManager)
        if self:getHealthInterface():isDamaged() then
            self:setAnimationInterface(self.destroyAnimationInterface)
        end
        if not (self:getHealthInterface():isAlive()) then
            if self:isReadyForExplosion() then
                local currentFrame = self.destroyAnimationInterface:getFrame()
                local size = self.destroyAnimationInterface:getSize() - 1
                if rawequal(currentFrame, size) and not (self.timeDelayHelper:isTimeTNT()) then
                    if not (self:getHealthInterface():isAlive()) then
                        self:setDestroyed(true)
                    end
                else
                    self.destroyAnimationInterface:nextFrame()
                end
            else
                self:setAnimationInterface(self.destroyAnimationInterface)
                SecondaryPlayerQueueFactory.getInstance():add(ExplosionBasicSound.getInstance())
                self.shakeListener:onSmallShakeEvent()
                self.vibration:vibrate(self.duration, 0, 0)
                self.timeDelayHelper:setStartTimeTNT()
                self:setReadyForExplosion(true)
            end
        else
            java_super(AdvancedRTSGameLayer, "processBuiltTick", 1)(self, allBinaryLayerManager)
        end
        self.indexedButShouldBeRotationAnimationInterface:nextFrame()
end
java_overload(BuildingLayer, "processBuiltTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function BuildingLayer:calculateEfficiency()
        return self.efficiencyPerLevel
end
java_overload(BuildingLayer, "calculateEfficiency", 0)


function BuildingLayer:getCost()
        local total = RTSLayerUtil.getInstance():getCostExponential(java_int((self:getLevel() * self:getBuildingLevelCost())))
        return total
end
java_overload(BuildingLayer, "getCost", 0)


function BuildingLayer:getDowngradeCost()
        local downgradeCost = RTSLayerUtil.getInstance():getCostExponential(java_int(((self:getLevel() - 1) * self:getBuildingLevelCost())))
        self.logUtil:putF(require("allbinary_java").to_string("Cost: ") .. require("allbinary_java").to_string(downgradeCost), self, "getDowngradeCost")
        return java_idiv(downgradeCost * 9, 10)
end
java_overload(BuildingLayer, "getDowngradeCost", 0)


function BuildingLayer:getUpgradeCost()
        local upgradeCost = RTSLayerUtil.getInstance():getCostExponential(java_int(((self:getLevel() + 1) * self:getBuildingLevelCost())))
        return upgradeCost
end
java_overload(BuildingLayer, "getUpgradeCost", 0)


function BuildingLayer:downgrade()
        java_super(AdvancedRTSGameLayer, "downgrade", 0)(self)
        self:setProductivity(self:getProductivity() - 1)
        self:setEfficiency(self:getEfficiency() - self:calculateEfficiency())
        self:getHealthInterface():setMaxHealth(self:getHealthInterface():getMaxHealth() - ((self:getLevel() + 1) * 100))
end
java_overload(BuildingLayer, "downgrade", 0)


function BuildingLayer:upgrade()
        java_super(AdvancedRTSGameLayer, "upgrade", 0)(self)
        self:setProductivity(self:getProductivity() + 1)
        self:setEfficiency(self:getEfficiency() + self:calculateEfficiency())
        self:getHealthInterface():setMaxHealth(self:getHealthInterface():getMaxHealth() + (self:getLevel() * 100))
end
java_overload(BuildingLayer, "upgrade", 0)


function BuildingLayer:getBuildingLevelCost()
        return self.buildingLevelCost
end
java_overload(BuildingLayer, "getBuildingLevelCost", 0)


function BuildingLayer:setBuildingLevelCost(buildingLevelCost)
        self.buildingLevelCost = buildingLevelCost
end
java_overload(BuildingLayer, "setBuildingLevelCost", 1, function(java_a1) return true and type(java_a1) == "number" end)


function BuildingLayer:getProductivity()
        return self.productivity
end
java_overload(BuildingLayer, "getProductivity", 0)


function BuildingLayer:setProductivity(productivity)
        self.productivity = productivity
end
java_overload(BuildingLayer, "setProductivity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function BuildingLayer:getEfficiency()
        return self.efficiency
end
java_overload(BuildingLayer, "getEfficiency", 0)


function BuildingLayer:setEfficiency(efficiency)
        self.efficiency = efficiency
end
java_overload(BuildingLayer, "setEfficiency", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function BuildingLayer:generateMoveOutOfBuildAreaPaths()
        local occupyList = self.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
        local surroundList = self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
        local NO_DIRECTION = DirectionFactory.getInstance().NO_DIRECTION
        local geographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance()
        local pathsList = nil
        local occupyGeographicMapCellPosition = nil
        local surroundGeographicMapCellPosition = nil
        local list = nil
        for index2 = occupyList:size() - 1, 0, -1 do
            pathsList = BasicArrayListD.new()
            occupyGeographicMapCellPosition = occupyList:get(index2)
            for index = surroundList:size() - 1, 0, -1 do
                surroundGeographicMapCellPosition = surroundList:get(index)
                if not rawequal(geographicMapDirectionUtil:getEightDirectionFromCellPositionToAdjacentCellPosition(surroundGeographicMapCellPosition, occupyGeographicMapCellPosition), NO_DIRECTION) then
                    list = BasicArrayListS.new(1)
                    list:add(surroundGeographicMapCellPosition)
                    pathsList:add(list)
                end
            end
            self.pathsHashtable:put(occupyGeographicMapCellPosition, pathsList)
        end
end
java_overload(BuildingLayer, "generateMoveOutOfBuildAreaPaths", 0)


function BuildingLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
        local pathsList = self.pathsHashtable:get(geographicMapCellPosition)
        return pathsList
end
java_overload(BuildingLayer, "getMoveOutOfBuildAreaPath", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


function BuildingLayer:getEndGeographicMapCellPositionList()
        return self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
end
java_overload(BuildingLayer, "getEndGeographicMapCellPositionList", 0)


function BuildingLayer:shouldHandleStartSameAsEnd()
        return false
end
java_overload(BuildingLayer, "shouldHandleStartSameAsEnd", 0)


function BuildingLayer:paint(graphics)
        if self:isVisible() then
            java_super(AdvancedRTSGameLayer, "paint", 1)(self, graphics)
            self.damageFloatersPaintableInterface:paint(graphics)
            self.healthBar:paint(graphics)
        end
end
java_overload(BuildingLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function BuildingLayer:damage(damage, damageType)
        java_super(AdvancedRTSGameLayer, "damage", 2)(self, damage, damageType)
        self.damageFloaters:add(damage)
        if damage > 0 then
            self:getHealthInterface():damage(damage)
        end
end
java_overload(BuildingLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function BuildingLayer:getDamage(damageType)
        return 0
end
java_overload(BuildingLayer, "getDamage", 1, function(java_a1) return true and type(java_a1) == "number" end)


function BuildingLayer:addVisibility()
        local geographicMapCellPositionArea = self.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():addStationaryCellPositions(occupyList)
        local surroundList = geographicMapCellPositionArea:getSurroundingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():addStationaryCellPositions(surroundList)
end
java_overload(BuildingLayer, "addVisibility", 0)


function BuildingLayer:removeVisibility()
        local occupyList = self.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():removeStationaryCellPositions(occupyList)
        local surroundList = self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():removeStationaryCellPositions(surroundList)
end
java_overload(BuildingLayer, "removeVisibility", 0)


-- throws Exception
function BuildingLayer:setDestroyed(destroyed)
        java_super(AdvancedRTSGameLayer, "setDestroyed", 1)(self, destroyed)
        if self:isDestroyed() then
            DropCellPositionHistory.getInstance():removeAll(self)
            TrackingEventHandler.getInstance():removeListener(self)
            if self.local_ then
                self:removeVisibility()
            end
            if not (self:getHealthInterface():isAlive()) then
                local damage = self:getHealthInterface():getMaxHealth()
                if damage > 10 then
                    SecondaryPlayerQueueFactory.getInstance():add(ExplosionBasicSound.getInstance())
                    if damage < 100 then
                        self.shakeListener:onSmallShakeEvent()
                        self.vibration:vibrate(self.duration, 0, 0)
                    elseif damage < 1000 then
                        self.shakeListener:onMediumShakeEvent()
                        self.vibration:vibrate(self.duration * 2, 0, 0)
                    elseif damage < 3000 then
                        self.shakeListener:onLargeShakeEvent()
                        self.vibration:vibrate(self.duration * 4, 0, 0)
                    end
                end
            end
        end
end
java_overload(BuildingLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function BuildingLayer:createHudPaintable()
        local buildingInfoHudPaintable = BuildingInfoHudPaintable.getInstance()
        buildingInfoHudPaintable:setBasicColorP(self.allBinaryGameLayerManagerP:getForegroundBasicColor())
        buildingInfoHudPaintable:setRtsLayer(self)
        return buildingInfoHudPaintable
end
java_overload(BuildingLayer, "createHudPaintable", 0)


function BuildingLayer:getHudPaintable()
        local buildingInfoHudPaintable = BuildingInfoHudPaintable.getInstance()
        return buildingInfoHudPaintable
end
java_overload(BuildingLayer, "getHudPaintable", 0)


function BuildingLayer:getType()
        return BuildingLayer.getStaticType()
end
java_overload(BuildingLayer, "getType", 0)


function BuildingLayer.getStaticType()
        return 2
end


function BuildingLayer:getRotationAnimationInterface()
        return java_super(AdvancedRTSGameLayer, "getRotationAnimationInterface", 0)(self)
end
java_overload(BuildingLayer, "getRotationAnimationInterface", 0)


function BuildingLayer:setFrame(index)
        java_super(AdvancedRTSGameLayer, "setFrame", 1)(self, index)
end
java_overload(BuildingLayer, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)

return BuildingLayer

