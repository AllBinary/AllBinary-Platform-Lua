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

local UnitWaypointBehavior2 = {}
package.loaded["org.allbinary.game.layer.unit.UnitWaypointBehavior2"] = UnitWaypointBehavior2

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

local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local SteeringVisitor = require("org.allbinary.game.layer.SteeringVisitor")
local AdvancedRTSGameLayer = java_lazy("org.allbinary.game.layer.AdvancedRTSGameLayer")
local MultipassWaypointPathRunnable = java_lazy("org.allbinary.game.layer.MultipassWaypointPathRunnable")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local WaypointPathRunnable = java_lazy("org.allbinary.game.layer.WaypointPathRunnable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointPathRunnableBase = java_lazy("org.allbinary.game.layer.WaypointPathRunnableBase")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local WaypointBase = java_lazy("org.allbinary.game.layer.waypoint.WaypointBase")
local TrackingEventHandler = java_lazy("org.allbinary.game.tracking.TrackingEventHandler")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local LayerDistanceUtil = java_lazy("org.allbinary.math.LayerDistanceUtil")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local PathFindingThreadPool = java_lazy("org.allbinary.thread.PathFindingThreadPool")
local ThreadPool = java_lazy("org.allbinary.thread.ThreadPool")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local UnitWaypointBehavior = require("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local UnitLayer = java_lazy("org.allbinary.game.layer.unit.UnitLayer")
local UnitWaypointStrings = java_lazy("org.allbinary.game.layer.unit.UnitWaypointStrings")

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

-- class table UnitWaypointBehavior2 is declared before the requires
UnitWaypointBehavior2.__index = UnitWaypointBehavior2
UnitWaypointBehavior2.className = "UnitWaypointBehavior2"
UnitWaypointBehavior2.javaClassName = "org.allbinary.game.layer.unit.UnitWaypointBehavior2"
setmetatable(UnitWaypointBehavior2, {__index = UnitWaypointBehavior})
local BuildingSteeringVisitor = {}
    BuildingSteeringVisitor.__index = BuildingSteeringVisitor
    BuildingSteeringVisitor.className = "BuildingSteeringVisitor"
    BuildingSteeringVisitor.javaClassName = "org.allbinary.game.layer.unit.UnitWaypointBehavior2$BuildingSteeringVisitor"
    setmetatable(BuildingSteeringVisitor, {__index = SteeringVisitor})
    UnitWaypointBehavior2.BuildingSteeringVisitor = BuildingSteeringVisitor

    function BuildingSteeringVisitor:_init_fields()
        self.positionList = BasicArrayListD.new()
    end

    function BuildingSteeringVisitor._jinit(self)
        java_super_init(SteeringVisitor, self)
        BuildingSteeringVisitor._init_fields(self)
        return self
    end

    function BuildingSteeringVisitor.new()
        return BuildingSteeringVisitor._jinit(setmetatable({}, BuildingSteeringVisitor))
    end
    function BuildingSteeringVisitor.newEnclosed(outer)
        return BuildingSteeringVisitor._jinit(setmetatable({__javaOuter = outer}, BuildingSteeringVisitor))
    end
    

    function BuildingSteeringVisitor:visit(anyType)
            local logUtil = LogUtil.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                if self:getList():size() > 0 then
                    local allbinaryLayer = self:getList():get(0)
                    local cellPosition = self:getPositionList():get(0)
                    local clear = self.__javaOuter:buildingChase(allbinaryLayer, cellPosition)
                    if clear then
                        self:getList():clear()
                        self.positionList:clear()
                        do return "__jreturn", NullUtil.getInstance().NULL_OBJECT end
                    end
                    do return "__jreturn", BooleanFactory.getInstance().FALSE end
                end
                do return "__jreturn", NullUtil.getInstance().NULL_OBJECT end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, "visit", e)
                return NullUtil.getInstance().NULL_OBJECT
            end
            if try_ok and try_error == "__jreturn" then return try_value end
    end
    java_overload(BuildingSteeringVisitor, "visit", 1)
    

    function BuildingSteeringVisitor:getPositionList()
            return self.positionList
    end
    java_overload(BuildingSteeringVisitor, "getPositionList", 0)


function UnitWaypointBehavior2:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.unitWaypointStrings = UnitWaypointStrings.getInstance()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
    self.pathFindingThreadPool = PathFindingThreadPool.getInstance()
    if self.progressTimeDelayHelper == nil then self.progressTimeDelayHelper = nil end
    if self.wanderPathsList == nil then self.wanderPathsList = nil end
    if self.waypointPathRunnable == nil then self.waypointPathRunnable = nil end
    self.sensorRange = 0
    self.closeRange = 0
    self.nextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.afterNextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    if self.waitingOnTargetPath == nil then self.waitingOnTargetPath = false end
    if self.waitingOnWaypointPath == nil then self.waitingOnWaypointPath = false end
    self.targetWithoutCachedPathLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance()
    self.buildingSteeringVisitor = BuildingSteeringVisitor.newEnclosed(self)
end


function UnitWaypointBehavior2._jinit(self, ownerAdvancedRTSGameLayer, fakeWaypoint)
    java_super_init(UnitWaypointBehavior, self, ownerAdvancedRTSGameLayer, fakeWaypoint)
    UnitWaypointBehavior2._init_fields(self)
        -- super(...) made self above
        self.progressTimeDelayHelper = TimeDelayHelper.new(5000)
        self.wanderPathsList = BasicArrayListD.new()
        local features = Features.getInstance()
        self.waypointPathRunnable = (function() if J2MEUtil.isHTML() then return MultipassWaypointPathRunnable.new() else return WaypointPathRunnable.new() end end)()
    return self
end

function UnitWaypointBehavior2.new(...)
    local self = setmetatable({}, UnitWaypointBehavior2)
    UnitWaypointBehavior2._jinit(self, ...)
    return self
end


function UnitWaypointBehavior2:initRange(weaponRange)
        java_super(UnitWaypointBehavior, "initRange", 1)(self, weaponRange)
        self.closeRange = weaponRange
        self.sensorRange = weaponRange * 4
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:initRange(self.associatedAdvancedRTSGameLayer, self.closeRange, self.sensorRange)
end
java_overload(UnitWaypointBehavior2, "initRange", 1, function(java_a1) return true and type(java_a1) == "number" end)


function UnitWaypointBehavior2:getNextUnvisitedPathGeographicMapCellPosition()
        return self.nextUnvisitedPathGeographicMapCellPosition
end
java_overload(UnitWaypointBehavior2, "getNextUnvisitedPathGeographicMapCellPosition", 0)


function UnitWaypointBehavior2:isRunning()
        if self.waypointPathRunnable:isRunning() then
            return true
        else
            return false
        end
end
java_overload(UnitWaypointBehavior2, "isRunning", 0)


-- throws Exception
function UnitWaypointBehavior2:processTick(allBinaryLayerManager)
        if self.waypointPathRunnable:isRunning() then
            if not rawequal(self.waypointPathsListP, UnitWaypointBehavior2.runningWaypointPathList) then
                self.waypointPathRunnable:setRunning(false)
                if self.waitingOnTargetPath then
                    self:setTargetPath()
                elseif self.waitingOnWaypointPath then
                    self:setWaypointPath(self.waypointPathRunnable:getTargetLayer())
                else
                    error(require("java.lang.Exception").new("Should not happen"), 0)
                end
            else
                return
            end
        end
        self:processTargetList()
        if not (self.waypointPathRunnable:isRunning()) then
            self:processWaypoint()
        else
            return
        end
        if not (self.waypointPathRunnable:isRunning()) then
            self:processTargeting()
        else
            return
        end
        if not (self.waypointPathRunnable:isRunning()) then
            self:teleportIfNoProgress()
        else
            return
        end
end
java_overload(UnitWaypointBehavior2, "processTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


-- throws Exception
function UnitWaypointBehavior2:onEnemyMovement(layerInterface)
        local anotherTargetDistance = self.layerDistanceUtil:getDistance(self.associatedAdvancedRTSGameLayer, layerInterface)
        if rawequal(layerInterface, self.currentTargetLayerInterfaceP) then
            self:setCurrentTargetDistance(anotherTargetDistance)
        else
            self:processPossibleTarget(layerInterface, anotherTargetDistance)
        end
end
java_overload(UnitWaypointBehavior2, "onEnemyMovement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) end)


-- throws Exception
function UnitWaypointBehavior2:processPossibleTarget(layerInterface, anotherTargetDistance)
        local isShorterThanCurrentTargetDistance = self:getCurrentTargetDistance() > anotherTargetDistance
        local isCurrentTargetDestroyed = not rawequal(self.currentTargetLayerInterfaceP, CollidableDestroyableDamageableLayer.getNullInstance()) and self.currentTargetLayerInterfaceP:isDestroyed()
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processPossibleTarget(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed)
        if self:isWaypointListEmptyOrOnlyTargets() and self:isInSensorRange(layerInterface, anotherTargetDistance) and (isShorterThanCurrentTargetDistance or isCurrentTargetDestroyed) then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processSetTarget(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance)
            self:setTarget(layerInterface, anotherTargetDistance)
        elseif self:isCloseRange(layerInterface, anotherTargetDistance) and (isShorterThanCurrentTargetDistance or isCurrentTargetDestroyed) then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processPossibleTargetCloser(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance)
            self:setTarget(layerInterface, anotherTargetDistance)
        end
end
java_overload(UnitWaypointBehavior2, "processPossibleTarget", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) and type(java_a2) == "number" end)


-- throws Exception
function UnitWaypointBehavior2:teleportIfNoProgress()
        if self:isTrackingWaypoint() or self.associatedAdvancedRTSGameLayer:getParentLayer():isDestroyed() then
            if self.progressTimeDelayHelper:isTimeTNT() and not rawequal(self.nextUnvisitedPathGeographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
                self.associatedAdvancedRTSGameLayer:teleportTo(self.nextUnvisitedPathGeographicMapCellPosition)
            end
            if self:getCompleteTimeDelayHelper():isTimeTNT() then
                local geographicMapCellPosition = self.currentGeographicMapCellHistoryP:getTracked():get(self.currentGeographicMapCellHistoryP:getSize() - 1)
                self.associatedAdvancedRTSGameLayer:teleportTo(geographicMapCellPosition)
            end
        end
end
java_overload(UnitWaypointBehavior2, "teleportIfNoProgress", 0)


-- throws Exception
function UnitWaypointBehavior2:setTarget(layerInterface, anotherTargetDistance)
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:setTarget(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance)
        self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.TARGET, BasicColorFactory.getInstance().GREEN)
        self.associatedAdvancedRTSGameLayer:setLoad(0)
        self:setCurrentTargetDistance(anotherTargetDistance)
        self:setCurrentTargetLayerInterface(layerInterface)
        self:setTrackingWaypoint(false)
        self.targetList:clear()
        if not (self:isCloseRange(layerInterface, anotherTargetDistance)) and self:canInsertWaypoint(0, self.currentTargetLayerInterfaceP) then
            local geographicMapCellPosition = self.associatedAdvancedRTSGameLayer:getCurrentGeographicMapCellPosition()
            local pathFindingLayerInterface = (self.currentTargetLayerInterfaceP)
            local waypoint = pathFindingLayerInterface:getWaypointBehavior():getWaypoint()
            local list = waypoint:getPathsListFromCacheOnly(geographicMapCellPosition)
            self:setWaypointPathsList(list)
            if rawequal(self.waypointPathsListP, nil) then
                self.targetWithoutCachedPathLayerInterface = self.currentTargetLayerInterfaceP
            elseif not rawequal(self.waypointPathsListP:size(), 0) then
                self:setTargetPath()
            end
        end
end
java_overload(UnitWaypointBehavior2, "setTarget", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) and type(java_a2) == "number" end)


-- throws Exception
function UnitWaypointBehavior2:setTargetPath()
        if not rawequal(self.currentTargetLayerInterfaceP, CollidableDestroyableDamageableLayer.getNullInstance()) then
            if self.currentTargetLayerInterfaceP:isDestroyed() then
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:setTargetPath(self.associatedAdvancedRTSGameLayer)
                self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.KILL, self.basicColorFactory.ORANGE)
                self:clearTarget()
                return
            end
            if rawequal(self.currentTargetLayerInterfaceP, self.waypointPathRunnable:getTargetLayer()) then
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:setTargetPathIgnoreNewPath(self.associatedAdvancedRTSGameLayer, self)
                self:insertWaypoint(0, self.currentTargetLayerInterfaceP)
                self:setRandomGeographicMapCellHistory(self.waypointPathsListP)
            end
        end
