-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.layer.waypoint

local Waypoint2SelectedLogHelper = {}
package.loaded["org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper"] = Waypoint2SelectedLogHelper

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

local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Waypoint2LogHelper = require("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")

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

-- class table Waypoint2SelectedLogHelper is declared before the requires
Waypoint2SelectedLogHelper.__index = Waypoint2SelectedLogHelper
Waypoint2SelectedLogHelper.className = "Waypoint2SelectedLogHelper"
Waypoint2SelectedLogHelper.javaClassName = "org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper"
setmetatable(Waypoint2SelectedLogHelper, {__index = Waypoint2LogHelper})

function Waypoint2SelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.positionStrings = PositionStrings.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.ENEMY_POSSIBLE_TARGET = " Enemy Possible Target: "
    self.CLOSE_RANGE = "closeRange: "
    self.SENSOR_RANGE = " sensorRange: "
    self.ONLY_TARGETS = " Only Targets: "
    self.SHORTER_THAN_CURRENT_TARGET_DISTANCE = " isShorterThanCurrentTargetDistance: "
    self.CURRENT_TARGET_DESTROYED = " isCurrentTargetDestroyed: "
    self.CURRENT_TARGET_NOT_AVAILABLE = " isCurrentTargetNotAvailable: "
    self.PROCESS_POSSIBLE_TARGET = "selected: processPossibleTarget1"
end

function Waypoint2SelectedLogHelper._jinit(self)
    java_super_init(Waypoint2LogHelper, self)
    Waypoint2SelectedLogHelper._init_fields(self)
    return self
end

function Waypoint2SelectedLogHelper.new()
    return Waypoint2SelectedLogHelper._jinit(setmetatable({}, Waypoint2SelectedLogHelper))
end


function Waypoint2SelectedLogHelper.getInstance()
        return Waypoint2SelectedLogHelper.instanceC
end


function Waypoint2SelectedLogHelper:initRange(associatedAdvancedRTSGameLayer, closeRange, sensorRange)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.CLOSE_RANGE)
        stringBuffer:appendint(closeRange)
        stringBuffer:append(self.SENSOR_RANGE)
        stringBuffer:appendint(sensorRange)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: initRange")
end
java_overload(Waypoint2SelectedLogHelper, "initRange", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function Waypoint2SelectedLogHelper:processPossibleTarget(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed)
        if waypointBehaviorBase:isWaypointListEmptyOrOnlyTargets() and waypointBehaviorBase:isInSensorRange(layerInterface, anotherTargetDistance) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
            stringBuffer:append(self.ONLY_TARGETS)
            stringBuffer:appendboolean(waypointBehaviorBase:isWaypointListEmptyOrOnlyTargets())
            stringBuffer:append(self.SHORTER_THAN_CURRENT_TARGET_DISTANCE)
            stringBuffer:appendboolean(isShorterThanCurrentTargetDistance)
            stringBuffer:append(self.CURRENT_TARGET_DESTROYED)
            stringBuffer:appendboolean(isCurrentTargetDestroyed)
            stringBuffer:append(self.CURRENT_TARGET_NOT_AVAILABLE)
            stringBuffer:appendboolean((rawequal(waypointBehaviorBase:getCurrentTargetLayerInterface(), nil)))
            self.logUtil:putF(tostring(stringBuffer), self, self.PROCESS_POSSIBLE_TARGET)
        end
end
java_overload(Waypoint2SelectedLogHelper, "processPossibleTarget", 6, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) and (java_a3 == nil or java_is(java_a3, "PathFindingLayerInterface")) and type(java_a4) == "number" and type(java_a5) == "boolean" and type(java_a6) == "boolean" end)


function Waypoint2SelectedLogHelper:processSetTarget(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetingStateString())
        stringBuffer:append(self.ENEMY_POSSIBLE_TARGET)
        stringBuffer:append(layerInterface:getName())
        stringBuffer:append(" anotherTargetDistance: ")
        stringBuffer:appendint(anotherTargetDistance)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processPossibleTarget2")
