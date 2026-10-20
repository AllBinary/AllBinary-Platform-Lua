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

local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AdvancedPlayerOwnedRTSLayers = require("org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSPlayerLayerInterface = require("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local RTSGameStrings = require("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = require("org.allbinary.game.layer.capital.Capital")
local UnitLayer = require("org.allbinary.game.layer.unit.UnitLayer")
local WorkWaypoint = require("org.allbinary.game.layer.waypoint.WorkWaypoint")
local BuildingSound = require("org.allbinary.media.audio.BuildingSound")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Group = require("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GeographicMapCellPositionAreaBase = require("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
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
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UnitRTSFormInput = {}
UnitRTSFormInput.__index = UnitRTSFormInput
UnitRTSFormInput.className = "UnitRTSFormInput"
setmetatable(UnitRTSFormInput, {__index = RTSFormInput})

function UnitRTSFormInput:_init_fields()
    self.noMoneyGameNotificationEvent = nil
    self.newUnitGameNotificationEvent = nil
end


function UnitRTSFormInput.new(groupInterface)
    local self = setmetatable(RTSFormInput.new(groupInterface), UnitRTSFormInput)
    self:_init_fields()
        -- super(...) made self above
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local basicColorFactory = BasicColorFactory.getInstance()
        self.noMoneyGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self.newUnitGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NEW_UNIT, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self:getHashtable():put(WorkWaypoint.ID, smallIntegerSingletonFactory:getAt(50))
    return self
end


-- throws Exception
function UnitRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        RTSFormInput.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.noMoneyGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.newUnitGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end


-- throws Exception
function UnitRTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, itemIndex)
        RTSFormInput.process(self, layerManager)
        local associatedRtsLayer2 = associatedRtsLayer
        local geographicMapCellPositionArea = associatedRtsLayer2.geographicMapCellPositionAreaBase
        local geographicMapCellPosition = geographicMapCellPositionArea:getNextSurroundingGeographicMapCellPosition()
        self:getHashtable():put(Layer.ID, associatedRtsLayer)
        self:getHashtable():put(UnitRTSFormInput.DECAL_ID, (rtsPlayerLayerInterface):getDecalBasicColor())
        if self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] == CollidableDestroyableDamageableLayer.getNullInstance() then
            self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] = self:getInstance(layerManager, item, geographicMapCellPosition)
        else
            local cellPoint = geographicMapCellPosition:getPoint()
            local rtsLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
            rtsLayer:setPosition(cellPoint:getX(), cellPoint:getY(), rtsLayer:getZP())
            local geographicMapCompositeInterface = rtsLayer.allBinaryGameLayerManagerP
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            rtsLayer.geographicMapCellPositionAreaBase:update(geographicMapInterface)
        end
        local cellPoint = geographicMapCellPosition:getMidPoint()
        local rtsLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
        rtsLayer:setPosition(cellPoint:getX() - rtsLayer:getHalfWidth(), cellPoint:getY() - rtsLayer:getHalfHeight(), rtsLayer:getZP())
        self:attemptBuild(associatedRtsLayer2, rtsPlayerLayerInterface, layerManager, rtsLayer, itemIndex)
end


-- throws Exception
function UnitRTSFormInput:attemptBuild(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, layerInterface, itemIndex)
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
            rtsPlayerLayerInterface:add(BuildingSound.getInstance())
            capital:removeMoney(cost)
            AssignWaypointsUtil.getInstance():set(layerInterface, associatedRtsLayer)
            layerManager:appendAt(layerInterface, PlayersSingletonFactory.total)
            local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
            local advancedPlayerOwnedRTSLayers = advancedRTSPlayerLayerInterface:getAdvancedPlayerOwnedRTSLayers()
            advancedPlayerOwnedRTSLayers:addUnit(layerInterface)
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.newUnitGameNotificationEvent)
            end
        else
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.noMoneyGameNotificationEvent)
            end
        end
end

UnitRTSFormInput.DECAL_ID = SmallIntegerSingletonFactory.getInstance():getAt(23)

return UnitRTSFormInput

