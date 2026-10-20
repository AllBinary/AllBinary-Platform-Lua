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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local MultiSelectPaintable = require("org.allbinary.game.layer.MultiSelectPaintable")
local RTSGameStrings = require("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSLayerInfoPaintable = require("org.allbinary.game.layer.RTSLayerInfoPaintable")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")
local EndLevelNoBuildingSelectedTouchButtonsBuilder = require("org.allbinary.input.motion.button.EndLevelNoBuildingSelectedTouchButtonsBuilder")
local EndLevelTouchButtonsBuilder = require("org.allbinary.input.motion.button.EndLevelTouchButtonsBuilder")
local NoBuildingSelectedTouchButtonsBuilder = require("org.allbinary.input.motion.button.NoBuildingSelectedTouchButtonsBuilder")
local RTSTouchButtonsBuilder = require("org.allbinary.input.motion.button.RTSTouchButtonsBuilder")
local SelectBuildingSound = require("org.allbinary.media.audio.SelectBuildingSound")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local NullInitUpdatePaintable = require("org.allbinary.graphics.paint.NullInitUpdatePaintable")
local TouchButtonsBuilderFactory = require("org.allbinary.input.motion.button.TouchButtonsBuilderFactory")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local BaseMotionGestureEventListener = require("org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local RectangleCollisionUtil = require("org.allbinary.math.RectangleCollisionUtil")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local RTSPlayerGameInput = require("org.allbinary.game.input.RTSPlayerGameInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HumanRTSPlayerGameInput = {}
HumanRTSPlayerGameInput.__index = HumanRTSPlayerGameInput
HumanRTSPlayerGameInput.className = "HumanRTSPlayerGameInput"
setmetatable(HumanRTSPlayerGameInput, {__index = RTSPlayerGameInput})

function HumanRTSPlayerGameInput:_init_fields()
    self.isDragging = false
    self.gameStateFactory = GameStateFactory.getInstance()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    self.touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
    self.PRESSED = self.touchMotionGestureFactory.PRESSED
    self.RELEASED = self.touchMotionGestureFactory.RELEASED
    self.touchButtonsBuilderFactory = nil
    self.notYoursGameNotificationEvent = nil
    self.selectedRtsLayer = CollidableDestroyableDamageableLayer.getNullInstance()
    self.startPoint = PointFactory.getInstance().ZERO_ZERO
    self.endPoint = PointFactory.getInstance().ZERO_ZERO
    self.POSSIBLE = "Possible: "
    self.AT = "At: "
    self.METHOD = "makeSelection"
    self.ADDING = "Adding: "
    self.SPACE = CommonSeps.getInstance().SPACE
    self.multiSelectPaintable = MultiSelectPaintable.new()
end


function HumanRTSPlayerGameInput.new(gameCanvas, inputList, playerInputId, towerInfoPaintable, rtsPlayerLayerInterface, layerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface, touchButtonsBuilderFactory)
    local self = setmetatable(RTSPlayerGameInput.new(gameCanvas, inputList, playerInputId, towerInfoPaintable, rtsPlayerLayerInterface, layerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface), HumanRTSPlayerGameInput)
    self:_init_fields()
        -- super(...) made self above
        self.touchButtonsBuilderFactory = touchButtonsBuilderFactory
        local basicColorFactory = BasicColorFactory.getInstance()
        self.notYoursGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NOT_YOURS, SmallIntegerSingletonFactory.getInstance():getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        BasicMotionGesturesHandler.getInstance():addListenerInterface(self)
    return self
end


-- throws Exception
function HumanRTSPlayerGameInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.notYoursGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end


-- throws Exception
function HumanRTSPlayerGameInput:processDraggingMotionInput(layerManager)
        local motionGestureEvent = self:getMotionGestureInputList():get(self:getMotionGestureInputList():size() - 1)
        local motionGestureInput = motionGestureEvent:getMotionGesture()
        local rtsFormInput = self:getSelectedRtsFormInput()
        if motionGestureInput == self.PRESSED then
            local point = motionGestureEvent:getCurrentPoint()
            if self:getRtsPlayerLayerInterface():getCurrentScrollSelectionForm():isInForm(point) then
                self.isDragging = rtsFormInput:processSticky(self:getSelectedRtsLayer(), self:getRtsPlayerLayerInterface(), layerManager, point)
            end
        elseif motionGestureInput == self.RELEASED then
            local point = motionGestureEvent:getCurrentPoint()
            if self:getRtsPlayerLayerInterface():getCurrentScrollSelectionForm():isInForm(point) then
                rtsFormInput:processAtPoint(self:getSelectedRtsLayer(), self:getRtsPlayerLayerInterface(), layerManager, point)
            elseif rtsFormInput:isStickyItemSelected() then
                local previousRtsFormInput = rtsFormInput
                self:select(motionGestureEvent)
                self:getSelectedBuildingPlayerGameInput():selectAllPreselected()
                previousRtsFormInput:processAtPoint(self:getSelectedRtsLayer(), self:getRtsPlayerLayerInterface(), layerManager, point)
                self:getSelectedBuildingPlayerGameInput():deselectAllPreselected()
            else
                self:select(motionGestureEvent)
            end
            rtsFormInput:setStickyItemSelected(false)
            rtsFormInput:setSelectedStickyItem(ABCustomItem.getNullInstance())
            rtsFormInput:setSelectedStickyItemIndex(-1)
            return true
        end
        return false
end


function HumanRTSPlayerGameInput:makeSelection()
        local rtsLayerList = self:getRtsPlayerLayerInterface():getPlayerOwnedRTSLayers().rtsLayerList
        local rectX1 = self.startPoint:getX()
        local rectY1 = self.startPoint:getY()
        local rectX2 = self.endPoint:getX()
        local rectY2 = self.endPoint:getY()
        if rectX1 > rectX2 then
            rectX2 = rectX1
            rectX1 = self.endPoint:getX()
        end
        if rectY1 > rectY2 then
            rectY2 = rectY1
            rectY1 = self.endPoint:getY()
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.AT)
        stringBuffer:appendint(rectX1)
        stringBuffer:append(self.SPACE)
        stringBuffer:appendint(rectY1)
        stringBuffer:append(self.SPACE)
        stringBuffer:appendint(rectX2)
        stringBuffer:append(self.SPACE)
        stringBuffer:appendint(rectY2)
        self.logUtil:putF(tostring(stringBuffer), self, self.METHOD)
        local rtsLayer = nil
        for index = rtsLayerList:size() - 1, 0, -1 do
            rtsLayer = rtsLayerList:get(index)
            stringBuffer:delete(0, stringBuffer:length())
            local viewPosition = rtsLayer:getViewPosition()
            stringBuffer:append(self.POSSIBLE)
            stringBuffer:append(rtsLayer:getName())
            stringBuffer:append(self.SPACE)
            stringBuffer:append(self.AT)
            stringBuffer:appendint(java_int((viewPosition:getX() + rtsLayer:getHalfWidth())))
            stringBuffer:append(self.SPACE)
            stringBuffer:appendint(java_int((viewPosition:getY() + rtsLayer:getHalfHeight())))
            self.logUtil:putF(tostring(stringBuffer), self, self.METHOD)
            if self.rectangleCollisionUtil:isInside(rectX1, rectY1, rectX2, rectY2, viewPosition:getX() + rtsLayer:getHalfWidth(), viewPosition:getY() + rtsLayer:getHalfHeight()) then
                self.logUtil:putF(tostring(StringMaker.new():append(self.ADDING):append(rtsLayer:getName())), self, self.METHOD)
                rtsLayer:select()
                self:getSelectedBuildingPlayerGameInput():addSelectedRTSLayer(rtsLayer)
            end
        end
        local gameLayer = self:getSelectedBuildingPlayerGameInput():getLastSelectedRtsLayer()
        if gameLayer ~= CollidableDestroyableDamageableLayer.getNullInstance() then
            local lastRTSLayer = gameLayer
            if lastRTSLayer:getScrollSelectionForm() ~= ScrollSelectionForm.getNullScrollSelectionForm() then
                self:updateForm(lastRTSLayer:getScrollSelectionForm(), lastRTSLayer:getRTSFormInput())
                self:setSelectedRtsLayer(lastRTSLayer)
            end
        end
        self:updatePaintable()
