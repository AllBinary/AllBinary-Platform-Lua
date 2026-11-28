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
-- package org.allbinary.game.input.form

local WaypointRTSFormInput = {}
package.loaded["org.allbinary.game.input.form.WaypointRTSFormInput"] = WaypointRTSFormInput

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local RTSPlayerGameInput = java_lazy("org.allbinary.game.input.RTSPlayerGameInput")
local AdvancedRTSGameLayer = java_lazy("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local RTSGameStrings = java_lazy("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSLayerEvent = java_lazy("org.allbinary.game.layer.RTSLayerEvent")
local RTSLayerUtil = java_lazy("org.allbinary.game.layer.RTSLayerUtil")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = java_lazy("org.allbinary.game.layer.capital.Capital")
local WaypointCellPositionHistory = java_lazy("org.allbinary.game.layer.waypoint.WaypointCellPositionHistory")
local WaypointLayer = java_lazy("org.allbinary.game.layer.waypoint.WaypointLayer")
local WaypointEventHandlerFactory = java_lazy("org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local Group = java_lazy("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local GeographicMapCellPositionAreaBase = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local NullRTSLayer = java_lazy("org.allbinary.game.layer.NullRTSLayer")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local GameNotificationEvent = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local Layer = java_lazy("org.allbinary.layer.Layer")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = java_lazy("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local RaceTrackGeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local PrimaryWaypointHelper = java_lazy("org.allbinary.game.input.form.PrimaryWaypointHelper")

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

-- class table WaypointRTSFormInput is declared before the requires
WaypointRTSFormInput.__index = WaypointRTSFormInput
WaypointRTSFormInput.className = "WaypointRTSFormInput"
WaypointRTSFormInput.javaClassName = "org.allbinary.game.input.form.WaypointRTSFormInput"
setmetatable(WaypointRTSFormInput, {__index = RTSFormInput})

function WaypointRTSFormInput:_init_fields()
    self.WAYPOINT_EVENT = RTSLayerEvent.new(NullRTSLayer.NULL_RTS_LAYER)
    if self.dragToSpotGameNotificationEvent == nil then self.dragToSpotGameNotificationEvent = nil end
    if self.spotTakenGameNotificationEvent == nil then self.spotTakenGameNotificationEvent = nil end
    if self.buildingCollisionGameNotificationEvent == nil then self.buildingCollisionGameNotificationEvent = nil end
    if self.roadCollisionGameNotificationEvent == nil then self.roadCollisionGameNotificationEvent = nil end
    if self.newWaypointGameNotificationEvent == nil then self.newWaypointGameNotificationEvent = nil end
    if self.noMoneyGameNotificationEvent == nil then self.noMoneyGameNotificationEvent = nil end
    if self.isPrimaryWaypointCreator == nil then self.isPrimaryWaypointCreator = false end
    self.stickyAssociatedRtsLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
end


function WaypointRTSFormInput._jinit(self, groupInterface, isPrimaryWaypointCreator)
    java_super_init(RTSFormInput, self, groupInterface)
    WaypointRTSFormInput._init_fields(self)
        -- super(...) made self above
        self.isPrimaryWaypointCreator = isPrimaryWaypointCreator
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local basicColorFactory = BasicColorFactory.getInstance()
        self.dragToSpotGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().DRAG_TO_SPOT, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self.spotTakenGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().SPOT_TAKEN, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self.buildingCollisionGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().BUILDING_COLLISION, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self.roadCollisionGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().ROAD_COLLISION, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self.newWaypointGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NEW_WAYPOINT, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self.noMoneyGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
    return self
end

function WaypointRTSFormInput.new(...)
    local self = setmetatable({}, WaypointRTSFormInput)
    WaypointRTSFormInput._jinit(self, ...)
    return self
end


-- throws Exception
function WaypointRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(RTSFormInput, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.dragToSpotGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.spotTakenGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.buildingCollisionGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.roadCollisionGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.newWaypointGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.noMoneyGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end
java_overload(WaypointRTSFormInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function WaypointRTSFormInput:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        java_super(RTSFormInput, "process", 1)(self, layerManager)
        if self:isStickyItemSelected() or rawequal(associatedRtsLayer, CollidableDestroyableDamageableLayer.getNullInstance()) then
            if self:isStickyItemSelected() and rawequal(associatedRtsLayer, CollidableDestroyableDamageableLayer.getNullInstance()) then
                local geographicMapCompositeInterface = layerManager
                local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
                local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
                local x = point:getX() + allBinaryTiledLayer:getXP()
                local y = point:getY() + allBinaryTiledLayer:getYP()
                local geographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(x, y)
                self:processCellPosition(rtsPlayerLayerInterface, layerManager, geographicMapCellPosition)
            else
                if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                    GameNotificationEventHandler.getInstance():fireEvent(self.dragToSpotGameNotificationEvent)
                end
            end
        else
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.spotTakenGameNotificationEvent)
            end
        end
end
java_overload(WaypointRTSFormInput, "processAtPoint", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "GPoint")) end)


-- throws Exception
function WaypointRTSFormInput:processCellPosition(rtsPlayerLayerInterface, layerManager, geographicMapCellPosition)
        local itemIndex = self:getSelectedStickyItemIndex()
        if rawequal(self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1], CollidableDestroyableDamageableLayer.getNullInstance()) then
            self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] = self:getInstance(layerManager, self:getSelectedStickyItem(), geographicMapCellPosition)
        else
            local cellPoint = geographicMapCellPosition:getPoint()
            local rtsLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
            rtsLayer:setPosition(cellPoint:getX(), cellPoint:getY(), rtsLayer:getZP())
            local geographicMapCompositeInterface = rtsLayer.allBinaryGameLayerManagerP
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            rtsLayer.geographicMapCellPositionAreaBase:update(geographicMapInterface)
        end
        self:attemptBuild(rtsPlayerLayerInterface, layerManager, self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1], itemIndex)