end
java_overload(Waypoint2SelectedLogHelper, "processSetTarget", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) and (java_a3 == nil or java_is(java_a3, "PathFindingLayerInterface")) and type(java_a4) == "number" end)


function Waypoint2SelectedLogHelper:processPossibleTargetCloser(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetingStateString())
        stringBuffer:append(self.ENEMY_POSSIBLE_TARGET)
        stringBuffer:append(layerInterface:getName())
        stringBuffer:append(" anotherTargetDistance: ")
        stringBuffer:appendint(anotherTargetDistance)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processPossibleTarget3")
end
java_overload(Waypoint2SelectedLogHelper, "processPossibleTargetCloser", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) and (java_a3 == nil or java_is(java_a3, "PathFindingLayerInterface")) and type(java_a4) == "number" end)


function Waypoint2SelectedLogHelper:setTarget(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointBehaviorBase:getName())
        stringBuffer:append(" targeting: ")
        stringBuffer:append(layerInterface:getName())
        stringBuffer:append(" at: ")
        stringBuffer:appendint(anotherTargetDistance)
        stringBuffer:append(" instead of: ")
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetingStateString())
        self.logUtil:putF(tostring(stringBuffer), self, "selected: setTarget")
end
java_overload(Waypoint2SelectedLogHelper, "setTarget", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) and (java_a3 == nil or java_is(java_a3, "PathFindingLayerInterface")) and type(java_a4) == "number" end)


function Waypoint2SelectedLogHelper:setTargetPath(associatedAdvancedRTSGameLayer)
        self.logUtil:putF("Target Destroyed", self, "selected: setTargetPath")
end
java_overload(Waypoint2SelectedLogHelper, "setTargetPath", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function Waypoint2SelectedLogHelper:setTargetPathIgnoreNewPath(associatedAdvancedRTSGameLayer, waypointBehaviorBase)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Set Path To Target: ")
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetLayerInterface():getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentTargetLayerInterface()))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: setTargetPath")
end
java_overload(Waypoint2SelectedLogHelper, "setTargetPathIgnoreNewPath", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) end)


function Waypoint2SelectedLogHelper:processWaypoint(associatedAdvancedRTSGameLayer, waypointBehaviorBase, targetLayer, size)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Size: ")
        stringBuffer:appendint(size)
        stringBuffer:append(" Waypoint: ")
        stringBuffer:append(targetLayer:getName())
        stringBuffer:append(" Target: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentTargetLayerInterface()))
        stringBuffer:append(" isTrackingWaypoint: ")
        stringBuffer:appendboolean(waypointBehaviorBase:isTrackingWaypoint())
        stringBuffer:append(" WaypointOverridesAttacking: ")
        stringBuffer:appendboolean(waypointBehaviorBase:isWaypointOverridesAttacking())
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processWaypoint")
end
java_overload(Waypoint2SelectedLogHelper, "processWaypoint", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) and (java_a3 == nil or java_is(java_a3, "PathFindingLayerInterface")) and type(java_a4) == "number" end)


function Waypoint2SelectedLogHelper:processWaypointTracked(associatedAdvancedRTSGameLayer, waypointBehaviorBase)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" currentPathGeographicMapCellPosition: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentPathGeographicMapCellPosition()))
        stringBuffer:append(" nextUnvisitedPathGeographicMapCellPosition: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()))
        stringBuffer:append(" Tracked: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentGeographicMapCellHistory():getTracked()))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processWaypoint")
end
java_overload(Waypoint2SelectedLogHelper, "processWaypointTracked", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) end)


function Waypoint2SelectedLogHelper:processWaypointTrackedVisit(associatedAdvancedRTSGameLayer, geographicMapCellPosition)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Visited: ")
        stringBuffer:append(self.stringUtil:toString(geographicMapCellPosition))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processWaypoint")