end


-- throws Exception
function HumanRTSPlayerGameInput:processSelectionBoxMotionInput(layerManager)
        for index = self:getMotionGestureInputList():size() - 1, 0, -1 do
            local motionGestureEvent = self:getMotionGestureInputList():get(index)
            local motionGestureInput = motionGestureEvent:getMotionGesture()
            local point = motionGestureEvent:getCurrentPoint()
            if motionGestureInput == self.touchMotionGestureFactory.PRESSED then
                self.startPoint = point
                self.endPoint = point
            elseif motionGestureInput == self.touchMotionGestureFactory.RELEASED then
                self.endPoint = point
                self:makeSelection()
                self.startPoint = PointFactory.getInstance().ZERO_ZERO
                self.endPoint = PointFactory.getInstance().ZERO_ZERO
            else
                self.endPoint = point
            end
        end
end


-- throws Exception
function HumanRTSPlayerGameInput:processMotionInput(layerManager)
        if self:getMotionGestureInputList():size() > 0 then
            local endDrag = self:processDraggingMotionInput(layerManager)
            if not self.isDragging then
                self:processSelectionBoxMotionInput(layerManager)
            end
            if endDrag then
                self.isDragging = false
            end
        end
        self:getMotionGestureInputList():clear()
end


function HumanRTSPlayerGameInput:setSelectedRtsFormInput(selectedRtsFormInput)
        local logUtil = LogUtil.getInstance()
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START):append(StringUtil.getInstance():toString(selectedRtsFormInput))), self, "setSelectedRtsFormInput")
        RTSPlayerGameInput.setSelectedRtsFormInput(self, selectedRtsFormInput)
        self:setSelectedRtsLayer(CollidableDestroyableDamageableLayer.getNullInstance())