end
java_overload(WaypointRTSFormInput, "processCellPosition", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayerManager")) and (java_a3 == nil or java_is(java_a3, "GeographicMapCellPosition")) end)


-- throws Exception
function WaypointRTSFormInput:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        self.logUtil:putF(require("allbinary_java").to_string("Set Sticking Item: ") .. require("allbinary_java").to_string(item), self, "processSticky")
        self:setSelectedStickyItem(item)
        self:setSelectedStickyItemIndex(index)
        self:setStickyItemSelected(true)
        self.stickyAssociatedRtsLayer = associatedRtsLayer
        self:getHashtable():put(Layer.ID, associatedRtsLayer)
end
java_overload(WaypointRTSFormInput, "processStickyGameSpecific", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "ABCustomItem")) and type(java_a5) == "number" end)


-- throws Exception
function WaypointRTSFormInput:attemptBuild(rtsPlayerLayerInterface, layerManager, layerInterface, itemIndex)
        self.logUtil:putF(require("allbinary_java").to_string("Layer: ") .. require("allbinary_java").to_string(layerInterface), self, "attemptBuild")
        if rawequal(layerInterface, nil) then
            self.logUtil:put("Layer was null", self, "attemptBuild", require("java.lang.Exception").new())
            return false
        end
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local list = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        if DropCellPositionHistory.getInstance():anyCellPositionWithDrop(list) or WaypointCellPositionHistory.getInstance():anyCellPositionWithDrop(list) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.buildingCollisionGameNotificationEvent)
            end
            return false
        end
        local geographicMapCompositeInterface = layerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local raceTrackGeographicMapCellTypeFactory = geographicMapInterface:getGeographicMapCellTypeFactory()
        local geographicMapCellType = nil
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            geographicMapCellType = geographicMapInterface:getCellTypeAt(list:get(index))
            if raceTrackGeographicMapCellTypeFactory:isPath(geographicMapCellType) then
                rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                    GameNotificationEventHandler.getInstance():fireEvent(self.roadCollisionGameNotificationEvent)
                end
                return false
            end
            end
        end
        local cost = layerInterface:getCost()
        local capital = rtsPlayerLayerInterface:getCapital()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Trying to Build: ")
        stringBuffer:append(layerInterface:getName())
        stringBuffer:append(" for: $")
        stringBuffer:appendint(cost)
        stringBuffer:append(" with ")
        stringBuffer:appendint(java_int(capital:getTotalMoney()))
        self.logUtil:putF(tostring(stringBuffer), self, "attemptBuild")
        if cost <= capital:getTotalMoney() then
            layerInterface:construct(rtsPlayerLayerInterface)
            self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] = CollidableDestroyableDamageableLayer.getNullInstance()
            capital:removeMoney(cost)
            WaypointCellPositionHistory.getInstance():addList(list, layerInterface)
            local geographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(layerInterface:getXP(), layerInterface:getYP())
            local waypointLayer = layerInterface
            self:addWayPoint(waypointLayer)
            local rtsPlayerGameInput = rtsPlayerLayerInterface:getPlayerGameInput()
            rtsPlayerGameInput:setSelectedRTSLayer(layerInterface, geographicMapCellPosition)
            local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
            advancedRTSPlayerLayerInterface:getAdvancedPlayerOwnedRTSLayers():addWaypoint(layerInterface)
            layerManager:append(layerInterface)
            local waypointAvancedRTSGameLayer = waypointLayer
            rtsPlayerLayerInterface:add(waypointAvancedRTSGameLayer:getWaypointBehavior():getWaypoint():getSound())
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.newWaypointGameNotificationEvent)
            end
            return true
        else
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.noMoneyGameNotificationEvent)
            end
            return false
        end
end
java_overload(WaypointRTSFormInput, "attemptBuild", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayerManager")) and (java_a3 == nil or java_is(java_a3, "RTSLayer")) and type(java_a4) == "number" end)


-- throws Exception
function WaypointRTSFormInput:addWayPoint(layerInterface)
        local stickyAssociatedAdvandedRtsLayer = self.stickyAssociatedRtsLayer
        local list = stickyAssociatedAdvandedRtsLayer:getWaypointBehavior():getOwnedWaypointList()
        RTSLayerUtil.getInstance():destroyAndClear(list)
        list:add(layerInterface)
        if self.isPrimaryWaypointCreator then
            PrimaryWaypointHelper.getInstance():setWaypointLayer(layerInterface)
        end
        self.WAYPOINT_EVENT:setRtsLayer(layerInterface)
        WaypointEventHandlerFactory.getInstance(layerInterface:getGroupInterface()[1]):fireEvent(self.WAYPOINT_EVENT)
end
java_overload(WaypointRTSFormInput, "addWayPoint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "WaypointLayer")) end)

return WaypointRTSFormInput