end
java_overload(Waypoint2SelectedLogHelper, "processWaypointTrackedVisit", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


function Waypoint2SelectedLogHelper:processWaypointTrackedWithoutProgress(associatedAdvancedRTSGameLayer, reason)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(reason)), self, "turnTo")
end
java_overload(Waypoint2SelectedLogHelper, "processWaypointTrackedWithoutProgress", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or type(java_a2) == "string") end)


function Waypoint2SelectedLogHelper:wander(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(associatedAdvancedRTSGameLayer:getName(), self, "wander")
end
java_overload(Waypoint2SelectedLogHelper, "wander", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function Waypoint2SelectedLogHelper:targetDestroyed(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Target Destroyed")), self, "selected: processTargeting")
end
java_overload(Waypoint2SelectedLogHelper, "targetDestroyed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function Waypoint2SelectedLogHelper:processTargeting(associatedAdvancedRTSGameLayer, dx, dy)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DX_LABEL)
        stringBuffer:appendint(dx)
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DY_LABEL)
        stringBuffer:appendint(dy)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processTargeting")
end
java_overload(Waypoint2SelectedLogHelper, "processTargeting", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function Waypoint2SelectedLogHelper:processTargetingNonWayPoint(associatedAdvancedRTSGameLayer, dx, dy)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Targeting Non Waypoint ")
        stringBuffer:append(self.positionStrings.DX_LABEL)
        stringBuffer:appendint(dx)
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DY_LABEL)
        stringBuffer:appendint(dy)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processTargeting")
end
java_overload(Waypoint2SelectedLogHelper, "processTargetingNonWayPoint", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function Waypoint2SelectedLogHelper:removeWaypoint(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, waypointLayer, reason)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(unitWaypointBehavior2:getName())
        stringBuffer:append(" remove: ")
        stringBuffer:append(waypointLayer:getName())
        stringBuffer:append(" because: ")
        stringBuffer:append(reason)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: removeWaypoint")
end
java_overload(Waypoint2SelectedLogHelper, "removeWaypoint", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) and (java_a3 == nil or java_is(java_a3, "PathFindingLayerInterface")) and (java_a4 == nil or type(java_a4) == "string") end)


function Waypoint2SelectedLogHelper:removeWaypointList(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, list)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(unitWaypointBehavior2:getName())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:append(self.stringUtil:toString(list))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: removeWaypoint")
end
java_overload(Waypoint2SelectedLogHelper, "removeWaypointList", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) and (java_a3 == nil or java_is(java_a3, "BasicArrayList")) end)


function Waypoint2SelectedLogHelper:removeWaypointClear(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Clearing removed waypoint")), self, "selected: removeWaypoint")
end
java_overload(Waypoint2SelectedLogHelper, "removeWaypointClear", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function Waypoint2SelectedLogHelper:clearTarget(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Cleared Target")), self, "selected: clearTarget")
end
java_overload(Waypoint2SelectedLogHelper, "clearTarget", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function Waypoint2SelectedLogHelper:addWaypointFromUser(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Adding Waypoint to Selected: ")
        stringBuffer:append(advancedRTSGameLayer:getName())
        if not rawequal(advancedRTSGameLayer:getParentLayer(), nil) then
            stringBuffer:append(" With Parent: ")
            stringBuffer:append(advancedRTSGameLayer:getParentLayer():getName())
        end
        self.logUtil:putF(tostring(stringBuffer), self, "selected: onWaypointEvent")
end
java_overload(Waypoint2SelectedLogHelper, "addWaypointFromUser", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "PathFindingLayerInterface")) end)


function Waypoint2SelectedLogHelper:targetMovedSoRetarget(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" - target moved so retargeting")), self, "turnTo")
end
java_overload(Waypoint2SelectedLogHelper, "targetMovedSoRetarget", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)

Waypoint2SelectedLogHelper.instanceC = Waypoint2SelectedLogHelper.new()

return Waypoint2SelectedLogHelper