end


function HumanRTSPlayerGameInput:updateFormForLayer(rtsLayer)
        local scrollSelectionForm = rtsLayer:getScrollSelectionForm()
        if scrollSelectionForm ~= ScrollSelectionForm.getNullScrollSelectionForm() and self:getRtsPlayerLayerInterface():getGroupInterface()[1] == rtsLayer:getGroupInterface()[1] then
            self:updateForm(scrollSelectionForm, rtsLayer:getRTSFormInput())
            self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance())
            self:setSelectedRtsLayer(rtsLayer)
        else
            self:getRtsPlayerLayerInterface():setCurrentScrollSelectionForm(self:getRtsPlayerLayerInterface():getBuildingScrollSelectionForm())
            self:setSelectedRtsFormInput(self:getRtsPlayerLayerInterface():getRTSFormInput())
            self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance())
        end
end


function HumanRTSPlayerGameInput:updateForm(scrollSelectionForm, rtfFormInput)
        self:getRtsPlayerLayerInterface():setCurrentScrollSelectionForm(scrollSelectionForm)
        self:setSelectedRtsFormInput(rtfFormInput)
end


-- throws Exception
function HumanRTSPlayerGameInput:setSelectedRTSLayer(rtSLayer, geographicMapCellPosition)
        if rtSLayer ~= CollidableDestroyableDamageableLayer.getNullInstance() and self:getRtsPlayerLayerInterface():getGroupInterface()[1] ~= rtSLayer:getGroupInterface()[1] then
            self:getRtsPlayerLayerInterface():add(ErrorSound.getInstance())
            GameNotificationEventHandler.getInstance():fireEvent(self.notYoursGameNotificationEvent)
            return
        end
        local gameCanvas = self:getGameCanvas()
        if rtSLayer ~= CollidableDestroyableDamageableLayer.getNullInstance() then
            self:getRtsPlayerLayerInterface():add(SelectBuildingSound.getInstance())
            local rtsLayer = rtSLayer
            rtsLayer:select()
            self:updateFormForLayer(rtsLayer)
            if gameCanvas:getGameState() == self.gameStateFactory.PLAYING_GAME_STATE then
                if rtsLayer:isSelfUpgradeable() then
                    gameCanvas:updateCurrentTouchInputFactory(RTSTouchButtonsBuilder.new())
                else
                    gameCanvas:updateCurrentTouchInputFactory(NoBuildingSelectedTouchButtonsBuilder.new())
                end
            else
                local endLevelTouchButtonsBuilder = EndLevelTouchButtonsBuilder.new()
                if self.touchButtonsBuilderFactory ~= nil then
                    endLevelTouchButtonsBuilder:add(self.touchButtonsBuilderFactory:getInstance())
                end
                gameCanvas:updateCurrentTouchInputFactory(endLevelTouchButtonsBuilder)
            end
        else
            self.logUtil:putF("Set Player Default Form", self, "setSelectedRTSLayer")
            self:getRtsPlayerLayerInterface():setCurrentScrollSelectionForm(self:getRtsPlayerLayerInterface():getBuildingScrollSelectionForm())
            self:setSelectedRtsFormInput(self:getRtsPlayerLayerInterface():getRTSFormInput())
            self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance())
            if gameCanvas:getGameState() == self.gameStateFactory.PLAYING_GAME_STATE then
                gameCanvas:updateCurrentTouchInputFactory(NoBuildingSelectedTouchButtonsBuilder.new())
            else
                local endLevelNoBuildingSelectedTouchButtonsBuilder = EndLevelNoBuildingSelectedTouchButtonsBuilder.new()
                if self.touchButtonsBuilderFactory ~= nil then
                    endLevelNoBuildingSelectedTouchButtonsBuilder:add(self.touchButtonsBuilderFactory:getInstance())
                end
                gameCanvas:updateCurrentTouchInputFactory(endLevelNoBuildingSelectedTouchButtonsBuilder)
            end
        end
        self:getSelectedRtsFormInput():setSelectedGeographicCellPosition(geographicMapCellPosition)
        self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(rtSLayer)
        self:updatePaintable()
