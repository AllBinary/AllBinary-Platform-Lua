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
-- package org.allbinary.game.input.form

local RTSPlayerGameInput = require("org.allbinary.game.input.RTSPlayerGameInput")
local DemoLockedWithCostLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.DemoLockedWithCostLayerInterfaceFactoryInterface")
local GeographicMapCellPositionAreaBase = require("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local RTSGameStrings = require("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = require("org.allbinary.game.layer.capital.Capital")
local LayerInterfaceFactoryImageItem = require("org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local BuildingSound = require("org.allbinary.media.audio.BuildingSound")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local LockedFeatureNotificationUtil = require("org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil")
local LockedUtil = require("org.allbinary.logic.system.security.licensing.LockedUtil")
local Group = require("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
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

local BuildingRTSFormInput = {}
BuildingRTSFormInput.__index = BuildingRTSFormInput
BuildingRTSFormInput.className = "BuildingRTSFormInput"
setmetatable(BuildingRTSFormInput, {__index = RTSFormInput})

function BuildingRTSFormInput:_init_fields()
    self.isUnitProducer = nil
    self.buildOnPathGameNotificationEvent = nil
    self.spotTakenGameNotificationEvent = nil
    self.selectBuildSpotGameNotificationEvent = nil
    self.roadCollisionGameNotificationEvent = nil
    self.noMoneyGameNotificationEvent = nil
    self.buildingCollisionGameNotificationEvent = nil
    self.structureToCloseCollisionGameNotificationEvent = nil
    self.buildingGameNotificationEvent = nil
    self.mapEdgeGameNotificationEvent = nil
    self.dropCellPositionHistory = DropCellPositionHistory.getInstance()
end


function BuildingRTSFormInput.new(groupInterface, isUnitProducer)
    local self = setmetatable(RTSFormInput.new(groupInterface), BuildingRTSFormInput)
    self:_init_fields()
        -- super(...) made self above
        self.isUnitProducer = isUnitProducer
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local basicColorFactory = BasicColorFactory.getInstance()
        self.buildOnPathGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().BUILD_ON_PATH, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.spotTakenGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().SPOT_TAKEN, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.selectBuildSpotGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().SELECT_BUILD_SPOT, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.roadCollisionGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().ROAD_COLLISION, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.noMoneyGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.buildingCollisionGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().BUILDING_COLLISION, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.structureToCloseCollisionGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().STRUCTURE_TO_CLOSE, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.buildingGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().BUILDING, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.mapEdgeGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().MAP_EDGE, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
    return self
end


-- throws Exception
function BuildingRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        RTSFormInput.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.buildOnPathGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.spotTakenGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.selectBuildSpotGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.roadCollisionGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.noMoneyGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.buildingCollisionGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.structureToCloseCollisionGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.buildingGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.mapEdgeGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end


-- throws Exception
function BuildingRTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, itemIndex)
        RTSFormInput.process(self, layerManager)
        self:buildFromMotionInput(rtsPlayerLayerInterface, layerManager, item, itemIndex)
end


function BuildingRTSFormInput:isPositionBlocked()
        return self.dropCellPositionHistory:isCellPositionWithDrop(self:getSelectedGeographicCellPosition())
end


function BuildingRTSFormInput:isDemoLocked(item)
        local factoryItem = item
        local layerInterfaceFactoryInterface = factoryItem:getLayerInterfaceFactoryInterface()
        if LockedUtil.getInstance():isLocked() and layerInterfaceFactoryInterface:isDemoLocked() then
            return true
        else
            return false
        end
end


-- throws Exception
function BuildingRTSFormInput:buildFromMotionInput(rtsPlayerLayerInterface, layerManager, item, itemIndex)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(commonStrings.START, self, "buildFromMotionInput")
        if layerManager == nil then
            error(java_exception("RuntimeException"), 0)
        end
        local geographicMapCompositeInterface = layerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        if self:isDemoLocked(item) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            LockedFeatureNotificationUtil.getInstance():fireWithColor(geographicMapInterface:getForegroundBasicColor())
            return
        end
        local geographicMapCellPosition = self:getSelectedGeographicCellPosition()
        if geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            if not self:isPositionBlocked() then
                local geographicMapCellType = geographicMapInterface:getCellTypeAt(geographicMapCellPosition)
                local raceTrackGeographicMapCellTypeFactory = geographicMapInterface:getGeographicMapCellTypeFactory()
                if not raceTrackGeographicMapCellTypeFactory:isPath(geographicMapCellType) then
                    if self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] == CollidableDestroyableDamageableLayer.getNullInstance() then
                        self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] = self:getInstance(layerManager, item, geographicMapCellPosition)
                    else
                        local rtsLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
                        local cellPoint = geographicMapCellPosition:getPoint()
                        rtsLayer:setPosition(cellPoint:getX(), cellPoint:getY(), cellPoint:getZ())
                        rtsLayer.geographicMapCellPositionAreaBase:update(geographicMapInterface)
                    end
                    local rtsLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
                    self:attemptBuild(rtsPlayerLayerInterface, layerManager, rtsLayer, itemIndex)
                else
                    rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                    if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                        GameNotificationEventHandler.getInstance():fireEvent(self.buildOnPathGameNotificationEvent)
                    end
                end
            else
                rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                    GameNotificationEventHandler.getInstance():fireEvent(self.spotTakenGameNotificationEvent)
                end
            end
        else
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.selectBuildSpotGameNotificationEvent)
            end
        end