end
java_overload(UnitWaypointBehavior2, "setTargetPath", 0)


-- throws Exception
function UnitWaypointBehavior2:setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)
        self:setCurrentPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
        self.nextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        java_super(UnitWaypointBehavior, "setGeographicMapCellHistoryPath", 1)(self, geographicMapCellPositionBasicArrayList)
end
java_overload(UnitWaypointBehavior2, "setGeographicMapCellHistoryPath", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws Exception
function UnitWaypointBehavior2:processWaypoint()
        local size = self.targetList:size()
        if size > 0 then
            local targetLayer = self.targetList:get(0)
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processWaypoint(self.associatedAdvancedRTSGameLayer, self, targetLayer, size)
            if targetLayer:isDestroyed() then
                self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.WAYPOINT_DESTROYED_SHORT, self.basicColorFactory.YELLOW)
                self:removeWaypoint(targetLayer, self.unitWaypointStrings.WAYPOINT_DESTROYED)
            else
                local geographicMapCellPosition = self.associatedAdvancedRTSGameLayer:getCurrentGeographicMapCellPosition()
                if self:isTrackingWaypoint() then
                    self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processWaypointTracked(self.associatedAdvancedRTSGameLayer, self)
                    if self:visitIfAtMidPoint(geographicMapCellPosition) then
                        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processWaypointTrackedVisit(self.associatedAdvancedRTSGameLayer, geographicMapCellPosition)
                    end
                    if self.currentGeographicMapCellHistoryP:isAllVisited2() and not rawequal(self.currentTargetLayerInterfaceP, CollidableDestroyableDamageableLayer.getNullInstance()) then
                        local oldWaypointLayer = self.currentTargetLayerInterfaceP
                        oldWaypointLayer:getWaypointBehavior():getWaypoint():visit(self.associatedAdvancedRTSGameLayer)
                        self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.ALL_VISITED_SHORT, self.basicColorFactory.GREEN)
                        self:removeWaypoint(self.currentTargetLayerInterfaceP, self.unitWaypointStrings.ALL_VISITED)
                    end
                elseif rawequal(self.currentTargetLayerInterfaceP, nil) or self.waypointOverridesAttacking then
                    local list = targetLayer:getWaypointBehavior():getWaypoint():getPathsListFromCacheOnly(geographicMapCellPosition)
                    self:setWaypointPathsList(list)
                    if rawequal(self.waypointPathsListP, nil) then
                        self.waitingOnWaypointPath = true
                        self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.THINKING, self.basicColorFactory.GREEN)
                        self:runWaypointPathTask(targetLayer)
                        return
                    end
                    self:setWaypointPath(targetLayer)
                end
            end
        end
