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
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSLayerInfoPaintable = require("org.allbinary.game.layer.RTSLayerInfoPaintable")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Features = require("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local NullRTSFormInputFactory = require("org.allbinary.game.input.form.NullRTSFormInputFactory")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local NullRTSLayer = require("org.allbinary.game.layer.NullRTSLayer")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local SecondaryPlayerQueueFactory = require("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = require("org.allbinary.media.audio.SelectSound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local CommonLabels = require("org.allbinary.string.CommonLabels")
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

local RTSPlayerGameInput = {}
RTSPlayerGameInput.__index = RTSPlayerGameInput
RTSPlayerGameInput.className = "RTSPlayerGameInput"
setmetatable(RTSPlayerGameInput, {__index = PlayerGameInput})

function RTSPlayerGameInput:_init_fields()
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.removeInputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.inputList = nil
    self.isSingleKeyProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) or Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS)
    self.gameCanvas = nil
    self.motionGestureInputList = BasicArrayListD.new()
    self.scrollPlayerGameInput = nil
    self.selectedRTSLayerPlayerGameInput = nil
    self.towerInfoPaintable = nil
    self.rtsPlayerLayerInterface = nil
    self.layerPositionFinderInterface = nil
    self.selectedRtsFormInput = NullRTSFormInputFactory.getInstance()
end


function RTSPlayerGameInput.new(gameCanvas, inputList, playerInputId, towerInfoPaintable, rtsPlayerLayerInterface, layerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface)
    local self = setmetatable(PlayerGameInput.new(inputList, BasicArrayListD.new(), playerInputId), RTSPlayerGameInput)
    self:_init_fields()
        -- super(...) made self above
        self:initInputProcessors()
        self.gameCanvas = gameCanvas
        self.inputList = inputList
        self.towerInfoPaintable = towerInfoPaintable
        self.rtsPlayerLayerInterface = rtsPlayerLayerInterface
        self.selectedRTSLayerPlayerGameInput = SelectedRTSLayersPlayerGameInput.new(self:getRTSLayerInfoPaintable(), self:getRtsPlayerLayerInterface(), self.inputList, playerInputId, selectRTSLayerVisitorFactoryInterface)
        if self.rtsPlayerLayerInterface ~= NullRTSLayer.NULL_RTS_LAYER then
            self:setSelectedRtsFormInput(self.rtsPlayerLayerInterface:getRTSFormInput())
        end
        local geographicMapCompositeInterface = self.gameCanvas:getLayerManager()
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.scrollPlayerGameInput = ScrollMapPlayerGameInput.new(geographicMapInterface, self.inputList, playerInputId)
        self.layerPositionFinderInterface = layerPositionFinderInterface
    return self
end


-- throws Exception
function RTSPlayerGameInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        self.selectedRTSLayerPlayerGameInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        if self.selectedRtsFormInput ~= NullRTSFormInputFactory.getInstance() then
            self.selectedRtsFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        end
end


function RTSPlayerGameInput:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onDisplayChangeEvent")
            self:getRTSLayerInfoPaintable():update()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onDisplayChangeEvent", e)
        end
end


-- throws Exception
function RTSPlayerGameInput:left()
        self.rtsPlayerLayerInterface:getCurrentScrollSelectionForm():processInputKey(Canvas.LEFT)
end


-- throws Exception
function RTSPlayerGameInput:right()
        self.rtsPlayerLayerInterface:getCurrentScrollSelectionForm():processInputKey(Canvas.RIGHT)
end


function RTSPlayerGameInput:initInputProcessors()
        self.inputProcessorArray[Canvas.LEFT + 1] = RTSPlayerLeftGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM0 + 1] = self.inputProcessorArray[Canvas.LEFT + 1]
        self.inputProcessorArray[Canvas.RIGHT + 1] = RTSPlayerRightGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_POUND + 1] = self.inputProcessorArray[Canvas.RIGHT + 1]
        self.removeInputProcessorArray[Canvas.KEY_NUM1 + 1] = RTSPlayerFireGameInputProcessor.new(self)
        self.removeInputProcessorArray[Canvas.KEY_NUM3 + 1] = self.removeInputProcessorArray[Canvas.KEY_NUM1 + 1]
        self.removeInputProcessorArray[Canvas.KEY_NUM3 + 1] = self.removeInputProcessorArray[Canvas.KEY_NUM1 + 1]
        self.removeInputProcessorArray[Canvas.LEFT + 1] = self.removeInputProcessorArray[Canvas.KEY_NUM1 + 1]
        self.removeInputProcessorArray[Canvas.RIGHT + 1] = self.removeInputProcessorArray[Canvas.KEY_NUM1 + 1]
        self.removeInputProcessorArray[Canvas.KEY_NUM0 + 1] = self.removeInputProcessorArray[Canvas.KEY_NUM1 + 1]
        self.removeInputProcessorArray[Canvas.KEY_POUND + 1] = self.removeInputProcessorArray[Canvas.KEY_NUM1 + 1]
        GameInputProcessorUtil.init(self.inputProcessorArray)
        GameInputProcessorUtil.init(self.removeInputProcessorArray)
