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

local UnitWaypointBehavior = {}
package.loaded["org.allbinary.game.layer.unit.UnitWaypointBehavior"] = UnitWaypointBehavior

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

local PrimaryWaypointHelper = java_lazy("org.allbinary.game.input.form.PrimaryWaypointHelper")
local AdvancedRTSGameLayer = java_lazy("org.allbinary.game.layer.AdvancedRTSGameLayer")
local RTSLayerEvent = java_lazy("org.allbinary.game.layer.RTSLayerEvent")
local SensorAction = java_lazy("org.allbinary.game.layer.SensorAction")
local SensorActionFactory = java_lazy("org.allbinary.game.layer.SensorActionFactory")
local WaypointBehaviorBase = require("org.allbinary.game.layer.WaypointBehaviorBase")
local BuildingLayer = java_lazy("org.allbinary.game.layer.building.BuildingLayer")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local WaypointEventListenerInterface = java_lazy("org.allbinary.game.layer.waypoint.event.WaypointEventListenerInterface")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
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

-- class table UnitWaypointBehavior is declared before the requires
UnitWaypointBehavior.__index = UnitWaypointBehavior
UnitWaypointBehavior.className = "UnitWaypointBehavior"
UnitWaypointBehavior.javaClassName = "org.allbinary.game.layer.unit.UnitWaypointBehavior"
setmetatable(UnitWaypointBehavior, {__index = WaypointBehaviorBase})
UnitWaypointBehavior.java_implements = " WaypointEventListenerInterface "
UnitWaypointBehavior.java_interfaces = function() return {WaypointEventListenerInterface} end

function UnitWaypointBehavior:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    self.unitWaypointStrings = UnitWaypointStrings.getInstance()
    self.longWeaponRange = 0
    self.sensorAction = SensorActionFactory.getInstance().ATTACK
    if self.completeTimeDelayHelper == nil then self.completeTimeDelayHelper = nil end
    if self.currentGeographicMapCellHistoryP == nil then self.currentGeographicMapCellHistoryP = nil end
    self.lastPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.currentPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    if self.FAKE_WAYPOINT_LAYER == nil then self.FAKE_WAYPOINT_LAYER = nil end
    if self.targetList == nil then self.targetList = nil end
    if self.possibleTargetList == nil then self.possibleTargetList = nil end
    if self.associatedAdvancedRTSGameLayer == nil then self.associatedAdvancedRTSGameLayer = nil end
    self.moving = false
    self.movingFromStopped = false
    self.waypointPathsListP = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.currentTargetDistance = require("java.lang.Integer").MAX_VALUE
    self.currentTargetLayerInterfaceP = CollidableDestroyableDamageableLayer.getNullInstance()
    if self.trackingWaypoint == nil then self.trackingWaypoint = false end
    self.repeatedToLong = TimeDelayHelper.new(22000)
end


function UnitWaypointBehavior._jinit(self, associatedAdvancedRTSGameLayer, fakeWaypoint)
    java_super_init(WaypointBehaviorBase, self)
    UnitWaypointBehavior._init_fields(self)
        self.associatedAdvancedRTSGameLayer = associatedAdvancedRTSGameLayer
        self.completeTimeDelayHelper = TimeDelayHelper.new(30000)
        self.targetList = BasicArrayListD.new()
        self.possibleTargetList = BasicArrayListD.new()
        self:setWaypointPathsList(BasicArrayListUtil.getInstance():getImmutableInstance())
        self.currentGeographicMapCellHistoryP = GeographicMapCellHistory.new()
        self.FAKE_WAYPOINT_LAYER = fakeWaypoint
    return self
end

function UnitWaypointBehavior.new(...)
    local self = setmetatable({}, UnitWaypointBehavior)
    UnitWaypointBehavior._jinit(self, ...)
    return self
end


function UnitWaypointBehavior:initRange(weaponRange)
        self.longWeaponRange = java_idiv(weaponRange, 2)
end
java_overload(UnitWaypointBehavior, "initRange", 1, function(java_a1) return true and type(java_a1) == "number" end)