end
java_overload(UnitWaypointBehavior2, "processWaypoint", 0)


-- throws Exception
function UnitWaypointBehavior2:wander()
        if self.currentGeographicMapCellHistoryP:isAllVisited2() then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:wander(self.associatedAdvancedRTSGameLayer)
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.WANDERING, self.basicColorFactory.RED)
            self.wanderPathsList:clear()
            self.wanderPathsList:add(self.associatedAdvancedRTSGameLayer:getSurroundingGeographicMapCellPositionList())
            self:setRandomGeographicMapCellHistory(self.wanderPathsList)
        end
        self:visitIfAtMidPoint(self:getCurrentPathGeographicMapCellPosition())
        self:updateCurrentPathGeographicMapCellPosition()
        self.associatedAdvancedRTSGameLayer:trackTo(self.unitWaypointStrings.NEXT_PATH_NODE)
end
java_overload(UnitWaypointBehavior2, "wander", 0)


function UnitWaypointBehavior2:visitIfAtMidPoint(geographicMapCellPosition)
        local unitLayer = self.associatedAdvancedRTSGameLayer
        if not rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) and rawequal(self.nextUnvisitedPathGeographicMapCellPosition, geographicMapCellPosition) then
            local point = geographicMapCellPosition:getMidPoint()
            local afterNextPoint = self.afterNextUnvisitedPathGeographicMapCellPosition:getMidPoint()
            local beyondMidPoint = true
            if rawequal(geographicMapCellPosition:getColumn(), self.afterNextUnvisitedPathGeographicMapCellPosition:getColumn()) then
            elseif point:getX() < afterNextPoint:getX() then
                if unitLayer:getXP() + unitLayer:getHalfWidth() < point:getX() then
                    beyondMidPoint = false
                end
            else
                if unitLayer:getXP() + unitLayer:getHalfWidth() > point:getX() then
                    beyondMidPoint = false
                end
            end
            if rawequal(geographicMapCellPosition:getRow(), self.afterNextUnvisitedPathGeographicMapCellPosition:getRow()) then
            elseif point:getY() < afterNextPoint:getY() then
                if unitLayer:getYP() + unitLayer:getHalfHeight() < point:getY() then
                    beyondMidPoint = false
                end
            else
                if unitLayer:getYP() + unitLayer:getHalfHeight() > point:getY() then
                    beyondMidPoint = false
                end
            end
            if beyondMidPoint then
                return self.currentGeographicMapCellHistoryP:visit(geographicMapCellPosition)
            end
        end
        return false
