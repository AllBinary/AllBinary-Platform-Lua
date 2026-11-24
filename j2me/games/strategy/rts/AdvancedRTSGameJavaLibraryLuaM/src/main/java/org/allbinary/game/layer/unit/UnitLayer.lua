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

local UnitLayer = {}
package.loaded["org.allbinary.game.layer.unit.UnitLayer"] = UnitLayer

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
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local ExplosionBasicSound = java_lazy("org.allbinary.ag.weapon.media.audio.ExplosionBasicSound")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = java_lazy("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = java_lazy("org.allbinary.animation.NullIndexedAnimationFactory")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local RotationAnimation = java_lazy("org.allbinary.animation.RotationAnimation")
local CaptionAnimationHelper = java_lazy("org.allbinary.animation.caption.CaptionAnimationHelper")
local CaptionAnimationHelperBase = java_lazy("org.allbinary.animation.caption.CaptionAnimationHelperBase")
local AdjustedCircleAnimation = java_lazy("org.allbinary.animation.vector.AdjustedCircleAnimation")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DamageFloaters = java_lazy("org.allbinary.game.combat.damage.DamageFloaters")
local PtsDamageFloaters = java_lazy("org.allbinary.game.combat.damage.PtsDamageFloaters")
local WeaponProperties = java_lazy("org.allbinary.game.combat.weapon.WeaponProperties")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local BasicHudFactory = java_lazy("org.allbinary.game.graphics.hud.BasicHudFactory")
local Health = java_lazy("org.allbinary.game.health.Health")
local HealthBar = java_lazy("org.allbinary.game.health.HealthBar")
local HealthBarTwodAnimation = java_lazy("org.allbinary.game.health.HealthBarTwodAnimation")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GroupCommonFactory = java_lazy("org.allbinary.game.identification.GroupCommonFactory")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local GameKeyEventUtil = java_lazy("org.allbinary.game.input.event.GameKeyEventUtil")
local VisibleCellPositionsSingleton = java_lazy("org.allbinary.game.input.form.VisibleCellPositionsSingleton")
local WaypointRTSFormInput = java_lazy("org.allbinary.game.input.form.WaypointRTSFormInput")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSProperties = java_lazy("org.allbinary.game.layer.AdvancedRTSProperties")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local LayerCaptionResources = java_lazy("org.allbinary.game.layer.LayerCaptionResources")
local LinePathRelativeAnimation = java_lazy("org.allbinary.game.layer.LinePathRelativeAnimation")
local PathAnimation = java_lazy("org.allbinary.game.layer.PathAnimation")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayer2LogHelper = java_lazy("org.allbinary.game.layer.RTSLayer2LogHelper")
local RTSLayer2SelectedLogHelper = java_lazy("org.allbinary.game.layer.RTSLayer2SelectedLogHelper")
local RTSLayerEvent = java_lazy("org.allbinary.game.layer.RTSLayerEvent")
local RTSLayerHudPaintable = java_lazy("org.allbinary.game.layer.RTSLayerHudPaintable")
local RTSLayerLogHelper = java_lazy("org.allbinary.game.layer.RTSLayerLogHelper")
local RTSLayerSelectedLogHelper = java_lazy("org.allbinary.game.layer.RTSLayerSelectedLogHelper")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local SelectionHudPaintable = java_lazy("org.allbinary.game.layer.SelectionHudPaintable")
local SensorActionFactory = java_lazy("org.allbinary.game.layer.SensorActionFactory")
local SteeringVisitor = java_lazy("org.allbinary.game.layer.SteeringVisitor")
local TiledLayerUtil = java_lazy("org.allbinary.game.layer.TiledLayerUtil")
local VehicleFrictionProperties = java_lazy("org.allbinary.game.layer.VehicleFrictionProperties")
local VehicleProperties = java_lazy("org.allbinary.game.layer.VehicleProperties")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")
local BuildingLayer = java_lazy("org.allbinary.game.layer.building.BuildingLayer")
local BuildingEventHandler = java_lazy("org.allbinary.game.layer.building.event.BuildingEventHandler")
local BuildingEventListenerInterface = java_lazy("org.allbinary.game.layer.building.event.BuildingEventListenerInterface")
local CapitalEvent = java_lazy("org.allbinary.game.layer.capital.event.CapitalEvent")
local CapitalEventHandlerFactory = java_lazy("org.allbinary.game.layer.capital.event.CapitalEventHandlerFactory")
local LayerPartialCellPositionsUtil = java_lazy("org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil")
local SpecialDownGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialDownGameInputProcessor")
local SpecialFireGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialFireGameInputProcessor")
local SpecialLeftGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialLeftGameInputProcessor")
local SpecialRightGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialRightGameInputProcessor")
local SpecialUpGameInputProcessor = java_lazy("org.allbinary.game.layer.special.SpecialUpGameInputProcessor")
local MultipassNoCacheWaypoint = java_lazy("org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint")
local NoCacheWaypoint = java_lazy("org.allbinary.game.layer.waypoint.NoCacheWaypoint")
local WaypointBase = java_lazy("org.allbinary.game.layer.waypoint.WaypointBase")
local WaypointEventHandlerFactory = java_lazy("org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local BasicWeaponPart = java_lazy("org.allbinary.game.part.weapon.BasicWeaponPart")
local SalvoInterface = java_lazy("org.allbinary.game.part.weapon.SalvoInterface")
local VelocityProperties = java_lazy("org.allbinary.game.physics.velocity.VelocityProperties")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = java_lazy("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = java_lazy("org.allbinary.game.tracking.TrackingEventListenerInterface")
local CellPositionFactory = java_lazy("org.allbinary.graphics.CellPositionFactory")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local Layer = java_lazy("org.allbinary.layer.Layer")
local LayerInterfaceFactoryInterface = java_lazy("org.allbinary.layer.LayerInterfaceFactoryInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BasicDecimal = java_lazy("org.allbinary.logic.math.BasicDecimal")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local FrameUtil = java_lazy("org.allbinary.math.FrameUtil")
local LayerDistanceUtil = java_lazy("org.allbinary.math.LayerDistanceUtil")
local NamedAngle = java_lazy("org.allbinary.math.NamedAngle")
local AttackSound = java_lazy("org.allbinary.media.audio.AttackSound")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local RaceTrackGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local CollidableUnitBehavior = java_lazy("org.allbinary.game.layer.unit.CollidableUnitBehavior")
local UnitWaypointBehavior = java_lazy("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local UnitWaypointBehavior2 = java_lazy("org.allbinary.game.layer.unit.UnitWaypointBehavior2")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table UnitLayer is declared before the requires
UnitLayer.__index = UnitLayer
UnitLayer.className = "UnitLayer"
UnitLayer.javaClassName = "org.allbinary.game.layer.unit.UnitLayer"
setmetatable(UnitLayer, {__index = AdvancedRTSGameLayer})
UnitLayer.java_implements = " BuildingEventListenerInterface TrackingEventListenerInterface "
UnitLayer.java_interfaces = function() return {BuildingEventListenerInterface, TrackingEventListenerInterface} end

function UnitLayer:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.groupCommonFactory = GroupCommonFactory.getInstance()
    self.layerPartialCellPositionsUtil = LayerPartialCellPositionsUtil.getInstance()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
    self.angleFactory = AngleFactory.getInstance()
    self.cellPositionFactory = CellPositionFactory.getInstance()
    if self.maxResourceLoad == nil then self.maxResourceLoad = nil end
    if self.vehicleProperties == nil then self.vehicleProperties = nil end
    self.accelerationBasicDecimal = BasicDecimal.new(1600)
    self.decelerationBasicDecimal = BasicDecimal.new(-1000)
    if self.trackingEvent == nil then self.trackingEvent = nil end
    if self.damageFloaters == nil then self.damageFloaters = nil end
    if self.damageFloatersPaintableInterface == nil then self.damageFloatersPaintableInterface = nil end
    if self.healthBar == nil then self.healthBar = nil end
    if self.moveSoundInterface == nil then self.moveSoundInterface = nil end
    if self.initResourceAnimation == nil then self.initResourceAnimation = nil end
    self.resourceAnimation = NullIndexedAnimationFactory.getFactoryInstance():getInstance(0)
    if self.initPathAnimation == nil then self.initPathAnimation = nil end
    self.pathAnimation = NullAnimationFactory.getFactoryInstance():getInstance(0)
    self.captionAnimationHelper = CaptionAnimationHelper.new(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(LayerCaptionResources.getInstance().RESOURCE):getInstance(0), -23, -25, 6, 0)
    if self.decalAnimation == nil then self.decalAnimation = nil end
    if self.waypointLayerInterfaceFactoryInterface == nil then self.waypointLayerInterfaceFactoryInterface = nil end
    self.resourceLoad = 0
    if self.weaponRange == nil then self.weaponRange = 0 end
    self.rtsLogHelper = RTSLayerLogHelper.getInstance()
    if self.rotationAnimationInterfaceP == nil then self.rotationAnimationInterfaceP = nil end
    self.movementAngle = self.angleFactory.NOT_ANGLE
    self.steeringInsideGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.sensorGeographicMapCellPositionList = BasicArrayListD.new()
    self.CAPITAL_EVENT = CapitalEvent.new(self)
end


function UnitLayer._jinit(self, remoteInfo, parentLayer, advancedRTSProperties, groupInterface, rootName, name, vehicleProperties, healthInterface, maxResourceLoad, moveSoundInterface, waypointLayerInterfaceFactoryInterface, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, decalAnimationInterfaceFactoryInterface, resourceAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, direction, x, y, z, viewPosition)
    java_super_init(AdvancedRTSGameLayer, self, remoteInfo, parentLayer, advancedRTSProperties, groupInterface, rootName, name, healthInterface, WaypointRTSFormInput.new(groupInterface, true), animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition)
    UnitLayer._init_fields(self)
        -- super(...) made self above
        self:setCollidableInferface(CollidableUnitBehavior.new(true))
        self.waypointLayerInterfaceFactoryInterface = waypointLayerInterfaceFactoryInterface
        self.maxResourceLoad = math.tointeger(maxResourceLoad // 1)
        self.moveSoundInterface = moveSoundInterface
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().DAMAGE_FLOATERS) then
            self.damageFloaters = PtsDamageFloaters.new(self)
            self.damageFloatersPaintableInterface = self.damageFloaters
        else
            self.damageFloatersPaintableInterface = NullPaintable.getInstance()
            self.damageFloaters = DamageFloaters.new()
        end
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().HEALTH_BARS) then
            self.healthBar = HealthBar.new(self, self:getHealthInterface(), HealthBarTwodAnimation.new(self, BasicHudFactory.getInstance().BOTTOMLEFT), -1)
        else
            self.healthBar = NullPaintable.getInstance()
        end
        self.decalAnimation = decalAnimationInterfaceFactoryInterface:getInstance(0)
        self.initResourceAnimation = resourceAnimationInterfaceFactoryInterface:getInstance(0)
        self.initResourceAnimation:setFrameByDirection(direction)
        self.decalAnimation:setFrameByDirection(direction)
        self.rotationAnimationInterfaceP = self.indexedButShouldBeRotationAnimationInterface
        self.rotationAnimationInterfaceP:setFrameByDirection(direction)
        self:setMaxLevel(12)
        self.vehicleProperties = vehicleProperties
        self.trackingEvent = TrackingEvent.new(self)
        self.initPathAnimation = PathAnimation.new(self, LinePathRelativeAnimation.getInstance())
    return self
end

function UnitLayer.new(...)
    local self = setmetatable({}, UnitLayer)
    UnitLayer._jinit(self, ...)
    return self
end


-- throws Exception
function UnitLayer:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(AdvancedRTSGameLayer, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
        self.initPathAnimation:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
end
java_overload(UnitLayer, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function UnitLayer:updateWaypointBehavior(geographicMapInterface)
        local hashtable = StdUtil.getInstance():createHashtable()
        hashtable:put(self.groupCommonFactory.ID, self:getGroupInterface())
        hashtable:put(Layer.ID, self)
        hashtable:put(AllBinaryGameLayerManager.ID, self.allBinaryGameLayerManagerP)
        self:setWaypointBehavior(UnitWaypointBehavior2.new(self, self.waypointLayerInterfaceFactoryInterface:getNextInstance(hashtable, self.x, self.y, self.z)))
        local features = Features.getInstance()
        local waypoint = (function() if J2MEUtil.isHTML() then return MultipassNoCacheWaypoint.new(self, AttackSound.getInstance()) else return NoCacheWaypoint.new(self, AttackSound.getInstance()) end end)()
        self:getWaypointBehavior():setWaypoint(waypoint)
        java_super(AdvancedRTSGameLayer, "updateWaypointBehavior", 1)(self, geographicMapInterface)
        self:initRangeHack()
end
java_overload(UnitLayer, "updateWaypointBehavior", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) end)


-- throws Exception
function UnitLayer:construct(rtsPlayerLayerInterface)
        java_super(AdvancedRTSGameLayer, "construct", 1)(self, rtsPlayerLayerInterface)
        TrackingEventHandler.getInstance():addListenerInterface(self)
        WaypointEventHandlerFactory.getInstance(self:getGroupInterface()[1]):addListenerInterface(self:getUnitWaypointBehavior())
        BuildingEventHandler.getInstance():addListenerInterface(self)
        self:getUnitWaypointBehavior():setCurrentPathGeographicMapCellPosition(self:getCurrentGeographicMapCellPosition())
        self:updateSensorGeographicMapCellPositionList()
        self:getUnitWaypointBehavior():setLastPathGeographicMapCellPosition(self:getUnitWaypointBehavior():getCurrentPathGeographicMapCellPosition())
end
java_overload(UnitLayer, "construct", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) end)


-- throws Exception
function UnitLayer:updateSensorGeographicMapCellPositionList()
        if VisibleCellPositionsSingleton.getInstance():shouldProcess() then
            local currentGeographicMapCellPosition = self:getCurrentGeographicMapCellPosition()
            self.sensorGeographicMapCellPositionList:clear()
            self.sensorGeographicMapCellPositionList:add(currentGeographicMapCellPosition)
            local sensorRange = self.weaponRange * UnitLayer.SENSOR_RANGE_MULTIPLIER
            local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
            local totalCells = (sensorRange / tiledLayer:getCellHeight()) / 2
            local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
            local column = currentGeographicMapCellPosition:getColumn()
            local row = currentGeographicMapCellPosition:getRow()
            local lastColumn = column + totalCells
            local lastRow = row + totalCells
            if lastColumn > tiledLayer:getColumns() then
                lastColumn = tiledLayer:getColumns()
            end
            if lastRow > tiledLayer:getRows() then
                lastRow = tiledLayer:getRows()
            end
            local firstColumn = column - totalCells
            local firstRow = row - totalCells
            if firstColumn < 0 then
                firstColumn = 0
            end
            if firstRow < 0 then
                firstRow = 0
            end
            for index = lastColumn - 1, firstColumn, -1 do
                for index2 = lastRow - 1, firstRow, -1 do
                    local geographicMapCellPosition = geographicMapCellPositionFactory:getAt(index, index2)
                    if not self.sensorGeographicMapCellPositionList:contains(geographicMapCellPosition) then
                        self.sensorGeographicMapCellPositionList:add(geographicMapCellPosition)
                    end
                end
            end
        end
end
java_overload(UnitLayer, "updateSensorGeographicMapCellPositionList", 0)


function UnitLayer:getSensorGeographicMapCellPositionList()
        return self.sensorGeographicMapCellPositionList
end
java_overload(UnitLayer, "getSensorGeographicMapCellPositionList", 0)


function UnitLayer:select()
        self.pathAnimation = self.initPathAnimation
        java_super(AdvancedRTSGameLayer, "select", 0)(self)
end
java_overload(UnitLayer, "select", 0)


function UnitLayer:deselect()
        self.pathAnimation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        java_super(AdvancedRTSGameLayer, "deselect", 0)(self)
end
java_overload(UnitLayer, "deselect", 0)


function UnitLayer:setSelected(selected)
        java_super(AdvancedRTSGameLayer, "setSelected", 1)(self, selected)
        if selected then
            if self.debug_f then
                self.rtsLogHelper = RTSLayerSelectedLogHelper.getInstance()
            end
            self.rtsLayer2LogHelper = RTSLayer2SelectedLogHelper.getInstance()
        else
            if self.debug_f then
                self.rtsLogHelper = RTSLayerLogHelper.getInstance()
            end
            self.rtsLayer2LogHelper = RTSLayer2LogHelper.getInstance()
        end
end
java_overload(UnitLayer, "setSelected", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws Exception
function UnitLayer:setClosestGeographicMapCellHistory(pathsList)
        self.rtsLogHelper:setClosestGeographicMapCellHistory(self, pathsList)
        local closestIndex = -1
        local shortestDistance = require("java.lang.Integer").MAX_VALUE
        local currentDistance = require("java.lang.Integer").MAX_VALUE
        for index = pathsList:size() - 1, 0, -1 do
            local geographicMapCellPositionBasicArrayList = pathsList:get(index)
            local geographicMapCellPosition = geographicMapCellPositionBasicArrayList:get(geographicMapCellPositionBasicArrayList:size() - 1)
            currentDistance = self.layerDistanceUtil:getDistanceAt(self, geographicMapCellPosition:getMidPoint())
            if currentDistance < shortestDistance then
                shortestDistance = currentDistance
                closestIndex = index
            end
        end
        if closestIndex >= 0 then
            local geographicMapCellPositionBasicArrayList = pathsList:get(closestIndex)
            local geographicMapCellPosition = geographicMapCellPositionBasicArrayList:get(0)
            self:teleportTo(geographicMapCellPosition)
        end
end
java_overload(UnitLayer, "setClosestGeographicMapCellHistory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws Exception
function UnitLayer:init(geographicMapCellHistory, geographicMapCellPositionBasicArrayList)
        geographicMapCellHistory:trackAll(geographicMapCellPositionBasicArrayList)
end
java_overload(UnitLayer, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellHistory")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) end)


function UnitLayer:onMovement(trackingEvent)
        local try_ok, try_error, try_value = pcall(function()
            local layerInterface = trackingEvent:getLayerInterface()
            if layerInterface:getGroupInterface()[1] ~= self:getGroupInterface()[1] then
                self:getUnitWaypointBehavior():getPossibleTargetList():add(layerInterface)
                layerInterface:onMovementFound(self:getTrackingEvent())
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onMovement", e)
        end
end
java_overload(UnitLayer, "onMovement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TrackingEvent")) end)


-- throws Exception
function UnitLayer:onMovementFound(trackingEvent)
        local layerInterface = trackingEvent:getLayerInterface()
        if layerInterface:getGroupInterface()[1] ~= self:getGroupInterface()[1] then
            self:getUnitWaypointBehavior():getPossibleTargetList():add(layerInterface)
        end
end
java_overload(UnitLayer, "onMovementFound", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TrackingEvent")) end)


function UnitLayer:initRangeHack()
        local basicWeaponPart = self:getPartInterfaceArray()[1]
        local weaponProperties = basicWeaponPart:getWeaponProperties()
        self.weaponRange = weaponProperties:getRange()
        self.initRangeAnimation = AdjustedCircleAnimation.createW(self.weaponRange, self.weaponRange, self:getWidth(), self.basicColorFactory.GREEN)
        local sensorRange = self.weaponRange * UnitLayer.SENSOR_RANGE_MULTIPLIER
        self.initSensorRangeAnimation = AdjustedCircleAnimation.createW(sensorRange, sensorRange, self:getWidth(), self.basicColorFactory.RED)
        self:getUnitWaypointBehavior():initRange(self.weaponRange)
        self.fireTimeHelper.delay = (java_int(weaponProperties:getReloadTime()))
end
java_overload(UnitLayer, "initRangeHack", 0)


-- throws Exception
function UnitLayer:processBuiltTick(allBinaryLayerManager)
        if not self:getHealthInterface():isAlive() then
            if self:isReadyForExplosion() then
                local currentFrame = self.destroyAnimationInterface:getFrame()
                local size = self.destroyAnimationInterface:getSize() - 1
                if currentFrame == size then
                    if not self:getHealthInterface():isAlive() then
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
                self:setReadyForExplosion(true)
            end
        else
            java_super(AdvancedRTSGameLayer, "processBuiltTick", 1)(self, allBinaryLayerManager)
        end
        self.captionAnimationHelper:tick()
        self:getUnitWaypointBehavior():processTick(allBinaryLayerManager)
end
java_overload(UnitLayer, "processBuiltTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function UnitLayer:teleportTo(geographicMapCellPosition)
        local point = geographicMapCellPosition:getMidPoint()
        self:setPosition(point:getX() - self:getHalfWidth(), point:getY() - self:getHalfHeight(), self.z)
end
java_overload(UnitLayer, "teleportTo", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


-- throws Exception
function UnitLayer:getCurrentGeographicMapCellPosition()
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local geographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(self.x + self:getHalfWidth(), self.y + self:getHalfHeight())
        local raceTrackGeographicMap = geographicMapInterface
        if not raceTrackGeographicMap:isValid(geographicMapCellPosition) then
            error(require("java.lang.Exception").new("Position is not really on the map: " .. tostring(geographicMapCellPosition)), 0)
        end
        return geographicMapCellPosition
end
java_overload(UnitLayer, "getCurrentGeographicMapCellPosition", 0)


-- throws Exception
function UnitLayer:fire(layerManager, gameKeyEvent)
        if self.fireTimeHelper:isTimeTNT() then
            self:fireAll(layerManager)
        else
            self:reload()
        end
end
java_overload(UnitLayer, "fire", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) end)


-- throws Exception
function UnitLayer:left()
        self.initResourceAnimation:previousRotation()
        self.decalAnimation:previousRotation()
        self.rotationAnimationInterfaceP:previousRotation()
end
java_overload(UnitLayer, "left", 0)


-- throws Exception
function UnitLayer:right()
        self.initResourceAnimation:nextRotation()
        self.decalAnimation:nextRotation()
        self.rotationAnimationInterfaceP:nextRotation()
end
java_overload(UnitLayer, "right", 0)


function UnitLayer:down()
        local velocityProperties = self:getVehicleProperties():getVelocityProperties()
        if not velocityProperties:isOverXYMaxForwardVelocity() then
            self:accelerate(self.decelerationBasicDecimal)
        end
end
java_overload(UnitLayer, "down", 0)


function UnitLayer:up()
        local velocityProperties = self:getVehicleProperties():getVelocityProperties()
        if not velocityProperties:isOverXYMaxForwardVelocity() then
            self:accelerate(self.accelerationBasicDecimal)
        end
end
java_overload(UnitLayer, "up", 0)


function UnitLayer:initInputProcessors()
        self.inputProcessorArray[Canvas.RIGHT + 1] = SpecialRightGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.LEFT + 1] = SpecialLeftGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM0 + 1] = SpecialFireGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_POUND + 1] = self.inputProcessorArray[Canvas.KEY_NUM0 + 1]
        self.inputProcessorArray[Canvas.DOWN + 1] = SpecialDownGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.UP + 1] = SpecialUpGameInputProcessor.new(self)
        java_super(AdvancedRTSGameLayer, "initInputProcessors", 0)(self)
end
java_overload(UnitLayer, "initInputProcessors", 0)


-- throws Exception
function UnitLayer:processInput(layerManager)
        local list = self:getGameKeyEventList()
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list:get(index)
            local key = GameKeyEventUtil.getKey(anyType)
            self.inputProcessorArray[key + 1]:processEvent(layerManager, GameKeyEvent.NONE)
        end
        list:clear()
        self:groundFriction()
        self:move()
end
java_overload(UnitLayer, "processInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function UnitLayer:accelerate(accelerate)
        self:getVehicleProperties():getVelocityProperties():addVelocityi(accelerate:getUnscaled(), java_int(self.rotationAnimationInterfaceP:getAngleInfoP():getAngle()), 90)
end
java_overload(UnitLayer, "accelerate", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicDecimal")) end)


-- throws Exception
function UnitLayer:fireAll(layerManager)
        local angleInfo = self.rotationAnimationInterfaceP:getAngleInfoP()
        local angle = java_int((angleInfo:getAngle() + self.slightAngle))
        self.hashtable:put(SmallIntegerSingletonFactory.getInstance():getAt(1), SmallIntegerSingletonFactory.getInstance():getAt(java_int(AngleFactory.getInstance():getAt(angle):getValue())))
        local salvoInterface = self:getPartInterfaceArray()[1]
        salvoInterface:process(layerManager, angle, 90)
end
java_overload(UnitLayer, "fireAll", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function UnitLayer:downgrade()
        if self:getLevel() > 1 then
            java_super(AdvancedRTSGameLayer, "downgrade", 0)(self)
        end
end
java_overload(UnitLayer, "downgrade", 0)


function UnitLayer:upgrade()
        java_super(AdvancedRTSGameLayer, "upgrade", 0)(self)
        self:initRangeHack()
end
java_overload(UnitLayer, "upgrade", 0)


function UnitLayer:groundFriction()
        local vehicleFrictionProperties = self:getVehicleProperties():getVehicleFrictionProperties()
        self:getVehicleProperties():getVehicleFrictionProperties():friction(self:getVehicleProperties():getVelocityProperties(), vehicleFrictionProperties:getTireFrictionNominator())
end
java_overload(UnitLayer, "groundFriction", 0)


-- throws Exception
function UnitLayer:trackTo(reason)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        local point = nextUnvisitedPathGeographicMapCellPosition:getMidPoint()
        local dx = (self:getXP() + self:getHalfWidth()) - point:getX()
        local dy = (self:getYP() + self:getHalfHeight()) - point:getY()
        self.rtsLogHelper:trackTo(self, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason)
        self:trackToDXY(dx, dy)
end
java_overload(UnitLayer, "trackTo", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function UnitLayer:trackToDXY(dx, dy)
        local angleOfTarget = 0
        self:trackToDXYTargetAngle(dx, dy, angleOfTarget)
end
java_overload(UnitLayer, "trackToDXY", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function UnitLayer:turnTo(dx, dy, targetAngle)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        local evading = false
        if self:getUnitWaypointBehavior():getSensorAction() == SensorActionFactory.getInstance().EVADE then
            self.rtsLogHelper:evade(self)
            evading = true
            targetAngle = targetAngle + (180)
        end
        local angleInfo = self.rotationAnimationInterfaceP:getAngleInfoP()
        local angle = FrameUtil.getInstance():adjustAngleToFrameAngle(angleInfo:getAngle() - 270)
        self.rtsLogHelper:turnTo(self, dx, dy, angleInfo, angle, self.movementAngle, evading, targetAngle)
        local gameKeyEventFactory = GameKeyEventFactory.getInstance()
        if dx == 0 and dy == 0 then
            self.rtsLogHelper:doneMoving(self)
            return true
        elseif (java_int(self.movementAngle:getValue())) == angle then
            if dx > 0 and self.movementAngle == self.angleFactory.LEFT then
                self.rtsLogHelper:movingLeft(self)
                return false
            end
            if dx < 0 and self.movementAngle == self.angleFactory.RIGHT then
                self.rtsLogHelper:movingRight(self)
                return false
            end
            if dy > 0 and self.movementAngle == self.angleFactory.UP then
                self.rtsLogHelper:movingUp(self)
                return false
            end
            if dy < 0 and self.movementAngle == self.angleFactory.DOWN then
                self.rtsLogHelper:movingDown(self)
                return false
            end
            self.rtsLogHelper:currentMoveEnded(self)
            if self.movementAngle == self.angleFactory.LEFT or self.movementAngle == self.angleFactory.RIGHT then
                self:handleDeltalY(dx, dy)
            elseif self.movementAngle == self.angleFactory.UP or self.movementAngle == self.angleFactory.DOWN then
                self:handleDeltalX(dx, dy)
            end
            return true
        else
            if nextUnvisitedPathGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
                if self.steeringInsideGeographicMapCellPosition ~= nextUnvisitedPathGeographicMapCellPosition then
                    if math.abs(dx) > math.abs(dy) and dy ~= 0 then
                        self:handleDeltalY(dx, dy)
                    elseif dx ~= 0 then
                        self:handleDeltalX(dx, dy)
                    else
                        self:handleDeltalY(dx, dy)
                    end
                end
                local deltaAngle2 = self.movementAngle:getValue() - angle
                if deltaAngle2 > 0 then
                    self.rtsLogHelper:rotateRight(self)
                    self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                else
                    self.rtsLogHelper:rotateLeft(self)
                    self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                end
                return true
            else
                self.rtsLogHelper:noRotation(self)
            end
            return false
        end
end
java_overload(UnitLayer, "turnTo", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function UnitLayer:handleDeltalX(dx, dy)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        if dx > 0 then
            self.movementAngle = self.angleFactory.LEFT
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        else
            self.movementAngle = self.angleFactory.RIGHT
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        end
        self.rtsLogHelper:handle(self, self.movementAngle)
end
java_overload(UnitLayer, "handleDeltalX", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function UnitLayer:handleDeltalY(dx, dy)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        if dy > 0 then
            self.movementAngle = self.angleFactory.UP
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        else
            self.movementAngle = self.angleFactory.DOWN
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        end
        self.rtsLogHelper:handle(self, self.movementAngle)
end
java_overload(UnitLayer, "handleDeltalY", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function UnitLayer:trackToDXYTargetAngle(dx, dy, targetAngle)
        local list = self:getUnitWaypointBehavior():getSteeringVisitorList()
        if list:size() > 0 then
            for index = list:size() - 1, 0, -1 do
                local steeringVisitor = list:get(index)
                local anyType = steeringVisitor:visit(self)
                if anyType == nil then
                    list:removeAt(index)
                end
            end
            self:fireOrMove()
        elseif not self:turnTo(dx, dy, targetAngle) then
            self:fireOrMove()
        end
end
java_overload(UnitLayer, "trackToDXYTargetAngle", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


-- throws Exception
function UnitLayer:fireOrMove()
        local gameKeyEventFactory = GameKeyEventFactory.getInstance()
        if self:getUnitWaypointBehavior():needToMove() then
            self.rtsLayer2LogHelper:steeringUp(self)
            if self.showMoreCaptionStates and not self.captionAnimationHelper:isShowing() then
                self.captionAnimationHelper:update(UnitLayer.MOVE, self.basicColorFactory.GREEN)
            end
            self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.UP))
        else
            self.captionAnimationHelper:update(CommonPhoneStrings.getInstance().FIRE, self.basicColorFactory.RED)
            self.rtsLayer2LogHelper:steeringFireOrStop(self)
            self:allStop()
            self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.KEY_NUM0))
            TrackingEventHandler.getInstance():fireEvent(self:getTrackingEvent())
        end
end
java_overload(UnitLayer, "fireOrMove", 0)


function UnitLayer:move()
        local try_ok, try_error, try_value = pcall(function()
            local velocityProperties = self:getVehicleProperties():getVelocityProperties()
            local velocityXScaled = java_int(velocityProperties:getVelocityXBasicDecimalP():getScaled())
            local velocityYScaled = java_int(velocityProperties:getVelocityYBasicDecimalP():getScaled())
            self:getUnitWaypointBehavior():move()
            if velocityXScaled ~= 0 or velocityYScaled ~= 0 then
                self:getUnitWaypointBehavior():setMoving(true)
                local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
                local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
                self.layerPartialCellPositionsUtil:getAllDXY(geographicMapInterface, self, velocityXScaled, velocityYScaled, UnitLayer.getPartialpositionlist())
                local cellPosition = DropCellPositionHistory.getInstance():getCellPositionWithDrop(UnitLayer.getPartialpositionlist())
                if cellPosition == self.cellPositionFactory.NONE then
                    local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
                    local tiledLayerUtil = TiledLayerUtil.getInstance()
                    local x = self.x + velocityXScaled
                    local y = self.y + velocityYScaled
                    x = tiledLayerUtil:keepOnMapX(tiledLayer, x, self:getWidth())
                    y = tiledLayerUtil:keepOnMapY(tiledLayer, y, self:getHeight())
                    self:setPosition(x, y, self.z)
                else
                    local allbinaryLayer = DropCellPositionHistory.getInstance():getLayerInterface(cellPosition)
                    self:getUnitWaypointBehavior():setMovingFromStopped(false)
                    self:getUnitWaypointBehavior():addBuildingChase(allbinaryLayer, cellPosition)
                end
            end
            if self:getUnitWaypointBehavior():isMoving() then
                TrackingEventHandler.getInstance():fireEvent(self:getTrackingEvent())
            else
                self:getUnitWaypointBehavior():setMovingFromStopped(false)
            end
            if self:getUnitWaypointBehavior():isMovingFromStopped() and self:isVisible() then
                SecondaryPlayerQueueFactory.getInstance():add(self.moveSoundInterface)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "move", e)
        end
end
java_overload(UnitLayer, "move", 0)


function UnitLayer:allStop()
        local velocityProperties = self:getVehicleProperties():getVelocityProperties()
        velocityProperties:getVelocityXBasicDecimalP():setint(0)
        velocityProperties:getVelocityYBasicDecimalP():setint(0)
end
java_overload(UnitLayer, "allStop", 0)


function UnitLayer:paint(graphics)
        if self:isVisible() then
            java_super(AdvancedRTSGameLayer, "paint", 1)(self, graphics)
            local viewPosition = self:getViewPosition()
            local viewX = viewPosition:getX()
            local viewY = viewPosition:getY()
            self.decalAnimation:paintXY(graphics, viewX, viewY)
            self.rangeAnimation:paintXY(graphics, viewX, viewY)
            self.sensorRangeAnimation:paintXY(graphics, viewX, viewY)
            self.damageFloatersPaintableInterface:paint(graphics)
            self.healthBar:paint(graphics)
            self.captionAnimationHelper:paintXY(graphics, viewX, viewY)
            self.pathAnimation:paintXY(graphics, viewX, viewY)
            self.resourceAnimation:paintXY(graphics, viewX, viewY)
        end
end
java_overload(UnitLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function UnitLayer:onBuildingEvent(event)
        local buildingLayer = event:getRtsLayer()
        self:getUnitWaypointBehavior():moveAwayFromBuilding(buildingLayer)
end
java_overload(UnitLayer, "onBuildingEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayerEvent")) end)


function UnitLayer:getVehicleProperties()
        return self.vehicleProperties
end
java_overload(UnitLayer, "getVehicleProperties", 0)


-- throws Exception
function UnitLayer:damage(damage, damageType)
        java_super(AdvancedRTSGameLayer, "damage", 2)(self, damage, damageType)
        self.damageFloaters:add(damage)
        if damage > 0 then
            self:getHealthInterface():damage(damage)
        end
end
java_overload(UnitLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function UnitLayer:getDamage(damageType)
        return 0
end
java_overload(UnitLayer, "getDamage", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function UnitLayer:setDestroyed(destroyed)
        self.logUtil:putF(self.commonStrings.START, self, "setDestroyed")
        java_super(AdvancedRTSGameLayer, "setDestroyed", 1)(self, destroyed)
        if self:isDestroyed() then
            WaypointEventHandlerFactory.getInstance(self:getGroupInterface()[1]):removeListener(self:getUnitWaypointBehavior())
            TrackingEventHandler.getInstance():removeListener(self)
            BuildingEventHandler.getInstance():removeListener(self)
            if not self:getHealthInterface():isAlive() then
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
java_overload(UnitLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function UnitLayer:getLoad()
        return self.resourceLoad
end
java_overload(UnitLayer, "getLoad", 0)


-- throws Exception
function UnitLayer:clearResourceAnimation()
        self.resourceAnimation = NullIndexedAnimationFactory.getFactoryInstance():getInstance(0)
end
java_overload(UnitLayer, "clearResourceAnimation", 0)


-- throws Exception
function UnitLayer:setLoad(resource)
        if resource > 0 then
            self.resourceAnimation = self.initResourceAnimation
        else
            self:clearResourceAnimation()
        end
        self.resourceLoad = resource
end
java_overload(UnitLayer, "setLoad", 1, function(java_a1) return true and type(java_a1) == "number" end)


function UnitLayer:addLoad(resource)
        self.resourceLoad = self.resourceLoad + (resource)
end
java_overload(UnitLayer, "addLoad", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function UnitLayer:handleCost(ownerLayer)
        if self:getLoad() > 0 then
            self.CAPITAL_EVENT:setValue(self:getLoad())
            CapitalEventHandlerFactory.getInstance(ownerLayer:getGroupInterface()[1]):fireEvent(self.CAPITAL_EVENT)
            self:setLoad(0)
        end
end
java_overload(UnitLayer, "handleCost", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function UnitLayer:createHudPaintable()
        local rtsLayerHudPaintable = RTSLayerHudPaintable.getInstance()
        rtsLayerHudPaintable:setBasicColorP(self.allBinaryGameLayerManagerP:getForegroundBasicColor())
        rtsLayerHudPaintable:setRtsLayer(self)
        return rtsLayerHudPaintable
end
java_overload(UnitLayer, "createHudPaintable", 0)


function UnitLayer:getHudPaintable()
        local rtsLayerHudPaintable = RTSLayerHudPaintable.getInstance()
        return rtsLayerHudPaintable
end
java_overload(UnitLayer, "getHudPaintable", 0)


function UnitLayer:getType()
        return 1
end
java_overload(UnitLayer, "getType", 0)


function UnitLayer.getStaticType()
        return 1
end


function UnitLayer:getUnitWaypointBehavior()
        return self:getWaypointBehavior()
end
java_overload(UnitLayer, "getUnitWaypointBehavior", 0)


function UnitLayer:getTrackingEvent()
        return self.trackingEvent
end
java_overload(UnitLayer, "getTrackingEvent", 0)


function UnitLayer:getCaptionAnimationHelper()
        return self.captionAnimationHelper
end
java_overload(UnitLayer, "getCaptionAnimationHelper", 0)


function UnitLayer:isSelfUpgradeable()
        return false
end
java_overload(UnitLayer, "isSelfUpgradeable", 0)


function UnitLayer:getMaxResourceLoad()
        return self.maxResourceLoad
end
java_overload(UnitLayer, "getMaxResourceLoad", 0)


function UnitLayer.getPartialpositionlist()
        return UnitLayer.partialPositionList
end

UnitLayer.partialPositionList = BasicArrayListS.new(4)
UnitLayer.SENSOR_RANGE_MULTIPLIER = 6
UnitLayer.MOVE = "Moving"

return UnitLayer

