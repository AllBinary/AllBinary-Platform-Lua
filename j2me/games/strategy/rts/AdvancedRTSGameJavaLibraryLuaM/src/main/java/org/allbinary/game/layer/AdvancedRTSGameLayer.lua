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
-- package org.allbinary.game.layer

local AdvancedRTSGameLayer = {}
package.loaded["org.allbinary.game.layer.AdvancedRTSGameLayer"] = AdvancedRTSGameLayer

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = java_lazy("org.allbinary.animation.NullIndexedAnimationFactory")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local ShakeAnimationListener = java_lazy("org.allbinary.animation.transition.shake.ShakeAnimationListener")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local GameTypeFactory = java_lazy("org.allbinary.game.GameTypeFactory")
local DestroyedEvent = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local DestroyedEventHandler = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEventHandler")
local DestroyedEventListenerInterface = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface")
local Health = java_lazy("org.allbinary.game.health.Health")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GroupFactory = java_lazy("org.allbinary.game.identification.GroupFactory")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local NullRTSFormInputFactory = java_lazy("org.allbinary.game.input.form.NullRTSFormInputFactory")
local RTSFormInput = java_lazy("org.allbinary.game.input.form.RTSFormInput")
local BuildingEventHandler = java_lazy("org.allbinary.game.layer.building.event.BuildingEventHandler")
local Waypoint2LogHelper = java_lazy("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")
local Waypoint2SelectedLogHelper = java_lazy("org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper")
local WaypointBase = java_lazy("org.allbinary.game.layer.waypoint.WaypointBase")
local WaypointLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointLogHelper")
local WaypointRunnableLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")
local WaypointRunnableSelectedLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointRunnableSelectedLogHelper")
local WaypointSelectedLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local NullTickable = java_lazy("org.allbinary.game.tick.NullTickable")
local TickableInterface = java_lazy("org.allbinary.game.tick.TickableInterface")
local TileLayerPositionIntoViewPosition = java_lazy("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local FrameUtil = java_lazy("org.allbinary.math.FrameUtil")
local AllBinaryVibrationME = java_lazy("org.allbinary.media.AllBinaryVibrationME")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local GeographicMapDirectionUtil = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local AdvancedRTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local AdvancedRTSProperties = java_lazy("org.allbinary.game.layer.AdvancedRTSProperties")
local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayerUtil = java_lazy("org.allbinary.game.layer.RTSLayerUtil")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table AdvancedRTSGameLayer is declared before the requires
AdvancedRTSGameLayer.__index = AdvancedRTSGameLayer
AdvancedRTSGameLayer.className = "AdvancedRTSGameLayer"
AdvancedRTSGameLayer.javaClassName = "org.allbinary.game.layer.AdvancedRTSGameLayer"
setmetatable(AdvancedRTSGameLayer, {__index = RTSLayer})
AdvancedRTSGameLayer.java_implements = " DestroyedEventListenerInterface "
AdvancedRTSGameLayer.java_interfaces = function() return {DestroyedEventListenerInterface} end

function AdvancedRTSGameLayer:_init_fields()
    if self.shakeListener == nil then self.shakeListener = nil end
    if self.vibration == nil then self.vibration = nil end
    if self.duration == nil then self.duration = nil end
    self.parentLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.waypointBehaviorBase = NullTickable.getInstance()
end


-- throws Exception
function AdvancedRTSGameLayer.createSimulated()
        local nullAnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance()
        local nullIndexedAnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance()
        return AdvancedRTSGameLayer.new(RemoteInfo.REMOTE_INFO, NullPathFindingLayer.NULL_PATH_FINDING_LAYER, AdvancedRTSProperties.createPropertiesSimulated(), GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0, TileLayerPositionIntoViewPosition.new())
end


function AdvancedRTSGameLayer._jinit(self, remoteInfo, parentLayer, advancedRTSProperties, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition)
    java_super_init(RTSLayer, self, remoteInfo, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition)
    AdvancedRTSGameLayer._init_fields(self)
        -- super(...) made self above
        self:setVisible(false)
        self:setWaypointBehavior(WaypointBehaviorBase.new())
        self.shakeListener = advancedRTSProperties.shakeListener
        self.vibration = advancedRTSProperties.vibration
        self.duration = advancedRTSProperties.duration
        self:setParentLayer(parentLayer)
    return self
end

function AdvancedRTSGameLayer.new(...)
    local self = setmetatable({}, AdvancedRTSGameLayer)
    AdvancedRTSGameLayer._jinit(self, ...)
    return self
end


-- throws Exception
function AdvancedRTSGameLayer:updateWaypointBehavior(geographicMapInterface)
        java_super(RTSLayer, "updateWaypointBehavior", 1)(self, geographicMapInterface)
        self:getWaypointBehavior():getWaypoint():setAllBinaryGameLayerManager(self.allBinaryGameLayerManagerP)
end
java_overload(AdvancedRTSGameLayer, "updateWaypointBehavior", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) end)