end
java_overload(UnitWaypointBehavior2, "visitIfAtMidPoint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


-- throws Exception
function UnitWaypointBehavior2:processTargetList()
        self.targetWithoutCachedPathLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance()
        for index = self:getPossibleTargetList():size() - 1, 0, -1 do
            local layerInterface = self:getPossibleTargetList():get(index)
            if layerInterface:isDestroyed() then
                self:getPossibleTargetList():remove(layerInterface)
            else
                self:onEnemyMovement(layerInterface)
            end
        end
        if not rawequal(self.targetWithoutCachedPathLayerInterface, CollidableDestroyableDamageableLayer.getNullInstance()) then
            self.waitingOnTargetPath = true
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.THINKING_ABOUT_TARGET, self.basicColorFactory.GREEN)
            self:runWaypointPathTask(self.currentTargetLayerInterfaceP)
        end
        self:getPossibleTargetList():clear()
end
java_overload(UnitWaypointBehavior2, "processTargetList", 0)


-- throws Exception
function UnitWaypointBehavior2:processTargeting()
        if not rawequal(self.currentTargetLayerInterfaceP, CollidableDestroyableDamageableLayer.getNullInstance()) and (self:isInSensorRange(self.currentTargetLayerInterfaceP, self:getCurrentTargetDistance()) or self:isTrackingWaypoint()) then
            if self.currentTargetLayerInterfaceP:isDestroyed() then
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:targetDestroyed(self.associatedAdvancedRTSGameLayer)
                self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.KILL, self.basicColorFactory.ORANGE)
                self:clearTarget()
                return
            end
            local dx = 0
            local dy = 0
            if self:isTrackingWaypoint() then
                self:updateCurrentPathGeographicMapCellPosition()
                local point = self.nextUnvisitedPathGeographicMapCellPosition:getMidPoint()
                dx = self.associatedAdvancedRTSGameLayer:getXP() + self.associatedAdvancedRTSGameLayer:getHalfWidth() - point:getX()
                dy = self.associatedAdvancedRTSGameLayer:getYP() + self.associatedAdvancedRTSGameLayer:getHalfHeight() - point:getY()
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processTargeting(self.associatedAdvancedRTSGameLayer, dx, dy)
            else
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processTargetingNonWayPoint(self.associatedAdvancedRTSGameLayer, dx, dy)
                dx = (self.associatedAdvancedRTSGameLayer:getXP() + self.associatedAdvancedRTSGameLayer:getHalfWidth()) - (self.currentTargetLayerInterfaceP:getXP() + self.currentTargetLayerInterfaceP:getHalfWidth())
                dy = (self.associatedAdvancedRTSGameLayer:getYP() + self.associatedAdvancedRTSGameLayer:getHalfHeight()) - (self.currentTargetLayerInterfaceP:getYP() + self.currentTargetLayerInterfaceP:getHalfHeight())
            end
            self.associatedAdvancedRTSGameLayer:trackToDXY(dx, dy)
        else
            if self.associatedAdvancedRTSGameLayer:getParentLayer():isDestroyed() then
                self:wander()
            else
                if self.associatedAdvancedRTSGameLayer.showMoreCaptionStates then
                    self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.STOP, self.basicColorFactory.YELLOW)
                end
                self.associatedAdvancedRTSGameLayer:allStop()
            end
        end
