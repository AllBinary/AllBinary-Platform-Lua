-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

local RTSLayer = {}
package.loaded["org.allbinary.game.layer.RTSLayer"] = RTSLayer

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RTSFormInput = java_lazy("org.allbinary.game.input.form.RTSFormInput")
local MultiPlayerGameLayer = require("org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = java_lazy("org.allbinary.animation.NullIndexedAnimationFactory")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local RotationAnimation = java_lazy("org.allbinary.animation.RotationAnimation")
local CaptionAnimationHelperBase = java_lazy("org.allbinary.animation.caption.CaptionAnimationHelperBase")
local DestroyedLayerProcessor = java_lazy("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local Health = java_lazy("org.allbinary.game.health.Health")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GroupFactory = java_lazy("org.allbinary.game.identification.GroupFactory")
local GameInputInterface = java_lazy("org.allbinary.game.input.GameInputInterface")
local GameInputProcessor = java_lazy("org.allbinary.game.input.GameInputProcessor")
local GameInputProcessorUtil = java_lazy("org.allbinary.game.input.GameInputProcessorUtil")
local GameKeyEventSourceInterface = java_lazy("org.allbinary.game.input.GameKeyEventSourceInterface")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local NullRTSFormInputFactory = java_lazy("org.allbinary.game.input.form.NullRTSFormInputFactory")
local Waypoint2LogHelper = java_lazy("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")
local WaypointLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointLogHelper")
local WaypointRunnableLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")
local TickableInterface = java_lazy("org.allbinary.game.tick.TickableInterface")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local TileLayerPositionIntoViewPosition = java_lazy("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ViewPositionEventHandler = java_lazy("org.allbinary.view.event.ViewPositionEventHandler")
local RemoteInfo = java_lazy("org.allbinary.game.multiplayer.layer.RemoteInfo")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LayerDistanceUtil = java_lazy("org.allbinary.math.LayerDistanceUtil")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local RTSInterface = require("org.allbinary.game.layer.RTSInterface")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local GeographicMapCellPositionArea = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionArea")
local GeographicMapCellPositionAreaBase = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local RTSLayer2LogHelper = java_lazy("org.allbinary.game.layer.RTSLayer2LogHelper")
local RTSLayerUtil = java_lazy("org.allbinary.game.layer.RTSLayerUtil")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local SelectionHudPaintable = java_lazy("org.allbinary.game.layer.SelectionHudPaintable")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")

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

-- class table RTSLayer is declared before the requires
RTSLayer.__index = RTSLayer
RTSLayer.className = "RTSLayer"
RTSLayer.javaClassName = "org.allbinary.game.layer.RTSLayer"
setmetatable(RTSLayer, {__index = MultiPlayerGameLayer})
RTSLayer.java_implements = " TickableInterface GameInputInterface GameKeyEventSourceInterface RTSInterface PathFindingLayerInterface "
RTSLayer.java_interfaces = function() return {TickableInterface, GameInputInterface, GameKeyEventSourceInterface, RTSInterface, PathFindingLayerInterface} end

function RTSLayer:_init_fields()
    self.debug_f = true
    self.showMoreCaptionStates = self.debug_f
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.rtsLayer2LogHelper = RTSLayer2LogHelper.getInstance()
    self.waypointLogHelperP = WaypointLogHelper.getInstance()
    self.waypoint2LogHelperP = Waypoint2LogHelper.getInstance()
    self.waypointRunnableLogHelperP = WaypointRunnableLogHelper.getInstance()
    if self.rtsFormInput == nil then self.rtsFormInput = nil end
    if self.verticleBuildAnimationInterface == nil then self.verticleBuildAnimationInterface = nil end
    if self.rangeAnimation == nil then self.rangeAnimation = nil end
    if self.initRangeAnimation == nil then self.initRangeAnimation = nil end
    if self.sensorRangeAnimation == nil then self.sensorRangeAnimation = nil end
    if self.initSensorRangeAnimation == nil then self.initSensorRangeAnimation = nil end
    if self.baseAnimationInterface == nil then self.baseAnimationInterface = nil end
    self.buildFrameTimeHelper = TimeDelayHelper.new(50)
    if self.buildAnimationInterface == nil then self.buildAnimationInterface = nil end
    if self.animationInterface == nil then self.animationInterface = nil end
    if self.initAnimationInterface == nil then self.initAnimationInterface = nil end
    if self.indexedButShouldBeRotationAnimationInterface == nil then self.indexedButShouldBeRotationAnimationInterface = nil end
    if self.emptyAnimationInterface == nil then self.emptyAnimationInterface = nil end
    if self.destroyAnimationInterface == nil then self.destroyAnimationInterface = nil end
    self.fireTimeHelper = TimeDelayHelper.new(700)
    if self.rootName == nil then self.rootName = nil end
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.BUILD_VALUE = 63
    if self.geographicMapCellPositionAreaBase == nil then self.geographicMapCellPositionAreaBase = nil end
    self.healthInterface = Health.NULL_HEALTH
    self.level = 1
    self.maxLevel = 1
    self.hackVerticleBuild = self.BUILD_VALUE
    self.slightAngle = 0
    if self.percentCompleteP == nil then self.percentCompleteP = 0 end
    self.destroyed = false
    self.selected = false
    self.rtsLayerUtil = RTSLayerUtil.getInstance()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
end


-- throws Exception
function RTSLayer.createSimulatedInstance(remoteInfo)
        local nullAnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance()
        local nullIndexedAnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance()
        return RTSLayer.new(RemoteInfo.REMOTE_INFO, GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0, TileLayerPositionIntoViewPosition.new())
end


function RTSLayer._jinit(self, remoteInfo, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition)
    java_super_init(MultiPlayerGameLayer, self, remoteInfo, groupInterface, name, rectangle, viewPosition)
    RTSLayer._init_fields(self)
        -- super(...) made self above
        self:initInputProcessors()
        self.rootName = rootName
        self.healthInterface = healthInterface
        self.rtsFormInput = rtsFormInput
        self:setPosition(x, y, self.z)
        self.verticleBuildAnimationInterface = verticleBuildAnimationInterfaceFactoryInterface:getInstance(0)
        self.buildAnimationInterface = buildAnimationInterfaceFactoryInterface:getInstance(0)
        self.baseAnimationInterface = baseAnimationInterfaceFactoryInterface:getInstance(0)
        self.emptyAnimationInterface = emptyAnimationInterfaceFactoryInterface:getInstance(0)
        self.indexedButShouldBeRotationAnimationInterface = animationInterfaceFactoryInterface:getInstance(0)
        self.initAnimationInterface = self.indexedButShouldBeRotationAnimationInterface
        self.destroyAnimationInterface = proceduralAnimationInterfaceFactoryInterface:getInstanceAnimation(self.indexedButShouldBeRotationAnimationInterface)
        local animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        self.rangeAnimation = animation
        self.initRangeAnimation = animation
        self.sensorRangeAnimation = animation
        self.initSensorRangeAnimation = animation
        self.animationInterface = self.initAnimationInterface
        self.geographicMapCellPositionAreaBase = GeographicMapCellPositionArea.new(self)
    return self
end

function RTSLayer.new(...)
    local self = setmetatable({}, RTSLayer)
    RTSLayer._jinit(self, ...)
    return self
end


-- throws Exception
function RTSLayer:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(MultiPlayerGameLayer, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local viewPosition2 = self:getViewPosition()
        viewPosition2:setTiledLayer(tiledLayer)
        self:updateWaypointBehavior(geographicMapInterface)
end
java_overload(RTSLayer, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function RTSLayer:updateWaypointBehavior(geographicMapInterface)
        self.geographicMapCellPositionAreaBase:update(geographicMapInterface)
end
java_overload(RTSLayer, "updateWaypointBehavior", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) end)


-- throws Exception
function RTSLayer:construct(rtsPlayerLayerInterface)
        ViewPositionEventHandler.getInstance():addListener(self)
        self.animationInterface = self.buildAnimationInterface
        self.hackVerticleBuild = 0
end
java_overload(RTSLayer, "construct", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) end)


function RTSLayer:select()
        self.rangeAnimation = self.initRangeAnimation
        self.sensorRangeAnimation = self.initSensorRangeAnimation
        self:setSelected(true)
end
java_overload(RTSLayer, "select", 0)


function RTSLayer:deselect()
        local animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        self.rangeAnimation = animation
        self.sensorRangeAnimation = animation
        self:setSelected(false)
end
java_overload(RTSLayer, "deselect", 0)


function RTSLayer:setSelected(selected)
        self.selected = selected
end
java_overload(RTSLayer, "setSelected", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function RTSLayer:isSelected()
        return self.selected
end
java_overload(RTSLayer, "isSelected", 0)


function RTSLayer:getPercentComplete()
        return self.percentCompleteP
end
java_overload(RTSLayer, "getPercentComplete", 0)


function RTSLayer:getScrollSelectionForm()
        return ScrollSelectionForm.getNullScrollSelectionForm()
end
java_overload(RTSLayer, "getScrollSelectionForm", 0)


function RTSLayer:initInputProcessors()
        GameInputProcessorUtil.init(self.inputProcessorArray)
end
java_overload(RTSLayer, "initInputProcessors", 0)


-- throws Exception
function RTSLayer:processBuiltTick(allBinaryLayerManager)
        self.animationInterface = self.indexedButShouldBeRotationAnimationInterface
end
java_overload(RTSLayer, "processBuiltTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function RTSLayer:processTick(allBinaryLayerManager)
        local try_ok, try_error, try_value = pcall(function()
            if self:isCompleted() then
                self:processBuiltTick(allBinaryLayerManager)
            else
                self:build()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "processTick", e)
        end
end
java_overload(RTSLayer, "processTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


-- throws Exception
function RTSLayer:processInput(layerManager)
end
java_overload(RTSLayer, "processInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function RTSLayer:reload()
end
java_overload(RTSLayer, "reload", 0)


function RTSLayer:onMovement(trackingEvent)
end
java_overload(RTSLayer, "onMovement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TrackingEvent")) end)


-- throws Exception
function RTSLayer:onMovementFound(trackingEvent)
end
java_overload(RTSLayer, "onMovementFound", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TrackingEvent")) end)


function RTSLayer:paint(graphics)
        java_super(MultiPlayerGameLayer, "paintFirst", 1)(self, graphics)
        local viewPosition = self:getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self:getAnimationInterface():paintXY(graphics, viewX, viewY)
end
java_overload(RTSLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function RTSLayer:damage(damage, damageType)
end
java_overload(RTSLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function RTSLayer:getSourceId()
        return RTSLayer.id
end
java_overload(RTSLayer, "getSourceId", 0)


function RTSLayer:downgrade()
        self.rtsLayerUtil:downgrade(self)
end
java_overload(RTSLayer, "downgrade", 0)


function RTSLayer:upgrade()
        self.rtsLayerUtil:upgrade(self)
end
java_overload(RTSLayer, "upgrade", 0)


function RTSLayer:isCompleted()
        if self.hackVerticleBuild < self.BUILD_VALUE then
            return false
        else
            return true
        end
end
java_overload(RTSLayer, "isCompleted", 0)


-- throws Exception
function RTSLayer:build()
        if self.buildFrameTimeHelper:isTimeTNT() then
            self.animationInterface = self.buildAnimationInterface
            self.verticleBuildAnimationInterface:nextFrame()
            self.hackVerticleBuild = self.hackVerticleBuild + 1
        end
        self.percentCompleteP = java_idiv(100 * self.hackVerticleBuild, self.BUILD_VALUE)
        self:getHudPaintable():updateInfo()
end
java_overload(RTSLayer, "build", 0)


function RTSLayer:isSelfUpgradeable()
        return true
end
java_overload(RTSLayer, "isSelfUpgradeable", 0)


function RTSLayer:getCost()
        return self.rtsLayerUtil:getCost(self)
end
java_overload(RTSLayer, "getCost", 0)


function RTSLayer:getDowngradeCost()
        return self.rtsLayerUtil:getDowngradeCost(self)
end
java_overload(RTSLayer, "getDowngradeCost", 0)


function RTSLayer:getUpgradeCost()
        return self.rtsLayerUtil:getUpgradeCost(self)
end
java_overload(RTSLayer, "getUpgradeCost", 0)


function RTSLayer:isUpgradeable()
        if self:getLevel() < self:getMaxLevel() then
            return true
        else
            return false
        end
end
java_overload(RTSLayer, "isUpgradeable", 0)


function RTSLayer:isDowngradeable()
        if self:getLevel() > 1 then
            return true
        else
            return false
        end
end
java_overload(RTSLayer, "isDowngradeable", 0)


function RTSLayer:getLevel()
        return self.level
end
java_overload(RTSLayer, "getLevel", 0)


function RTSLayer:setLevel(level)
        self.level = level
end
java_overload(RTSLayer, "setLevel", 1, function(java_a1) return true and type(java_a1) == "number" end)


function RTSLayer:getVerticleBuildAnimationInterface()
        return self.verticleBuildAnimationInterface
end
java_overload(RTSLayer, "getVerticleBuildAnimationInterface", 0)


function RTSLayer:getAnimationInterface()
        return self.animationInterface
end
java_overload(RTSLayer, "getAnimationInterface", 0)


function RTSLayer:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end
java_overload(RTSLayer, "setAnimationInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Animation")) end)


-- throws Exception
function RTSLayer:setTarget(targetGameLayer)
        local anotherTargetDistance = self.layerDistanceUtil:getDistance(self, targetGameLayer)
        local waypointBehaviorBase = self:getWaypointBehavior()
        waypointBehaviorBase:setTargetWithDistance(targetGameLayer, anotherTargetDistance)
end
java_overload(RTSLayer, "setTarget", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayer:createHudPaintable()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "createHudPaintable", 0)


function RTSLayer:getHudPaintable()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getHudPaintable", 0)


function RTSLayer:getMaxLevel()
        return self.maxLevel
end
java_overload(RTSLayer, "getMaxLevel", 0)


function RTSLayer:setMaxLevel(maxLevel)
        self.maxLevel = maxLevel
end
java_overload(RTSLayer, "setMaxLevel", 1, function(java_a1) return true and type(java_a1) == "number" end)


function RTSLayer:getHealthInterface()
        return self.healthInterface
end
java_overload(RTSLayer, "getHealthInterface", 0)


function RTSLayer:setHealthInterface(healthInterface)
        self.healthInterface = healthInterface
end
java_overload(RTSLayer, "setHealthInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Health")) end)


function RTSLayer:getRTSFormInput()
        return self.rtsFormInput
end
java_overload(RTSLayer, "getRTSFormInput", 0)


-- throws Exception
function RTSLayer:isDestroyed()
        return self.destroyed
end
java_overload(RTSLayer, "isDestroyed", 0)


-- throws Exception
function RTSLayer:setDestroyed(destroyed)
        self.destroyed = destroyed
        if self:isDestroyed() then
            DestroyedLayerProcessor.getInstance():add(self)
            ViewPositionEventHandler.getInstance():removeListener(self)
        end
end
java_overload(RTSLayer, "setDestroyed", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function RTSLayer:getEndGeographicMapCellPositionList()
        return self.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
end
java_overload(RTSLayer, "getEndGeographicMapCellPositionList", 0)


function RTSLayer:getGeographicMapCellPositionArea()
        return self.geographicMapCellPositionAreaBase
end
java_overload(RTSLayer, "getGeographicMapCellPositionArea", 0)


function RTSLayer:shouldHandleStartSameAsEnd()
        return true
end
java_overload(RTSLayer, "shouldHandleStartSameAsEnd", 0)


-- throws Exception
function RTSLayer:handleCost(ownerLayer)
end
java_overload(RTSLayer, "handleCost", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function RTSLayer:getWaypointBehavior()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getWaypointBehavior", 0)


function RTSLayer:getParentLayer()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getParentLayer", 0)


function RTSLayer:getRTSLayer2LogHelper()
        return self.rtsLayer2LogHelper
end
java_overload(RTSLayer, "getRTSLayer2LogHelper", 0)


function RTSLayer:getWaypointLogHelper()
        return self.waypointLogHelperP
end
java_overload(RTSLayer, "getWaypointLogHelper", 0)


function RTSLayer:getWaypoint2LogHelper()
        return self.waypoint2LogHelperP
end
java_overload(RTSLayer, "getWaypoint2LogHelper", 0)


function RTSLayer:getWaypointRunnableLogHelper()
        return self.waypointRunnableLogHelperP
end
java_overload(RTSLayer, "getWaypointRunnableLogHelper", 0)


function RTSLayer:shouldAddWaypointFromBuilding()
        return false
end
java_overload(RTSLayer, "shouldAddWaypointFromBuilding", 0)


function RTSLayer:getCaptionAnimationHelper()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getCaptionAnimationHelper", 0)


function RTSLayer:isShowMoreCaptionStates()
        return self.showMoreCaptionStates
end
java_overload(RTSLayer, "isShowMoreCaptionStates", 0)


-- throws Exception
function RTSLayer:init(geographicMapCellHistory, geographicMapCellPositionBasicArrayList)
end
java_overload(RTSLayer, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellHistory")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) end)


-- throws Exception
function RTSLayer:getCurrentGeographicMapCellPosition()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getCurrentGeographicMapCellPosition", 0)


-- throws Exception
function RTSLayer:getTopLeftGeographicMapCellPosition()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getTopLeftGeographicMapCellPosition", 0)


function RTSLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getMoveOutOfBuildAreaPath", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


-- throws Exception
function RTSLayer:setClosestGeographicMapCellHistory(pathsList)
end
java_overload(RTSLayer, "setClosestGeographicMapCellHistory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function RTSLayer:teleportTo(geographicMapCellPosition)
end
java_overload(RTSLayer, "teleportTo", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


-- throws Exception
function RTSLayer:setLoad(resource)
end
java_overload(RTSLayer, "setLoad", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function RTSLayer:getSurroundingGeographicMapCellPositionList()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getSurroundingGeographicMapCellPositionList", 0)


-- throws Exception
function RTSLayer:trackTo(reason)
end
java_overload(RTSLayer, "trackTo", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function RTSLayer:trackToDXY(dx, dy)
end
java_overload(RTSLayer, "trackToDXY", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function RTSLayer:isWaypointListEmptyOrOnlyTargets()
        return false
end
java_overload(RTSLayer, "isWaypointListEmptyOrOnlyTargets", 0)


function RTSLayer:getTrackingEvent()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(RTSLayer, "getTrackingEvent", 0)


-- throws Exception
function RTSLayer:buildingChase(allbinaryLayer, cellPosition)
        return false
end
java_overload(RTSLayer, "buildingChase", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


function RTSLayer:allStop()
end
java_overload(RTSLayer, "allStop", 0)


function RTSLayer.getMinStaticType()
        return 1
end


function RTSLayer.getMaxStaticType()
        return 4
end


function RTSLayer.isRTSLayer(layerInterface)
        if layerInterface:getType() >= RTSLayer.getMinStaticType() and layerInterface:getType() <= RTSLayer.getMaxStaticType() then
            return true
        end
        return false
end


function RTSLayer:implmentsTickableInterface()
        return true
end
java_overload(RTSLayer, "implmentsTickableInterface", 0)


function RTSLayer:implmentsGameInputInterface()
        return true
end
java_overload(RTSLayer, "implmentsGameInputInterface", 0)


function RTSLayer:getRootName()
        return self.rootName
end
java_overload(RTSLayer, "getRootName", 0)


function RTSLayer:getRotationAnimationInterface()
        return self.indexedButShouldBeRotationAnimationInterface
end
java_overload(RTSLayer, "getRotationAnimationInterface", 0)


function RTSLayer:setFrame(index)
        self:getRotationAnimationInterface():setFrame(index)
end
java_overload(RTSLayer, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function RTSLayer:setRotationAnimationInterface(rotationAnimationInterface)
        self.indexedButShouldBeRotationAnimationInterface = rotationAnimationInterface
end
java_overload(RTSLayer, "setRotationAnimationInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RotationAnimation")) end)

RTSLayer.id = 0
RTSLayer.MAIN_INDEX = 0
RTSLayer.SECONDARY_INDEX = 1

return RTSLayer