function AdvancedRTSGameLayer:initVisibility(rtsPlayerLayerInterface)
        local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
        if advancedRTSPlayerLayerInterface:isLocalPlayer() or advancedRTSPlayerLayerInterface:getGameType() == GameTypeFactory.getInstance().BOT then
            self:setVisible(true)
        else
            self:setVisible(false)
        end
end
java_overload(AdvancedRTSGameLayer, "initVisibility", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) end)


-- throws Exception
function AdvancedRTSGameLayer:construct(rtsPlayerLayerInterface)
        java_super(RTSLayer, "construct", 1)(self, rtsPlayerLayerInterface)
        self:initVisibility(rtsPlayerLayerInterface)
        BuildingEventHandler.getInstance():addListenerInterface(self:getWaypointBehavior():getWaypoint())
end
java_overload(AdvancedRTSGameLayer, "construct", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) end)


-- throws Exception
function AdvancedRTSGameLayer:setDestroyed(destroyed)
        java_super(RTSLayer, "setDestroyed", 1)(self, destroyed)
        if self:isDestroyed() then
            BuildingEventHandler.getInstance():removeListener(self:getWaypointBehavior():getWaypoint())
            BuildingEventHandler.getInstance():removeListener(self)
            DestroyedEventHandler.getInstance():addListener(self)
            RTSLayerUtil.getInstance():destroyAndClear(self:getWaypointBehavior():getOwnedWaypointList())
        end