end


-- throws Exception
function RTSPlayerGameInput:processInput(layerManager)
        local try_ok, try_error = pcall(function()
            self:processMotionInput(layerManager)
            local size = self.inputList:size()
            local key = 0
            for index = 0, size - 1 do
                local gameKeyEvent = self.inputList:get(index)
                key = gameKeyEvent:getKey()
                self:getScrollPlayerGameInput():processInputKey(key)
                self:getSelectedBuildingPlayerGameInput():processInputKey(key)
                self.inputProcessorArray[key + 1]:processEvent(layerManager, gameKeyEvent)
                self.removeInputProcessorArray[key + 1]:processEvent(layerManager, gameKeyEvent)
            end
            if self:isIsSingleKeyProcessing() then
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


-- throws Exception
function RTSPlayerGameInput:processMotionInput(layerManager)
end


-- throws Exception
function RTSPlayerGameInput:select(motionGestureEvent)
        local point = motionGestureEvent:getCurrentPoint()
        local geographicMapCompositeInterface = self.gameCanvas:getLayerManager()
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local x = point:getX() + allBinaryTiledLayer:getXP()
        local y = point:getY() + allBinaryTiledLayer:getYP()
        local geographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(x, y)
        if geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            SecondaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
            local layer = self.layerPositionFinderInterface:getLayerInterface(geographicMapCellPosition)
            if layer == AllBinaryLayer.NULL_ALLBINARY_LAYER then
                layer = CollidableDestroyableDamageableLayer.getNullInstance()
            else
                geographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(layer:getXP(), layer:getYP())
            end
            local foundRTSLayer = layer
            self:setSelectedRTSLayer(foundRTSLayer, geographicMapCellPosition)
        else
            local commonLabels = CommonLabels.getInstance()
            self.logUtil:putF(tostring(StringMaker.new():append("Off Of Map -"):append(commonLabels.WIDTH_LABEL):appendint(java_int(allBinaryTiledLayer:getWidth())):append(commonLabels.HEIGHT_LABEL):appendint(java_int(allBinaryTiledLayer:getHeight()))), self, "select")
        end
end


-- throws Exception
function RTSPlayerGameInput:setSelectedRTSLayer(rtsLayer, geographicMapCellPosition)
        self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(rtsLayer)
end


function RTSPlayerGameInput:paint(graphics)
        local geographicMapCellPosition = self:getSelectedRtsFormInput():getSelectedGeographicCellPosition()
        local geographicMapCompositeInterface = self.gameCanvas:getLayerManager()
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        graphics:setColor(math.tointeger(BasicColorFactory.getInstance().GREEN // 1))
        local list = self:getSelectedBuildingPlayerGameInput():getPaintSelectedRTSLayersList()
        local width = 0
        local height = 0
        if list:size() > 0 then
            for index = list:size() - 1, 0, -1 do
                local rtsLayer = list:get(index)
                width = rtsLayer:getWidth()
                height = rtsLayer:getHeight()
                graphics:drawRect(rtsLayer:getXP() - allBinaryTiledLayer:getXP(), rtsLayer:getYP() - allBinaryTiledLayer:getYP(), width, height)
            end
        elseif geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            local point = geographicMapCellPosition:getPoint()
            width = allBinaryTiledLayer:getCellWidth()
            height = allBinaryTiledLayer:getCellHeight()
            graphics:drawRect(point:getX() - allBinaryTiledLayer:getXP(), point:getY() - allBinaryTiledLayer:getYP(), width, height)
        end
end


function RTSPlayerGameInput:updatePaintable()
end


function RTSPlayerGameInput:getSelectedBuildingPlayerGameInput()
        return self.selectedRTSLayerPlayerGameInput
end


function RTSPlayerGameInput:getSelectedRtsFormInput()
        return self.selectedRtsFormInput
end


function RTSPlayerGameInput:setSelectedRtsFormInput(selectedRtsFormInput)
        self.logUtil:putF(tostring(StringMaker.new():append("RTSFormInput: "):append(StringUtil.getInstance():toString(selectedRtsFormInput))), self, "setSelectedRtsFormInput")
        self.selectedRtsFormInput = selectedRtsFormInput
end


function RTSPlayerGameInput:getRtsPlayerLayerInterface()
        return self.rtsPlayerLayerInterface
end


function RTSPlayerGameInput:getRTSLayerInfoPaintable()
        return self.towerInfoPaintable
end


function RTSPlayerGameInput:getMotionGestureInputList()
        return self.motionGestureInputList
end


function RTSPlayerGameInput:getGameCanvas()
        return self.gameCanvas
end


function RTSPlayerGameInput:isIsSingleKeyProcessing()
        return self.isSingleKeyProcessing
end


function RTSPlayerGameInput:getScrollPlayerGameInput()
        return self.scrollPlayerGameInput
end

return RTSPlayerGameInput