end
java_overload(UnitWaypointBehavior2, "processTargeting", 0)


function UnitWaypointBehavior2:updateCurrentPathGeographicMapCellPosition()
        self:setLastPathGeographicMapCellPosition(self:getCurrentPathGeographicMapCellPosition())
        self:setCurrentPathGeographicMapCellPosition(self.nextUnvisitedPathGeographicMapCellPosition)
        self.nextUnvisitedPathGeographicMapCellPosition = self.currentGeographicMapCellHistoryP:getFirstUnvisited()
        self.afterNextUnvisitedPathGeographicMapCellPosition = self.currentGeographicMapCellHistoryP:getAfterIfNotLast(self.nextUnvisitedPathGeographicMapCellPosition)
        if not rawequal(self:getCurrentPathGeographicMapCellPosition(), self.nextUnvisitedPathGeographicMapCellPosition) then
            self.progressTimeDelayHelper:setStartTimeTNT()
        end
end
java_overload(UnitWaypointBehavior2, "updateCurrentPathGeographicMapCellPosition", 0)


-- throws Exception
function UnitWaypointBehavior2:setWaypointPath(waypointLayer)
        if not rawequal(self.waypointPathsListP:size(), 0) then
            self:setCurrentTargetLayerInterface(waypointLayer)
            local MAX = require("java.lang.Integer").MAX_VALUE
            self:setCurrentTargetDistance(MAX)
            self:setRandomGeographicMapCellHistory(self.waypointPathsListP)
        else
            waypointLayer:getWaypointBehavior():getWaypoint():visit(self.associatedAdvancedRTSGameLayer)
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.ALREADY_THERE_SHORT, self.basicColorFactory.YELLOW)
            self:removeWaypoint(waypointLayer, self.unitWaypointStrings.ALREADY_THERE)
        end
