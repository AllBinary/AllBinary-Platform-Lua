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
-- package org.allbinary.game.layer.waypoint

local MultipassNoCacheWaypoint = {}
package.loaded["org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint"] = MultipassNoCacheWaypoint

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

local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayerEvent = java_lazy("org.allbinary.game.layer.RTSLayerEvent")
local BuildingEventListenerInterface = java_lazy("org.allbinary.game.layer.building.event.BuildingEventListenerInterface")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local UnitWaypointBehavior = java_lazy("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local PathFindingInfoFactory = java_lazy("org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local CustomMapGenerator = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator")
local RaceTrackGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap")
local MultipassState = java_lazy("org.allbinary.media.graphics.geography.pathfinding.MultipassState")
local PathFindingInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathGenerator = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathGenerator")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local WaypointBase = require("org.allbinary.game.layer.waypoint.WaypointBase")

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

-- class table MultipassNoCacheWaypoint is declared before the requires
MultipassNoCacheWaypoint.__index = MultipassNoCacheWaypoint
MultipassNoCacheWaypoint.className = "MultipassNoCacheWaypoint"
MultipassNoCacheWaypoint.javaClassName = "org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint"
setmetatable(MultipassNoCacheWaypoint, {__index = WaypointBase})
MultipassNoCacheWaypoint.java_implements = " BuildingEventListenerInterface "
MultipassNoCacheWaypoint.java_interfaces = function() return {BuildingEventListenerInterface} end

function MultipassNoCacheWaypoint:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.ownerLayer == nil then self.ownerLayer = nil end
end


function MultipassNoCacheWaypoint._jinit(self, ownerLayer, sound)
    java_super_init(WaypointBase, self, sound)
    MultipassNoCacheWaypoint._init_fields(self)
        -- super(...) made self above
        self.ownerLayer = ownerLayer
    return self
end

function MultipassNoCacheWaypoint.new(...)
    local self = setmetatable({}, MultipassNoCacheWaypoint)
    MultipassNoCacheWaypoint._jinit(self, ...)
    return self
end


-- throws Exception
function MultipassNoCacheWaypoint:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(WaypointBase, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
end
java_overload(MultipassNoCacheWaypoint, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


function MultipassNoCacheWaypoint:releaseCachedPaths()
end
java_overload(MultipassNoCacheWaypoint, "releaseCachedPaths", 0)


-- throws Exception
function MultipassNoCacheWaypoint:getPathFindingInfo(geographicMapCellPosition)
        local startGeographicMapCellPosition = geographicMapCellPosition
        local endGeographicMapCellPosition = self:getEndGeographicMapCellPosition(startGeographicMapCellPosition)
        if rawequal(endGeographicMapCellPosition, nil) then
            return PathFindingInfo.NULL_PATH_FINDING_INFO
        end
        if rawequal(startGeographicMapCellPosition, endGeographicMapCellPosition) then
            if self.ownerLayer:shouldHandleStartSameAsEnd() then
                return PathFindingInfo.NULL_PATH_FINDING_INFO
            else
                error(require("java.lang.Exception").new(require("allbinary_java").to_string("Start should not be End: ") .. require("allbinary_java").to_string(endGeographicMapCellPosition)), 0)
            end
        end
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local raceTrackGeographicMap = geographicMapInterface
        local raceTrackGeographicMapCellTypeFactory = raceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local customMapGenerator = raceTrackGeographicMap:getCustomMapGenerator()
        customMapGenerator:copyMapIntoCustomMap()
        local customMapArray = customMapGenerator:getCustomMapArray()
        customMapArray[startGeographicMapCellPosition:getRow() + 1][startGeographicMapCellPosition:getColumn() + 1] = raceTrackGeographicMapCellTypeFactory:getStartType()
        customMapArray[endGeographicMapCellPosition:getRow() + 1][endGeographicMapCellPosition:getColumn() + 1] = raceTrackGeographicMapCellTypeFactory:getEndType()
        local pathFindingInfo = PathFindingInfoFactory.getInstance():getInstancePathFindingInfo(raceTrackGeographicMap, customMapArray)
        return pathFindingInfo
end
java_overload(MultipassNoCacheWaypoint, "getPathFindingInfo", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


-- throws Exception
function MultipassNoCacheWaypoint:getPathsList(geographicMapCellPosition, pathFindingInfo, multipassState)
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(pathFindingInfo, nil) then
                self.logUtil:putF(require("allbinary_java").to_string("pathFindingInfo: ") .. require("allbinary_java").to_string(pathFindingInfo), self, "getPathsList")
                do return "__jreturn", BasicArrayListUtil.getInstance():getImmutableInstance() end
            end
            local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            local list = PathGenerator.getInstance():createN(geographicMapInterface, pathFindingInfo, 2, multipassState)
            if not rawequal(list, nil) and not rawequal(list, BasicArrayListUtil.getInstance():getImmutableInstance()) then
                if list:size() < 1 then
                    error(require("java.lang.Exception").new("Path may have been cleared by clearing caching"), 0)
                end
                do return "__jreturn", list end
            end
            do return "__jreturn", BasicArrayListUtil.getInstance():getImmutableInstance() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "getPathsList", e)
            return BasicArrayListUtil.getInstance():getImmutableInstance()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(MultipassNoCacheWaypoint, "getPathsList", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) and (java_a2 == nil or java_is(java_a2, "PathFindingInfo")) and (java_a3 == nil or java_is(java_a3, "MultipassState")) end)


-- throws Exception
function MultipassNoCacheWaypoint:getEndGeographicMapCellPosition(startGeographicMapCellPosition)
        local endList = self.ownerLayer:getEndGeographicMapCellPositionList()
        local endGeographicMapCellPosition = BasicArrayListUtil.getInstance():getRandom(endList)
        if rawequal(startGeographicMapCellPosition, endGeographicMapCellPosition) then
            for index = endList:size() - 1, 0, -1 do
                endGeographicMapCellPosition = endList:get(index)
                if not rawequal(startGeographicMapCellPosition, endGeographicMapCellPosition) then
                    break
                end
            end
        end
        return endGeographicMapCellPosition
end
java_overload(MultipassNoCacheWaypoint, "getEndGeographicMapCellPosition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


function MultipassNoCacheWaypoint:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(MultipassNoCacheWaypoint, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


-- throws Exception
function MultipassNoCacheWaypoint:onBuildingEvent(event)
end
java_overload(MultipassNoCacheWaypoint, "onBuildingEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayerEvent")) end)


function MultipassNoCacheWaypoint:reset()
        self:getConnectedWaypointList():clear()
end
java_overload(MultipassNoCacheWaypoint, "reset", 0)


-- throws Exception
function MultipassNoCacheWaypoint:visit(unitLayer)
        if not rawequal(unitLayer:getGroupInterface()[1], self.ownerLayer:getGroupInterface()[1]) then
            return
        end
        local size = self:getConnectedWaypointList():size()
        if size > 0 then
            local unitWaypointBehavior = unitLayer:getWaypointBehavior()
            while self:getConnectedWaypointList():size() > 0 do
                local rtsLayer = self:getConnectedWaypointList():get(0)
                if rtsLayer:isDestroyed() then
                    self:getConnectedWaypointList():remove(rtsLayer)
                else
                    unitLayer:handleCost(self.ownerLayer)
                    unitWaypointBehavior:insertWaypoint(0, rtsLayer)
                    break
                end
            end
        end
end
java_overload(MultipassNoCacheWaypoint, "visit", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)

return MultipassNoCacheWaypoint

