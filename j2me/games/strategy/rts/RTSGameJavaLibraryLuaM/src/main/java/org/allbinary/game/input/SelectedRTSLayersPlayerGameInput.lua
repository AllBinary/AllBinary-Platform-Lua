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
-- package org.allbinary.game.input

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local RTSGameStrings = require("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSLayerInfoPaintable = require("org.allbinary.game.layer.RTSLayerInfoPaintable")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = require("org.allbinary.game.layer.capital.Capital")
local DowngradeSound = require("org.allbinary.media.audio.DowngradeSound")
local UpgradeSound = require("org.allbinary.media.audio.UpgradeSound")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local SelectedRTSLayersPlayerGameInput = {}
SelectedRTSLayersPlayerGameInput.__index = SelectedRTSLayersPlayerGameInput
SelectedRTSLayersPlayerGameInput.className = "SelectedRTSLayersPlayerGameInput"
setmetatable(SelectedRTSLayersPlayerGameInput, {__index = PlayerGameInput})

function SelectedRTSLayersPlayerGameInput:_init_fields()
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.list = nil
    self.isSingleKeyProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) or Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS)
    self.selectedRTSLayersList = BasicArrayListD.new()
    self.preSelectedRTSLayersList = BasicArrayListD.new()
    self.paintSelectedRTSLayersList = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.rtsPlayerLayerInterface = nil
    self.selectRTSLayerVisitorInterface = nil
    self.upgradeGameNotificationEvent = nil
    self.noMoneyGameNotificationEvent = nil
    self.downgradeGameNotificationEvent = nil
end


function SelectedRTSLayersPlayerGameInput.new(towerInfoPaintable, rtsPlayerLayerInterface, list, playerInputId, selectRTSLayerVisitorFactoryInterface)
    local self = setmetatable(PlayerGameInput.new(list, BasicArrayListD.new(), playerInputId), SelectedRTSLayersPlayerGameInput)
    self:_init_fields()
        -- super(...) made self above
        self:initInputProcessors()
        self.rtsPlayerLayerInterface = rtsPlayerLayerInterface
        self.list = list
        self.selectRTSLayerVisitorInterface = selectRTSLayerVisitorFactoryInterface:create(self)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local basicColorFactory = BasicColorFactory.getInstance()
        self.upgradeGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().UPGRADE, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.noMoneyGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        self.downgradeGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().DOWNGRADE, smallIntegerSingletonFactory:getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
    return self
end


-- throws Exception
function SelectedRTSLayersPlayerGameInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.upgradeGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.noMoneyGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.downgradeGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end


function SelectedRTSLayersPlayerGameInput:isSelected(rtsLayer)
        if self.selectedRTSLayersList:contains(rtsLayer) then
            return true
        else
            return false
        end
end


-- throws Exception
function SelectedRTSLayersPlayerGameInput:upgrade()
        local anyChanged = false
        for index = self.selectedRTSLayersList:size() - 1, 0, -1 do
            local rtsLayer = self.selectedRTSLayersList:get(index)
            if rtsLayer:isUpgradeable() then
                local capital = self.rtsPlayerLayerInterface:getCapital()
                local upgradeCost = rtsLayer:getUpgradeCost()
                if upgradeCost <= capital:getTotalMoney() then
                    anyChanged = true
                    self.rtsPlayerLayerInterface:add(UpgradeSound.getInstance())
                    rtsLayer:upgrade()
                    capital:removeMoney(upgradeCost)
                    if not self.rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                        GameNotificationEventHandler.getInstance():fireEvent(self.upgradeGameNotificationEvent)
                    end
                else
                    self.rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                    if not self.rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                        GameNotificationEventHandler.getInstance():fireEvent(self.noMoneyGameNotificationEvent)
                    end
                end
            end
        end
        if anyChanged then
            local rtsPlayerGameInput = (self.rtsPlayerLayerInterface:getPlayerGameInput())
            rtsPlayerGameInput:updatePaintable()
        end
end


-- throws Exception
function SelectedRTSLayersPlayerGameInput:downgrade()
        local anyChanged = false
        do
            local index = self.selectedRTSLayersList:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local rtsLayer = self.selectedRTSLayersList:get(index)
            if rtsLayer:isDowngradeable() then
                anyChanged = true
                self.rtsPlayerLayerInterface:add(DowngradeSound.getInstance())
                local downgradeCost = rtsLayer:getDowngradeCost()
                rtsLayer:downgrade()
                local capital = self.rtsPlayerLayerInterface:getCapital()
                capital:addMoney(downgradeCost)
                if not self.rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                    GameNotificationEventHandler.getInstance():fireEvent(self.downgradeGameNotificationEvent)
                end
            end
            end
        end
        if anyChanged then
            local rtsPlayerGameInput = (self.rtsPlayerLayerInterface:getPlayerGameInput())
            rtsPlayerGameInput:updatePaintable()
        end
end