end


function HumanRTSPlayerGameInput:updatePaintable()
        local list = self:getSelectedBuildingPlayerGameInput():getSelectedBasicArrayList()
        if list:size() > 1 then
            local geographicMapCompositeInterface = self:getGameCanvas()
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            self.multiSelectPaintable:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
            self.multiSelectPaintable:update(list)
            self:getRTSLayerInfoPaintable():updateRTSLayerInfoSelection(self.multiSelectPaintable)
        elseif list:size() == 1 then
            local rtsLayer = list:get(0)
            self:getRTSLayerInfoPaintable():updateRTSLayerInfoSelection(rtsLayer:createHudPaintable())
        else
            self:getRTSLayerInfoPaintable():updateRTSLayerInfoInit(NullInitUpdatePaintable.getInstance())
        end
end


function HumanRTSPlayerGameInput:paint(graphics)
        RTSPlayerGameInput.paint(self, graphics)
        if self.startPoint ~= PointFactory.getInstance().ZERO_ZERO and self.endPoint ~= PointFactory.getInstance().ZERO_ZERO then
            graphics:setColor(math.tointeger(BasicColorFactory.getInstance().RED // 1))
            local rectX1 = self.startPoint:getX()
            local rectY1 = self.startPoint:getY()
            local rectX2 = self.endPoint:getX()
            local rectY2 = self.endPoint:getY()
            if rectX1 > rectX2 then
                rectX2 = rectX1
                rectX1 = self.endPoint:getX()
            end
            if rectY1 > rectY2 then
                rectY2 = rectY1
                rectY1 = self.endPoint:getY()
            end
            graphics:drawRect(rectX1, rectY1, rectX2 - rectX1, rectY2 - rectY1)
        end
end


function HumanRTSPlayerGameInput:onMotionGestureEvent(motionGestureEvent)
        self:getMotionGestureInputList():add(motionGestureEvent)
end


function HumanRTSPlayerGameInput:onScrolledMotionGestureEvent(motionGestureEvent)
end


function HumanRTSPlayerGameInput:getSelectedRtsLayer()
        return self.selectedRtsLayer
end


function HumanRTSPlayerGameInput:setSelectedRtsLayer(selectedRtsLayer)
        self.selectedRtsLayer = selectedRtsLayer
end

return HumanRTSPlayerGameInput