end
java_overload(AdvancedRTSGameLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function AdvancedRTSGameLayer:getParentLayer()
        return self.parentLayer
end
java_overload(AdvancedRTSGameLayer, "getParentLayer", 0)


function AdvancedRTSGameLayer:setParentLayer(parentLayer)
        self.parentLayer = parentLayer
end
java_overload(AdvancedRTSGameLayer, "setParentLayer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function AdvancedRTSGameLayer:getWaypointBehavior()
        return self.waypointBehaviorBase
end
java_overload(AdvancedRTSGameLayer, "getWaypointBehavior", 0)


function AdvancedRTSGameLayer:setWaypointBehavior(unitWaypointHelper)
        self.waypointBehaviorBase = unitWaypointHelper
end
java_overload(AdvancedRTSGameLayer, "setWaypointBehavior", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WaypointBehaviorBase")) end)


function AdvancedRTSGameLayer:getWaypointLogHelper()
        return self.waypointLogHelperP
end
java_overload(AdvancedRTSGameLayer, "getWaypointLogHelper", 0)


function AdvancedRTSGameLayer:getWaypoint2LogHelper()
        return self.waypoint2LogHelperP
end
java_overload(AdvancedRTSGameLayer, "getWaypoint2LogHelper", 0)


function AdvancedRTSGameLayer:getWaypointRunnableLogHelper()
        return self.waypointRunnableLogHelperP
end
java_overload(AdvancedRTSGameLayer, "getWaypointRunnableLogHelper", 0)


function AdvancedRTSGameLayer:shouldAddWaypointFromBuilding()
        if self.parentLayer ~= NullPathFindingLayer.NULL_PATH_FINDING_LAYER then
            local parentAdvancedRTSGameLayer = self.parentLayer
            if parentAdvancedRTSGameLayer:getType() ~= 1 then
                return true
            end
        end
        return false
end
java_overload(AdvancedRTSGameLayer, "shouldAddWaypointFromBuilding", 0)


function AdvancedRTSGameLayer:isWaypointListEmptyOrOnlyTargets()
        if self:getType() ~= 1 then
            return true
        end
        return false
end
java_overload(AdvancedRTSGameLayer, "isWaypointListEmptyOrOnlyTargets", 0)


-- throws Exception
function AdvancedRTSGameLayer:buildingChase(allbinaryLayer, cellPosition)
        local geographicMapCellPosition = self:getCurrentGeographicMapCellPosition()
        local buildingDirection = GeographicMapDirectionUtil.getInstance():getDirectionFromCellPositionToAdjacentCellPosition(geographicMapCellPosition, cellPosition)
        local angleInfo = self:getRotationAnimationInterface():getAngleInfoP()
        local angle = FrameUtil.getInstance():adjustAngleToFrameAngle(angleInfo:getAngle() + 90)
        local gameKeyEventFactory = GameKeyEventFactory.getInstance()
        if buildingDirection == DirectionFactory.getInstance().UP then
            self.rtsLayer2LogHelper:buildingAbove(self)
            if angle > 180 and angle < 360 then
                self.rtsLayer2LogHelper:buildingChaseLeft(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle <= 190 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseRight(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle >= 170 then
                    return true
                end
            end
        elseif buildingDirection == DirectionFactory.getInstance().DOWN then
            self.rtsLayer2LogHelper:buildingDown(self)
            if angle > 180 and angle < 360 then
                self.rtsLayer2LogHelper:buildingChaseLeft(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle > 315 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseRight(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle < 45 then
                    return true
                end
            end
        elseif buildingDirection == DirectionFactory.getInstance().LEFT then
            self.rtsLayer2LogHelper:buildingLeft()
            if angle > 90 and angle < 270 then
                self.rtsLayer2LogHelper:buildingChaseDown(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle < 135 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseUp(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle > 45 then
                    return true
                end
            end
        elseif buildingDirection == DirectionFactory.getInstance().RIGHT then
            self.rtsLayer2LogHelper:buildingRight()
            if angle > 90 and angle < 270 then
                self.rtsLayer2LogHelper:buildingChaseDown(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle > 225 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseUp(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle < 315 and angle > 180 then
                    return true
                end
            end
        else
            return true
        end
        return false
end
java_overload(AdvancedRTSGameLayer, "buildingChase", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


-- throws Exception
function AdvancedRTSGameLayer:getSurroundingGeographicMapCellPositionList()
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.geographicMapCellPositionAreaBase:update(geographicMapInterface)
        return self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
end
java_overload(AdvancedRTSGameLayer, "getSurroundingGeographicMapCellPositionList", 0)


function AdvancedRTSGameLayer:setSelected(selected)
        java_super(RTSLayer, "setSelected", 1)(self, selected)
        if self.debug_f then
            if selected then
                self.waypointLogHelperP = WaypointSelectedLogHelper.getInstance()
                self.waypoint2LogHelperP = Waypoint2SelectedLogHelper.getInstance()
                self.waypointRunnableLogHelperP = WaypointRunnableSelectedLogHelper.getInstance()
            else
                self.waypointLogHelperP = WaypointLogHelper.getInstance()
                self.waypoint2LogHelperP = Waypoint2LogHelper.getInstance()
                self.waypointRunnableLogHelperP = WaypointRunnableLogHelper.getInstance()
            end
        end
end
java_overload(AdvancedRTSGameLayer, "setSelected", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function AdvancedRTSGameLayer:onDestroyed(destroyedEvent)
        local try_ok, try_error, try_value = pcall(function()
            local layerInterface = destroyedEvent:getLayerInterface()
            if layerInterface == self then
                DestroyedEventHandler.getInstance():removeListener(self)
                local waypoint = self:getWaypointBehavior():getWaypoint()
                waypoint:reset()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onDestroyed", e)
        end
end
java_overload(AdvancedRTSGameLayer, "onDestroyed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DestroyedEvent")) end)

return AdvancedRTSGameLayer