end
java_overload(UnitWaypointBehavior2, "setWaypointPath", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) end)


-- throws Exception
function UnitWaypointBehavior2:runWaypointPathTask(waypointLayer)
        self:setWaypointPathsList(UnitWaypointBehavior2.runningWaypointPathList)
        if self.waypointPathRunnable:isRunning() then
            error(require("java.lang.Exception").new("Should never be running here"), 0)
        end
        self.waypointPathRunnable:setRunning(true)
        self.waypointPathRunnable:setUnitLayer(self.associatedAdvancedRTSGameLayer)
        self.waypointPathRunnable:setTargetLayer(waypointLayer)
        self.pathFindingThreadPool:runTask(self.waypointPathRunnable)
end
java_overload(UnitWaypointBehavior2, "runWaypointPathTask", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) end)


-- throws Exception
function UnitWaypointBehavior2:removeWaypoint(waypointLayer, reason)
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:removeWaypoint(self.associatedAdvancedRTSGameLayer, self, waypointLayer, reason)
        self.targetList:remove(waypointLayer)
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:removeWaypointList(self.associatedAdvancedRTSGameLayer, self, self.targetList)
        if rawequal(self.currentTargetLayerInterfaceP, waypointLayer) then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:removeWaypointClear(self.associatedAdvancedRTSGameLayer)
            self:clearTarget()
        end
end
java_overload(UnitWaypointBehavior2, "removeWaypoint", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) and (java_a2 == nil or type(java_a2) == "string") end)