function UnitWaypointBehavior:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(UnitWaypointBehavior, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


-- throws Exception
function UnitWaypointBehavior:onWaypointEvent(event)
        local advancedRTSGameLayer = event:getRtsLayer()
        self.associatedAdvancedRTSGameLayer.waypointLogHelperP:onWaypointEvent(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        if self.associatedAdvancedRTSGameLayer:isSelected() then
            self:addWaypointFromUser(advancedRTSGameLayer)
        elseif advancedRTSGameLayer:shouldAddWaypointFromBuilding() then
            self:addWaypointFromBuilding(advancedRTSGameLayer)
        end
end
java_overload(UnitWaypointBehavior, "onWaypointEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayerEvent")) end)


-- throws Exception
function UnitWaypointBehavior:addWaypointFromUser(advancedRTSGameLayer)
end
java_overload(UnitWaypointBehavior, "addWaypointFromUser", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) end)


-- throws Exception
function UnitWaypointBehavior:addWaypointFromBuilding(advancedRTSGameLayer)
        if rawequal(advancedRTSGameLayer, PrimaryWaypointHelper.getInstance():getWaypointLayer()) or rawequal(advancedRTSGameLayer:getParentLayer(), self.associatedAdvancedRTSGameLayer:getParentLayer()) then
            if not (self.targetList:contains(advancedRTSGameLayer)) then
                self.associatedAdvancedRTSGameLayer.waypointLogHelperP:addWaypointFromBuilding(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
                if advancedRTSGameLayer:isDestroyed() then
                    error(require("java.lang.Exception").new(require("allbinary_java").to_string("Trying to add a dead: ") .. require("allbinary_java").to_string(advancedRTSGameLayer)), 0)
                end
                self.targetList:add(advancedRTSGameLayer)
                self.associatedAdvancedRTSGameLayer.waypointLogHelperP:addWaypointFromBuildingList(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, self.targetList)
            end
        end
end
java_overload(UnitWaypointBehavior, "addWaypointFromBuilding", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AdvancedRTSGameLayer")) end)


function UnitWaypointBehavior:isWaypointListEmptyOrOnlyTargets()
        return false
end
java_overload(UnitWaypointBehavior, "isWaypointListEmptyOrOnlyTargets", 0)


-- throws Exception
function UnitWaypointBehavior:insertWaypoint(index, rtsLayer)
        if self:canInsertWaypoint(index, rtsLayer) then
            self.associatedAdvancedRTSGameLayer.waypointLogHelperP:insertWaypoint(self.associatedAdvancedRTSGameLayer, index, rtsLayer, self:getName())
            if rtsLayer:isDestroyed() then
                error(require("java.lang.Exception").new(require("allbinary_java").to_string("Trying to add a dead: ") .. require("allbinary_java").to_string(rtsLayer)), 0)
            end
            self.targetList:addAt(index, rtsLayer)
            self.associatedAdvancedRTSGameLayer.waypointLogHelperP:insertWaypointList(self.associatedAdvancedRTSGameLayer, index, rtsLayer, self:getName(), self.targetList)
            return true
        end
        return false
end
java_overload(UnitWaypointBehavior, "insertWaypoint", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "CollidableDestroyableDamageableLayer")) end)


function UnitWaypointBehavior:move()
        if self:isMoving() then
            self:setMovingFromStopped(false)
        else
            self:setMovingFromStopped(true)
        end
        self:setMoving(false)
end
java_overload(UnitWaypointBehavior, "move", 0)


-- throws Exception
function UnitWaypointBehavior:setRandomGeographicMapCellHistory(pathsList)
        local size = pathsList:size()
        self.associatedAdvancedRTSGameLayer.waypointLogHelperP:setRandomGeographicMapCellHistoryList(self.associatedAdvancedRTSGameLayer, pathsList)
        if size > 0 then
            local geographicMapCellPositionBasicArrayList = BasicArrayListUtil.getInstance():getRandom(pathsList)
            self:setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)
        end
end
java_overload(UnitWaypointBehavior, "setRandomGeographicMapCellHistory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws Exception
function UnitWaypointBehavior:setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)
        self.lastPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        if self.associatedAdvancedRTSGameLayer.showMoreCaptionStates then
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.PATHING, BasicColorFactory.getInstance().GREEN)
        end
        self.currentGeographicMapCellHistoryP:init()
        self.associatedAdvancedRTSGameLayer:init(self.currentGeographicMapCellHistoryP, geographicMapCellPositionBasicArrayList)
        self:setTrackingWaypoint(true)
        self:getCompleteTimeDelayHelper():setStartTimeTNT()
