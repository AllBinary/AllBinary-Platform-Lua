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

local WaypointSelectedLogHelper = {}
package.loaded["org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper"] = WaypointSelectedLogHelper

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
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local WaypointLogHelper = require("org.allbinary.game.layer.waypoint.WaypointLogHelper")

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

-- class table WaypointSelectedLogHelper is declared before the requires
WaypointSelectedLogHelper.__index = WaypointSelectedLogHelper
WaypointSelectedLogHelper.className = "WaypointSelectedLogHelper"
WaypointSelectedLogHelper.javaClassName = "org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper"
setmetatable(WaypointSelectedLogHelper, {__index = WaypointLogHelper})

function WaypointSelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.stringUtil = StringUtil.getInstance()
end

function WaypointSelectedLogHelper._jinit(self)
    java_super_init(WaypointLogHelper, self)
    WaypointSelectedLogHelper._init_fields(self)
    return self
end

function WaypointSelectedLogHelper.new()
    return WaypointSelectedLogHelper._jinit(setmetatable({}, WaypointSelectedLogHelper))
end


function WaypointSelectedLogHelper.getInstance()
        return WaypointSelectedLogHelper.instanceC
end


function WaypointSelectedLogHelper:onWaypointEvent(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" onWaypointEvent: ")
        stringBuffer:append(advancedRTSGameLayer:getName())
        if not rawequal(advancedRTSGameLayer:getParentLayer(), nil) then
            stringBuffer:append(" With Parent: ")
            stringBuffer:append(advancedRTSGameLayer:getParentLayer():getName())
        end
        self.logUtil:putF(tostring(stringBuffer), self, "onWaypointEvent")
end
java_overload(WaypointSelectedLogHelper, "onWaypointEvent", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "PathFindingLayerInterface")) end)


function WaypointSelectedLogHelper:addWaypointFromBuilding(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Adding Waypoint: ")
        stringBuffer:append(advancedRTSGameLayer:getName())
        if not rawequal(advancedRTSGameLayer:getParentLayer(), nil) then
            stringBuffer:append(" With Parent: ")
            stringBuffer:append(advancedRTSGameLayer:getParentLayer():getName())
        end
        self.logUtil:putF(tostring(stringBuffer), self, "selected: onWaypointEvent")
end
java_overload(WaypointSelectedLogHelper, "addWaypointFromBuilding", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "PathFindingLayerInterface")) end)


function WaypointSelectedLogHelper:addWaypointFromBuildingList(associatedAdvancedRTSGameLayer, advancedRTSGameLayer, list)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:append(self.stringUtil:toString(list))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: onWaypointEvent")
end
java_overload(WaypointSelectedLogHelper, "addWaypointFromBuildingList", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "PathFindingLayerInterface")) and (java_a3 == nil or java_is(java_a3, "BasicArrayList")) end)


function WaypointSelectedLogHelper:insertWaypoint(associatedAdvancedRTSGameLayer, index, rtsLayer, waypointName)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointName)
        stringBuffer:append(" Insert: ")
        stringBuffer:append(rtsLayer:getName())
        stringBuffer:append(" for Waypoint: ")
        self.logUtil:putF(tostring(stringBuffer), self, "selected: insertWaypoint")
end
java_overload(WaypointSelectedLogHelper, "insertWaypoint", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "CollidableDestroyableDamageableLayer")) and (java_a4 == nil or type(java_a4) == "string") end)


function WaypointSelectedLogHelper:insertWaypointList(associatedAdvancedRTSGameLayer, index, rtsLayer, waypointName, list)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointName)
        stringBuffer:append(" Insert: ")
        stringBuffer:append(rtsLayer:getName())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:append(self.stringUtil:toString(list))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: insertWaypoint")
end
java_overload(WaypointSelectedLogHelper, "insertWaypointList", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "CollidableDestroyableDamageableLayer")) and (java_a4 == nil or type(java_a4) == "string") and (java_a5 == nil or java_is(java_a5, "BasicArrayList")) end)


function WaypointSelectedLogHelper:setRandomGeographicMapCellHistoryList(associatedAdvancedRTSGameLayer, pathsList)
        local size = pathsList:size()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(CommonLabels.getInstance().START)
        stringBuffer:appendint(size)
        stringBuffer:append(" -> ")
        stringBuffer:append(self.stringUtil:toString(pathsList))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: setRandomGeographicMapCellHistory")
end
java_overload(WaypointSelectedLogHelper, "setRandomGeographicMapCellHistoryList", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) end)


function WaypointSelectedLogHelper:moveAwayFromBuilding(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Trying to move away from building")), self, "selected: moveAwayFromBuilding")
end
java_overload(WaypointSelectedLogHelper, "moveAwayFromBuilding", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function WaypointSelectedLogHelper:needToMove(associatedAdvancedRTSGameLayer, unitWaypointBehavior)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(unitWaypointBehavior:getMovementLogicAsString())), self, "needToMove")
end
java_overload(WaypointSelectedLogHelper, "needToMove", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "WaypointBehaviorBase")) end)


function WaypointSelectedLogHelper:setRandomGeographicMapCellHistory(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" pathsList is null")), self, "setRandomGeographicMapCellHistory")
end
java_overload(WaypointSelectedLogHelper, "setRandomGeographicMapCellHistory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)


function WaypointSelectedLogHelper:setCurrentPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer, existingCurrentPathGeographicMapCellPosition, currentPathGeographicMapCellPosition)
        if rawequal(existingCurrentPathGeographicMapCellPosition, nil) then
            self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" currentPathGeographicMapCellPosition: "):append(self.stringUtil:toString(currentPathGeographicMapCellPosition))), self, "setCurrentPathGeographicMapCellPosition")
        end
end
java_overload(WaypointSelectedLogHelper, "setCurrentPathGeographicMapCellPosition", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) and (java_a3 == nil or java_is(java_a3, "GeographicMapCellPosition")) end)


function WaypointSelectedLogHelper:setNextUnvisitedPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer, existingNextUnvisitedPathGeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition)
        if not rawequal(existingNextUnvisitedPathGeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition) then
            self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" nextUnvisitedPathGeographicMapCellPosition: "):append(self.stringUtil:toString(nextUnvisitedPathGeographicMapCellPosition))), self, "setNextUnvisitedPathGeographicMapCellPosition")
        end
end
java_overload(WaypointSelectedLogHelper, "setNextUnvisitedPathGeographicMapCellPosition", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) and (java_a3 == nil or java_is(java_a3, "GeographicMapCellPosition")) end)

WaypointSelectedLogHelper.instanceC = WaypointSelectedLogHelper.new()

return WaypointSelectedLogHelper