function SelectedRTSLayersPlayerGameInput:initInputProcessors()
        self.inputProcessorArray[Canvas.KEY_NUM1 + 1] = SelectedRTSLayersPlayerUpgradeGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM3 + 1] = SelectedRTSLayersPlayerDowngradeGameInputProcessor.new(self)
        GameInputProcessorUtil.init(self.inputProcessorArray)
end


-- throws Exception
function SelectedRTSLayersPlayerGameInput:processInputKey(key)
        if self.selectedRTSLayersList ~= nil then
            self.inputProcessorArray[key + 1]:processEvent(AllBinaryGameLayerManager.getNullInstance(), GameKeyEvent.NONE)
        end
end


-- throws Exception
function SelectedRTSLayersPlayerGameInput:processInput(layerManager)
        local try_ok, try_error = pcall(function()
            local size = self.list:size()
            local key = 0
            for index = 0, size - 1 do
                local gameKeyEvent = self.list:get(index)
                key = gameKeyEvent:getKey()
                self:processInputKey(key)
            end
            if self.isSingleKeyProcessing then
                self:clear()
            else
                self:update()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.PROCESS_INPUT, e)
        end
end


function SelectedRTSLayersPlayerGameInput:getSelectedBasicArrayList()
        return self.selectedRTSLayersList
end


function SelectedRTSLayersPlayerGameInput:addSelectedRTSLayer(selectedLayer)
        self.paintSelectedRTSLayersList = BasicArrayListUtil.getInstance():getImmutableInstance()
        if selectedLayer == CollidableDestroyableDamageableLayer.getNullInstance() then
            self:deselectAll()
            self.selectedRTSLayersList:clear()
        else
            if not self.selectedRTSLayersList:contains(selectedLayer) then
                self.selectedRTSLayersList:add(selectedLayer)
            end
        end
        self.paintSelectedRTSLayersList = self.selectedRTSLayersList
end


function SelectedRTSLayersPlayerGameInput:setSelectedRTSLayer(selectedLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Selected Layer: ")
        if selectedLayer ~= nil then
            stringBuffer:append(selectedLayer:getName())
        end
        self.logUtil:putF(tostring(stringBuffer), self, "setSelectedRTSLayer")
        self.paintSelectedRTSLayersList = BasicArrayListUtil.getInstance():getImmutableInstance()
        self.selectRTSLayerVisitorInterface:visit(selectedLayer)
        self:deselectAll()
        if self.selectedRTSLayersList:size() > 0 then
            self:getPreSelectedRTSLayersList():clear()
            local tempList = self:getPreSelectedRTSLayersList()
            self.preSelectedRTSLayersList = self.selectedRTSLayersList
            self.selectedRTSLayersList = tempList
            self.logUtil:putF(tostring(StringMaker.new():append("Preselected: "):append(tostring(self.preSelectedRTSLayersList))), self, "setSelectedRTSLayer")
        end
        if selectedLayer ~= CollidableDestroyableDamageableLayer.getNullInstance() then
            self.selectedRTSLayersList:add(selectedLayer)
        end
        self.paintSelectedRTSLayersList = self.selectedRTSLayersList
end


function SelectedRTSLayersPlayerGameInput:getLastSelectedRtsLayer()
        if self:isAnyRTSLayerSelected() then
            return self.selectedRTSLayersList:get(self.selectedRTSLayersList:size() - 1)
        else
            return CollidableDestroyableDamageableLayer.getNullInstance()
        end
end


function SelectedRTSLayersPlayerGameInput:selectAllPreselected()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Select all Preselected: ")
        stringBuffer:append(tostring(self.preSelectedRTSLayersList))
        self.logUtil:putF(tostring(stringBuffer), self, "selectAllPreselected")
        for index = self.preSelectedRTSLayersList:size() - 1, 0, -1 do
            local rtsLayer = self.preSelectedRTSLayersList:get(index)
            rtsLayer:select()
        end
end


function SelectedRTSLayersPlayerGameInput:deselectAllPreselected()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Deselect all Preselected: ")
        stringBuffer:append(tostring(self.preSelectedRTSLayersList))
        self.logUtil:putF(tostring(stringBuffer), self, "deselectAllPreselected")
        for index = self.preSelectedRTSLayersList:size() - 1, 0, -1 do
            local rtsLayer = self.preSelectedRTSLayersList:get(index)
            rtsLayer:deselect()
        end
        self.preSelectedRTSLayersList:clear()
end


function SelectedRTSLayersPlayerGameInput:deselectAll()
        for index = self.selectedRTSLayersList:size() - 1, 0, -1 do
            local rtsLayer = self.selectedRTSLayersList:get(index)
            rtsLayer:deselect()
        end
end


function SelectedRTSLayersPlayerGameInput:isAnyRTSLayerSelected()
        if self.selectedRTSLayersList:size() == 0 then
            return false
        end
        return true
end


function SelectedRTSLayersPlayerGameInput:getPaintSelectedRTSLayersList()
        return self.paintSelectedRTSLayersList
end


function SelectedRTSLayersPlayerGameInput:getPreSelectedRTSLayersList()
        return self.preSelectedRTSLayersList
end

return SelectedRTSLayersPlayerGameInput