end
java_overload(UnitWaypointBehavior, "setGeographicMapCellHistoryPath", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function UnitWaypointBehavior:canInsertWaypoint(index, rtsLayer)
        if self.targetList:size() > 4 then
        elseif self.targetList:contains(rtsLayer) then
        else
            return true
        end
        return false
end
java_overload(UnitWaypointBehavior, "canInsertWaypoint", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "CollidableDestroyableDamageableLayer")) end)


-- throws Exception
function UnitWaypointBehavior:addBuildingChase(allbinaryLayer, cellPosition)
end
java_overload(UnitWaypointBehavior, "addBuildingChase", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


-- throws Exception
function UnitWaypointBehavior:moveAwayFromBuilding(buildingLayer)
        local geographicMapCellPosition = self.associatedAdvancedRTSGameLayer:getCurrentGeographicMapCellPosition()
        local list = buildingLayer.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
        if list:contains(geographicMapCellPosition) then
            if self:insertWaypoint(0, self.FAKE_WAYPOINT_LAYER) then
                self.associatedAdvancedRTSGameLayer.waypointLogHelperP:moveAwayFromBuilding(self.associatedAdvancedRTSGameLayer)
                self:setCurrentTargetLayerInterface(self.FAKE_WAYPOINT_LAYER)
                local pathsList = buildingLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
                self.associatedAdvancedRTSGameLayer:setClosestGeographicMapCellHistory(pathsList)
            end
        end
end
java_overload(UnitWaypointBehavior, "moveAwayFromBuilding", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BuildingLayer")) end)


function UnitWaypointBehavior:needToMove()
        self.associatedAdvancedRTSGameLayer.waypointLogHelperP:needToMove(self.associatedAdvancedRTSGameLayer, self)
        if self:isTrackingWaypoint() or rawequal(self.sensorAction, SensorActionFactory.getInstance().EVADE) or (not rawequal(self.currentTargetLayerInterfaceP, CollidableDestroyableDamageableLayer.getNullInstance()) and self:getCurrentTargetDistance() >= self.longWeaponRange + self.currentTargetLayerInterfaceP:getHalfHeight()) then
            self.repeatedToLong:setStartTimeTNT()
            return true
        end
        if self.repeatedToLong:isTimeTNT() then
            local message = require("allbinary_java").to_string("Repeating too long: ") .. require("allbinary_java").to_string(self:getMovementLogicAsString())
            ForcedLogUtil.log(message, self.associatedAdvancedRTSGameLayer)
        end
        return false
end
java_overload(UnitWaypointBehavior, "needToMove", 0)


function UnitWaypointBehavior:getMovementLogicAsString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("isTrackingWaypoint: ")
        stringBuffer:appendboolean(self:isTrackingWaypoint())
        stringBuffer:append(" sensorAction: ")
        stringBuffer:append(self.sensorAction.name_f)
        stringBuffer:append(" getCurrentTargetLayerInterface: ")
        stringBuffer:append(StringUtil.getInstance():toString(self.currentTargetLayerInterfaceP))
        if not rawequal(self.currentTargetLayerInterfaceP, CollidableDestroyableDamageableLayer.getNullInstance()) then
            stringBuffer:append(" Target Range: ")
            stringBuffer:appendint(self:getCurrentTargetDistance())
            stringBuffer:append(" >= ")
            stringBuffer:appendint(java_int(self.longWeaponRange + self.currentTargetLayerInterfaceP:getHalfHeight()))
        end
        return tostring(stringBuffer)
end
java_overload(UnitWaypointBehavior, "getMovementLogicAsString", 0)


function UnitWaypointBehavior:isMovingFromStopped()
        return self.movingFromStopped
end
java_overload(UnitWaypointBehavior, "isMovingFromStopped", 0)


function UnitWaypointBehavior:setMovingFromStopped(movingFromStopped)
        self.movingFromStopped = movingFromStopped
end
java_overload(UnitWaypointBehavior, "setMovingFromStopped", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function UnitWaypointBehavior:setWaypointPathsList(waypointPathsList)
        self.waypointPathsListP = waypointPathsList
end
java_overload(UnitWaypointBehavior, "setWaypointPathsList", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function UnitWaypointBehavior:getWaypointPathsList()
        return self.waypointPathsListP
end
java_overload(UnitWaypointBehavior, "getWaypointPathsList", 0)


function UnitWaypointBehavior:isMoving()
        return self.moving
end
java_overload(UnitWaypointBehavior, "isMoving", 0)


function UnitWaypointBehavior:setMoving(moving)
        self.moving = moving
end
java_overload(UnitWaypointBehavior, "setMoving", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function UnitWaypointBehavior:isTrackingWaypoint()
        return self.trackingWaypoint
end
java_overload(UnitWaypointBehavior, "isTrackingWaypoint", 0)


function UnitWaypointBehavior:getPossibleTargetList()
        return self.possibleTargetList
end
java_overload(UnitWaypointBehavior, "getPossibleTargetList", 0)


function UnitWaypointBehavior:setLastPathGeographicMapCellPosition(lastPathGeographicMapCellPosition)
        self.lastPathGeographicMapCellPosition = lastPathGeographicMapCellPosition
end
java_overload(UnitWaypointBehavior, "setLastPathGeographicMapCellPosition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


function UnitWaypointBehavior:getLastPathGeographicMapCellPosition()
        return self.lastPathGeographicMapCellPosition
end
java_overload(UnitWaypointBehavior, "getLastPathGeographicMapCellPosition", 0)


function UnitWaypointBehavior:setCurrentPathGeographicMapCellPosition(currentPathGeographicMapCellPosition)
        self.currentPathGeographicMapCellPosition = currentPathGeographicMapCellPosition
end
java_overload(UnitWaypointBehavior, "setCurrentPathGeographicMapCellPosition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


function UnitWaypointBehavior:getCurrentPathGeographicMapCellPosition()
        return self.currentPathGeographicMapCellPosition
end
java_overload(UnitWaypointBehavior, "getCurrentPathGeographicMapCellPosition", 0)


function UnitWaypointBehavior:setSensorAction(sensorAction)
        self.sensorAction = sensorAction
end
java_overload(UnitWaypointBehavior, "setSensorAction", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "SensorAction")) end)


function UnitWaypointBehavior:getSensorAction()
        return self.sensorAction
end
java_overload(UnitWaypointBehavior, "getSensorAction", 0)


function UnitWaypointBehavior:setCurrentTargetLayerInterface(currentTargetLayerInterface)
        self.currentTargetLayerInterfaceP = currentTargetLayerInterface
end
java_overload(UnitWaypointBehavior, "setCurrentTargetLayerInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) end)


function UnitWaypointBehavior:getCurrentTargetLayerInterface()
        return self.currentTargetLayerInterfaceP
end
java_overload(UnitWaypointBehavior, "getCurrentTargetLayerInterface", 0)


function UnitWaypointBehavior:setCurrentTargetDistance(currentTargetDistance)
        self.currentTargetDistance = currentTargetDistance
end
java_overload(UnitWaypointBehavior, "setCurrentTargetDistance", 1, function(java_a1) return true and type(java_a1) == "number" end)


function UnitWaypointBehavior:getCurrentTargetDistance()
        return self.currentTargetDistance
end
java_overload(UnitWaypointBehavior, "getCurrentTargetDistance", 0)


function UnitWaypointBehavior:getCompleteTimeDelayHelper()
        return self.completeTimeDelayHelper
end
java_overload(UnitWaypointBehavior, "getCompleteTimeDelayHelper", 0)


function UnitWaypointBehavior:getCurrentGeographicMapCellHistory()
        return self.currentGeographicMapCellHistoryP
end
java_overload(UnitWaypointBehavior, "getCurrentGeographicMapCellHistory", 0)


function UnitWaypointBehavior:setTrackingWaypoint(trackingWaypoint)
        self.trackingWaypoint = trackingWaypoint
end
java_overload(UnitWaypointBehavior, "setTrackingWaypoint", 1, function(java_a1) return true and type(java_a1) == "boolean" end)

return UnitWaypointBehavior