-- throws Exception
function UnitWaypointBehavior2:clearTarget()
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:clearTarget(self.associatedAdvancedRTSGameLayer)
        self:setCurrentTargetLayerInterface(CollidableDestroyableDamageableLayer.getNullInstance())
        self:setTrackingWaypoint(false)
        local MAX = require("java.lang.Integer").MAX_VALUE
        self:setCurrentTargetDistance(MAX)
        TrackingEventHandler.getInstance():fireEvent(self.associatedAdvancedRTSGameLayer:getTrackingEvent())
end
java_overload(UnitWaypointBehavior2, "clearTarget", 0)


function UnitWaypointBehavior2:isWaypointListEmptyOrOnlyTargets()
        local list = self.targetList
        if rawequal(list:size(), 0) then
            return true
        end
        for index = list:size() - 1, 0, -1 do
            local layerInterface = list:get(index)
            if layerInterface:isWaypointListEmptyOrOnlyTargets() then
                return false
            end
        end
        return true
end
java_overload(UnitWaypointBehavior2, "isWaypointListEmptyOrOnlyTargets", 0)


function UnitWaypointBehavior2:isCloseRange(layerInterface, targetDistance)
        return targetDistance < self.closeRange + layerInterface:getHalfHeight()
end
java_overload(UnitWaypointBehavior2, "isCloseRange", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) and type(java_a2) == "number" end)


function UnitWaypointBehavior2:isInSensorRange(layerInterface, targetDistance)
        return targetDistance < self.sensorRange + layerInterface:getHalfHeight()
end
java_overload(UnitWaypointBehavior2, "isInSensorRange", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and type(java_a2) == "number" end)


function UnitWaypointBehavior2:getCurrentTargetingStateString()
        local stringBuffer = StringMaker.new()
        if not rawequal(self.currentTargetLayerInterfaceP, CollidableDestroyableDamageableLayer.getNullInstance()) then
            stringBuffer:append(UnitWaypointBehavior2.TARGET_LAYER)
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:append(self.currentTargetLayerInterfaceP:getName())
            stringBuffer:append(" with ")
            stringBuffer:append(UnitWaypointBehavior2.TARGET_DISTANCE)
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:appendint(java_int(self:getCurrentTargetDistance()))
        end
        return tostring(stringBuffer)
end
java_overload(UnitWaypointBehavior2, "getCurrentTargetingStateString", 0)


-- throws Exception
function UnitWaypointBehavior2:addWaypointFromUser(advancedRTSGameLayer)
        if advancedRTSGameLayer:isDestroyed() then
            error(require("java.lang.Exception").new(require("allbinary_java").to_string("Trying to add a dead: ") .. require("allbinary_java").to_string(advancedRTSGameLayer)), 0)
        end
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:addWaypointFromUser(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        self.targetList:clear()
        self.targetList:add(advancedRTSGameLayer)
        self:clearTarget()
end
java_overload(UnitWaypointBehavior2, "addWaypointFromUser", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) end)


-- throws Exception
function UnitWaypointBehavior2:addBuildingChase(allbinaryLayer, cellPosition)
        if not (self.buildingSteeringVisitor:getList():contains(allbinaryLayer)) then
            self.buildingSteeringVisitor:getList():add(allbinaryLayer)
            self.buildingSteeringVisitor:getPositionList():add(cellPosition)
        end
        if not (self:getSteeringVisitorList():contains(self.buildingSteeringVisitor)) then
            self:getSteeringVisitorList():add(self.buildingSteeringVisitor)
        end
end
java_overload(UnitWaypointBehavior2, "addBuildingChase", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


-- throws Exception
function UnitWaypointBehavior2:buildingChase(allbinaryLayer, cellPosition)
        return self.associatedAdvancedRTSGameLayer:buildingChase(allbinaryLayer, cellPosition)
end
java_overload(UnitWaypointBehavior2, "buildingChase", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)

UnitWaypointBehavior2.runningWaypointPathList = BasicArrayListD.new()
UnitWaypointBehavior2.TARGET_DISTANCE = "Target Distance"
UnitWaypointBehavior2.TARGET_LAYER = "Target Layer"

return UnitWaypointBehavior2

