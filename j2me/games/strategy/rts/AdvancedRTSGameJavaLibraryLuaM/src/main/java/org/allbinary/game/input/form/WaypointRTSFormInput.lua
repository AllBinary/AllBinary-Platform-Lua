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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local RTSPlayerGameInput = require("org.allbinary.game.input.RTSPlayerGameInput")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSPlayerLayerInterface = require("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local RTSGameStrings = require("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local RTSLayerUtil = require("org.allbinary.game.layer.RTSLayerUtil")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = require("org.allbinary.game.layer.capital.Capital")
local WaypointCellPositionHistory = require("org.allbinary.game.layer.waypoint.WaypointCellPositionHistory")
local WaypointLayer = require("org.allbinary.game.layer.waypoint.WaypointLayer")
local WaypointEventHandlerFactory = require("org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Group = require("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local GeographicMapCellPositionAreaBase = require("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local NullRTSLayer = require("org.allbinary.game.layer.NullRTSLayer")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local Layer = require("org.allbinary.layer.Layer")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local RaceTrackGeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointRTSFormInput = {}
WaypointRTSFormInput.__index = WaypointRTSFormInput
WaypointRTSFormInput.className = "WaypointRTSFormInput"
setmetatable(WaypointRTSFormInput, {__index = RTSFormInput})

function WaypointRTSFormInput:_init_fields()
    self.WAYPOINT_EVENT = RTSLayerEvent.new(NullRTSLayer.NULL_RTS_LAYER)
    self.dragToSpotGameNotificationEvent = nil
    self.spotTakenGameNotificationEvent = nil
    self.buildingCollisionGameNotificationEvent = nil
    self.roadCollisionGameNotificationEvent = nil
    self.newWaypointGameNotificationEvent = nil
    self.noMoneyGameNotificationEvent = nil
    self.isPrimaryWaypointCreator = nil
    self.stickyAssociatedRtsLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
end


function WaypointRTSFormInput.new(groupInterface, isPrimaryWaypointCreator)
    local self = setmetatable(RTSFormInput.new(groupInterface), WaypointRTSFormInput)
    self:_init_fields()
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


-- throws Exception
function WaypointRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        RTSFormInput.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.dragToSpotGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.spotTakenGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.buildingCollisionGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.roadCollisionGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.newWaypointGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.noMoneyGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end


-- throws Exception
function WaypointRTSFormInput:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        RTSFormInput.process(self, layerManager)
        if self:isStickyItemSelected() or associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance() then
            if self:isStickyItemSelected() and associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance() then
                local geographicMapCompositeInterface = layerManager
                local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
                local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
                local x = point:getX() + allBinaryTiledLayer:getXP()
                local y = point:getY() + allBinaryTiledLayer:getYP()
                local geographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(x, y)
                self:processCellPosition(rtsPlayerLayerInterface, layerManager, geographicMapCellPosition)
            else
                if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                    GameNotificationEventHandler.getInstance():fireEvent(self.dragToSpotGameNotificationEvent)
                end
            end
        else
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.spotTakenGameNotificationEvent)
            end
        end
end


-- throws Exception
function WaypointRTSFormInput:processCellPosition(rtsPlayerLayerInterface, layerManager, geographicMapCellPosition)
        local itemIndex = self:getSelectedStickyItemIndex()
        if self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] == CollidableDestroyableDamageableLayer.getNullInstance() then
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


-- throws Exception
function WaypointRTSFormInput:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        self.logUtil:putF("Set Sticking Item: " .. tostring(item), self, "processSticky")
        self:setSelectedStickyItem(item)
        self:setSelectedStickyItemIndex(index)
        self:setStickyItemSelected(true)
        self.stickyAssociatedRtsLayer = associatedRtsLayer
        self:getHashtable():put(Layer.ID, associatedRtsLayer)
end


-- throws Exception
function WaypointRTSFormInput:attemptBuild(rtsPlayerLayerInterface, layerManager, layerInterface, itemIndex)
        self.logUtil:putF("Layer: " .. tostring(layerInterface), self, "attemptBuild")
        if layerInterface == nil then
            self.logUtil:put("Layer was null", self, "attemptBuild", java_exception("Exception"))
            return false
        end
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local list = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        if DropCellPositionHistory.getInstance():anyCellPositionWithDrop(list) or WaypointCellPositionHistory.getInstance():anyCellPositionWithDrop(list) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
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
                if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
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
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.newWaypointGameNotificationEvent)
            end
            return true
        else
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.noMoneyGameNotificationEvent)
            end
            return false
        end
end


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

return WaypointRTSFormInput

