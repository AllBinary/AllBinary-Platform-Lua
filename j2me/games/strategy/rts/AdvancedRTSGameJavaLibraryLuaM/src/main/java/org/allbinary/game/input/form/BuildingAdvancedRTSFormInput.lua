-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.game.input.form

local BuildingAdvancedRTSFormInput = {}
package.loaded["org.allbinary.game.input.form.BuildingAdvancedRTSFormInput"] = BuildingAdvancedRTSFormInput

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

local AdvancedPlayerOwnedRTSLayers = java_lazy("org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers")
local AdvancedRTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSLayerEvent = java_lazy("org.allbinary.game.layer.RTSLayerEvent")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local BuildingEventHandler = java_lazy("org.allbinary.game.layer.building.event.BuildingEventHandler")
local LocalPlayerBuildingEventHandler = java_lazy("org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler")
local WaypointCellPositionHistory = java_lazy("org.allbinary.game.layer.waypoint.WaypointCellPositionHistory")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local Group = java_lazy("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local GameNotificationEvent = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = java_lazy("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local BuildingRTSFormInput = require("org.allbinary.game.input.form.BuildingRTSFormInput")

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

-- class table BuildingAdvancedRTSFormInput is declared before the requires
BuildingAdvancedRTSFormInput.__index = BuildingAdvancedRTSFormInput
BuildingAdvancedRTSFormInput.className = "BuildingAdvancedRTSFormInput"
BuildingAdvancedRTSFormInput.javaClassName = "org.allbinary.game.input.form.BuildingAdvancedRTSFormInput"
setmetatable(BuildingAdvancedRTSFormInput, {__index = BuildingRTSFormInput})

function BuildingAdvancedRTSFormInput:_init_fields()
    if self.atLeastOneHouseGameNotificationEvent == nil then self.atLeastOneHouseGameNotificationEvent = nil end
    self.BUILD_BUILDING_RTS_LAYER_EVENT = RTSLayerEvent.new(NullPathFindingLayer.NULL_PATH_FINDING_LAYER)
end


function BuildingAdvancedRTSFormInput._jinit(self, groupInterface, isUnitProducer)
    java_super_init(BuildingRTSFormInput, self, groupInterface, isUnitProducer)
    BuildingAdvancedRTSFormInput._init_fields(self)
        -- super(...) made self above
        local basicColorFactory = BasicColorFactory.getInstance()
        self.atLeastOneHouseGameNotificationEvent = GameNotificationEvent.new(self, "Build At Least One House First", SmallIntegerSingletonFactory.getInstance():getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
    return self
end

function BuildingAdvancedRTSFormInput.new(...)
    local self = setmetatable({}, BuildingAdvancedRTSFormInput)
    BuildingAdvancedRTSFormInput._jinit(self, ...)
    return self
end


-- throws Exception
function BuildingAdvancedRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(BuildingRTSFormInput, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.atLeastOneHouseGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end
java_overload(BuildingAdvancedRTSFormInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


function BuildingAdvancedRTSFormInput:isPositionBlocked()
        if DropCellPositionHistory.getInstance():isCellPositionWithDrop(self:getSelectedGeographicCellPosition()) or WaypointCellPositionHistory.getInstance():isCellPositionWithDrop(self:getSelectedGeographicCellPosition()) then
            return true
        else
            return false
        end
end
java_overload(BuildingAdvancedRTSFormInput, "isPositionBlocked", 0)


-- throws Exception
function BuildingAdvancedRTSFormInput:isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface)
        local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
        local advancedPlayerOwnedRTSLayers = advancedRTSPlayerLayerInterface:getAdvancedPlayerOwnedRTSLayers()
        local totalHouses = advancedPlayerOwnedRTSLayers:getHouseList():size()
        if totalHouses < 1 and layerInterface:getName():indexOf(" House") < 0 then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.atLeastOneHouseGameNotificationEvent)
            end
            return false
        end
        return java_super(BuildingRTSFormInput, "isBuildAttemptValid", 2)(self, rtsPlayerLayerInterface, layerInterface)
end
java_overload(BuildingAdvancedRTSFormInput, "isBuildAttemptValid", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "RTSLayer")) end)


-- throws Exception
function BuildingAdvancedRTSFormInput:add(rtsPlayerLayerInterface, layerManager, layerInterface)
        self.BUILD_BUILDING_RTS_LAYER_EVENT:setRtsLayer(layerInterface)
        BuildingEventHandler.getInstance():fireEvent(self.BUILD_BUILDING_RTS_LAYER_EVENT)
        if (rtsPlayerLayerInterface):isLocalPlayer() then
            LocalPlayerBuildingEventHandler.getInstance():fireEvent(self.BUILD_BUILDING_RTS_LAYER_EVENT)
        end
        java_super(BuildingRTSFormInput, "add", 3)(self, rtsPlayerLayerInterface, layerManager, layerInterface)
end
java_overload(BuildingAdvancedRTSFormInput, "add", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayerManager")) and (java_a3 == nil or java_is(java_a3, "RTSLayer")) end)

return BuildingAdvancedRTSFormInput