end


-- throws Exception
function BuildingRTSFormInput:attemptBuild(rtsPlayerLayerInterface, layerManager, layerInterface, itemIndex)
        self.logUtil:putF(tostring(StringMaker.new():append("Layer: "):append(StringUtil.getInstance():toString(layerInterface))), self, "attemptBuild")
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        if not self:isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface) then
            return false
        end
        local geographicMapCellType = nil
        for index = occupyList:size() - 1, 0, -1 do
            local geographicMapCompositeInterface = layerManager
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            geographicMapCellType = geographicMapInterface:getCellTypeAt(occupyList:get(index))
            local raceTrackGeographicMapCellTypeFactory = geographicMapInterface:getGeographicMapCellTypeFactory()
            if raceTrackGeographicMapCellTypeFactory:isPath(geographicMapCellType) then
                rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                    GameNotificationEventHandler.getInstance():fireEvent(self.roadCollisionGameNotificationEvent)
                end
                return false
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
            self:add(rtsPlayerLayerInterface, layerManager, layerInterface)
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
function BuildingRTSFormInput:isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface)
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        if self.dropCellPositionHistory:anyCellPositionWithDrop(occupyList) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.buildingCollisionGameNotificationEvent)
            end
            return false
        end
        if self.isUnitProducer and self.dropCellPositionHistory:anyCellPositionWithDrop(geographicMapCellPositionArea:getSurroundingGeographicMapCellPositionList()) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.structureToCloseCollisionGameNotificationEvent)
            end
            return false
        else
            if self:isSurroundingCellsOffMap(layerInterface) then
                rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                    GameNotificationEventHandler.getInstance():fireEvent(self.mapEdgeGameNotificationEvent)
                end
                return false
            end
        end
        return true
end


-- throws Exception
function BuildingRTSFormInput:add(rtsPlayerLayerInterface, layerManager, layerInterface)
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        self.dropCellPositionHistory:addAll(occupyList, layerInterface)
        local rtsPlayerGameInput = rtsPlayerLayerInterface:getPlayerGameInput()
        rtsPlayerGameInput:setSelectedRTSLayer(layerInterface, self:getSelectedGeographicCellPosition())
        layerManager:append(layerInterface)
        rtsPlayerLayerInterface:add(BuildingSound.getInstance())
        if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
            GameNotificationEventHandler.getInstance():fireEvent(self.buildingGameNotificationEvent)
        end
end


function BuildingRTSFormInput:isSurroundingCellsOffMap(layerInterface)
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        local surroundList = geographicMapCellPositionArea:getSurroundingGeographicMapCellPositionList()
        local occupySize = occupyList:size()
        local surroundSize = surroundList:size()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("occupySize: ")
        stringBuffer:appendint(occupySize)
        stringBuffer:append(" surroundSize: ")
        stringBuffer:appendint(surroundSize)
        stringBuffer:append(" surroundList: ")
        stringBuffer:append(StringUtil.getInstance():toString(surroundList))
        self.logUtil:putF(tostring(stringBuffer), self, "isSurroundingCellsOffMap")
        local isSurroundOffMap = false
        if occupySize == 1 and surroundSize ~= 8 then
            isSurroundOffMap = true
        elseif occupySize == 4 and surroundSize ~= 12 then
            isSurroundOffMap = true
        end
        if occupySize == 0 or isSurroundOffMap then
            return true
        else
            return false
        end
end

return BuildingRTSFormInput

