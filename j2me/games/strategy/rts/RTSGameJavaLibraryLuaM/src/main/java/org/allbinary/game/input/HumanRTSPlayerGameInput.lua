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

local HumanRTSPlayerGameInput = {}
package.loaded["org.allbinary.game.input.HumanRTSPlayerGameInput"] = HumanRTSPlayerGameInput

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local RTSFormInput = java_lazy("org.allbinary.game.input.form.RTSFormInput")
local MultiSelectPaintable = java_lazy("org.allbinary.game.layer.MultiSelectPaintable")
local RTSGameStrings = java_lazy("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSLayerInfoPaintable = java_lazy("org.allbinary.game.layer.RTSLayerInfoPaintable")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local EndLevelNoBuildingSelectedTouchButtonsBuilder = java_lazy("org.allbinary.input.motion.button.EndLevelNoBuildingSelectedTouchButtonsBuilder")
local EndLevelTouchButtonsBuilder = java_lazy("org.allbinary.input.motion.button.EndLevelTouchButtonsBuilder")
local NoBuildingSelectedTouchButtonsBuilder = java_lazy("org.allbinary.input.motion.button.NoBuildingSelectedTouchButtonsBuilder")
local RTSTouchButtonsBuilder = java_lazy("org.allbinary.input.motion.button.RTSTouchButtonsBuilder")
local SelectBuildingSound = java_lazy("org.allbinary.media.audio.SelectBuildingSound")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEvent = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local NullInitUpdatePaintable = java_lazy("org.allbinary.graphics.paint.NullInitUpdatePaintable")
local TouchButtonsBuilderFactory = java_lazy("org.allbinary.input.motion.button.TouchButtonsBuilderFactory")
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = java_lazy("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local BaseMotionGestureEventListener = java_lazy("org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener")
local BasicMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local MotionGestureEvent = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local RectangleCollisionUtil = java_lazy("org.allbinary.math.RectangleCollisionUtil")
local ErrorSound = java_lazy("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local RTSPlayerGameInput = require("org.allbinary.game.input.RTSPlayerGameInput")
local LayerPositionFinderInterface = java_lazy("org.allbinary.game.input.LayerPositionFinderInterface")
local SelectRTSLayerVisitorFactoryInterface = java_lazy("org.allbinary.game.input.SelectRTSLayerVisitorFactoryInterface")

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

-- class table HumanRTSPlayerGameInput is declared before the requires
HumanRTSPlayerGameInput.__index = HumanRTSPlayerGameInput
HumanRTSPlayerGameInput.className = "HumanRTSPlayerGameInput"
HumanRTSPlayerGameInput.javaClassName = "org.allbinary.game.input.HumanRTSPlayerGameInput"
setmetatable(HumanRTSPlayerGameInput, {__index = RTSPlayerGameInput})
HumanRTSPlayerGameInput.java_implements = " BaseMotionGestureEventListener "
HumanRTSPlayerGameInput.java_interfaces = function() return {BaseMotionGestureEventListener} end

function HumanRTSPlayerGameInput:_init_fields()
    self.isDragging = false
    self.gameStateFactory = GameStateFactory.getInstance()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    self.touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
    self.PRESSED = self.touchMotionGestureFactory.PRESSED
    self.RELEASED = self.touchMotionGestureFactory.RELEASED
    if self.touchButtonsBuilderFactory == nil then self.touchButtonsBuilderFactory = nil end
    if self.notYoursGameNotificationEvent == nil then self.notYoursGameNotificationEvent = nil end
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


function HumanRTSPlayerGameInput._jinit(self, gameCanvas, inputList, playerInputId, towerInfoPaintable, rtsPlayerLayerInterface, layerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface, touchButtonsBuilderFactory)
    java_super_init(RTSPlayerGameInput, self, gameCanvas, inputList, playerInputId, towerInfoPaintable, rtsPlayerLayerInterface, layerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface)
    HumanRTSPlayerGameInput._init_fields(self)
        -- super(...) made self above
        self.touchButtonsBuilderFactory = touchButtonsBuilderFactory
        local basicColorFactory = BasicColorFactory.getInstance()
        self.notYoursGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NOT_YOURS, SmallIntegerSingletonFactory.getInstance():getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE)
        BasicMotionGesturesHandler.getInstance():addListenerInterface(self)
    return self
end

function HumanRTSPlayerGameInput.new(...)
    local self = setmetatable({}, HumanRTSPlayerGameInput)
    HumanRTSPlayerGameInput._jinit(self, ...)
    return self
end


-- throws Exception
function HumanRTSPlayerGameInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.notYoursGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end
java_overload(HumanRTSPlayerGameInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function HumanRTSPlayerGameInput:processDraggingMotionInput(layerManager)
        local motionGestureEvent = self:getMotionGestureInputList():get(self:getMotionGestureInputList():size() - 1)
        local motionGestureInput = motionGestureEvent:getMotionGesture()
        local rtsFormInput = self:getSelectedRtsFormInput()
        if rawequal(motionGestureInput, self.PRESSED) then
            local point = motionGestureEvent:getCurrentPoint()
            if self:getRtsPlayerLayerInterface():getCurrentScrollSelectionForm():isInForm(point) then
                self.isDragging = rtsFormInput:processSticky(self:getSelectedRtsLayer(), self:getRtsPlayerLayerInterface(), layerManager, point)
            end
        elseif rawequal(motionGestureInput, self.RELEASED) then
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
java_overload(HumanRTSPlayerGameInput, "processDraggingMotionInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


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
        if not rawequal(gameLayer, CollidableDestroyableDamageableLayer.getNullInstance()) then
            local lastRTSLayer = gameLayer
            if not rawequal(lastRTSLayer:getScrollSelectionForm(), ScrollSelectionForm.getNullScrollSelectionForm()) then
                self:updateForm(lastRTSLayer:getScrollSelectionForm(), lastRTSLayer:getRTSFormInput())
                self:setSelectedRtsLayer(lastRTSLayer)
            end
        end
        self:updatePaintable()
end
java_overload(HumanRTSPlayerGameInput, "makeSelection", 0)


-- throws Exception
function HumanRTSPlayerGameInput:processSelectionBoxMotionInput(layerManager)
        for index = self:getMotionGestureInputList():size() - 1, 0, -1 do
            local motionGestureEvent = self:getMotionGestureInputList():get(index)
            local motionGestureInput = motionGestureEvent:getMotionGesture()
            local point = motionGestureEvent:getCurrentPoint()
            if rawequal(motionGestureInput, self.touchMotionGestureFactory.PRESSED) then
                self.startPoint = point
                self.endPoint = point
            elseif rawequal(motionGestureInput, self.touchMotionGestureFactory.RELEASED) then
                self.endPoint = point
                self:makeSelection()
                self.startPoint = PointFactory.getInstance().ZERO_ZERO
                self.endPoint = PointFactory.getInstance().ZERO_ZERO
            else
                self.endPoint = point
            end
        end
end
java_overload(HumanRTSPlayerGameInput, "processSelectionBoxMotionInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


-- throws Exception
function HumanRTSPlayerGameInput:processMotionInput(layerManager)
        if self:getMotionGestureInputList():size() > 0 then
            local endDrag = self:processDraggingMotionInput(layerManager)
            if not (self.isDragging) then
                self:processSelectionBoxMotionInput(layerManager)
            end
            if endDrag then
                self.isDragging = false
            end
        end
        self:getMotionGestureInputList():clear()
end
java_overload(HumanRTSPlayerGameInput, "processMotionInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function HumanRTSPlayerGameInput:setSelectedRtsFormInput(selectedRtsFormInput)
        local logUtil = LogUtil.getInstance()
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START):append(StringUtil.getInstance():toString(selectedRtsFormInput))), self, "setSelectedRtsFormInput")
        java_super(RTSPlayerGameInput, "setSelectedRtsFormInput", 1)(self, selectedRtsFormInput)
        self:setSelectedRtsLayer(CollidableDestroyableDamageableLayer.getNullInstance())
end
java_overload(HumanRTSPlayerGameInput, "setSelectedRtsFormInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSFormInput")) end)


function HumanRTSPlayerGameInput:updateFormForLayer(rtsLayer)
        local scrollSelectionForm = rtsLayer:getScrollSelectionForm()
        if not rawequal(scrollSelectionForm, ScrollSelectionForm.getNullScrollSelectionForm()) and rawequal(self:getRtsPlayerLayerInterface():getGroupInterface()[1], rtsLayer:getGroupInterface()[1]) then
            self:updateForm(scrollSelectionForm, rtsLayer:getRTSFormInput())
            self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance())
            self:setSelectedRtsLayer(rtsLayer)
        else
            self:getRtsPlayerLayerInterface():setCurrentScrollSelectionForm(self:getRtsPlayerLayerInterface():getBuildingScrollSelectionForm())
            self:setSelectedRtsFormInput(self:getRtsPlayerLayerInterface():getRTSFormInput())
            self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance())
        end
end
java_overload(HumanRTSPlayerGameInput, "updateFormForLayer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function HumanRTSPlayerGameInput:updateForm(scrollSelectionForm, rtfFormInput)
        self:getRtsPlayerLayerInterface():setCurrentScrollSelectionForm(scrollSelectionForm)
        self:setSelectedRtsFormInput(rtfFormInput)
end
java_overload(HumanRTSPlayerGameInput, "updateForm", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "ScrollSelectionForm")) and (java_a2 == nil or java_is(java_a2, "RTSFormInput")) end)


-- throws Exception
function HumanRTSPlayerGameInput:setSelectedRTSLayer(rtSLayer, geographicMapCellPosition)
        if not rawequal(rtSLayer, CollidableDestroyableDamageableLayer.getNullInstance()) and not rawequal(self:getRtsPlayerLayerInterface():getGroupInterface()[1], rtSLayer:getGroupInterface()[1]) then
            self:getRtsPlayerLayerInterface():add(ErrorSound.getInstance())
            GameNotificationEventHandler.getInstance():fireEvent(self.notYoursGameNotificationEvent)
            return
        end
        local gameCanvas = self:getGameCanvas()
        if not rawequal(rtSLayer, CollidableDestroyableDamageableLayer.getNullInstance()) then
            self:getRtsPlayerLayerInterface():add(SelectBuildingSound.getInstance())
            local rtsLayer = rtSLayer
            rtsLayer:select()
            self:updateFormForLayer(rtsLayer)
            if rawequal(gameCanvas:getGameState(), self.gameStateFactory.PLAYING_GAME_STATE) then
                if rtsLayer:isSelfUpgradeable() then
                    gameCanvas:updateCurrentTouchInputFactory(RTSTouchButtonsBuilder.new())
                else
                    gameCanvas:updateCurrentTouchInputFactory(NoBuildingSelectedTouchButtonsBuilder.new())
                end
            else
                local endLevelTouchButtonsBuilder = EndLevelTouchButtonsBuilder.new()
                if not rawequal(self.touchButtonsBuilderFactory, nil) then
                    endLevelTouchButtonsBuilder:add(self.touchButtonsBuilderFactory:getInstance())
                end
                gameCanvas:updateCurrentTouchInputFactory(endLevelTouchButtonsBuilder)
            end
        else
            self.logUtil:putF("Set Player Default Form", self, "setSelectedRTSLayer")
            self:getRtsPlayerLayerInterface():setCurrentScrollSelectionForm(self:getRtsPlayerLayerInterface():getBuildingScrollSelectionForm())
            self:setSelectedRtsFormInput(self:getRtsPlayerLayerInterface():getRTSFormInput())
            self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance())
            if rawequal(gameCanvas:getGameState(), self.gameStateFactory.PLAYING_GAME_STATE) then
                gameCanvas:updateCurrentTouchInputFactory(NoBuildingSelectedTouchButtonsBuilder.new())
            else
                local endLevelNoBuildingSelectedTouchButtonsBuilder = EndLevelNoBuildingSelectedTouchButtonsBuilder.new()
                if not rawequal(self.touchButtonsBuilderFactory, nil) then
                    endLevelNoBuildingSelectedTouchButtonsBuilder:add(self.touchButtonsBuilderFactory:getInstance())
                end
                gameCanvas:updateCurrentTouchInputFactory(endLevelNoBuildingSelectedTouchButtonsBuilder)
            end
        end
        self:getSelectedRtsFormInput():setSelectedGeographicCellPosition(geographicMapCellPosition)
        self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(rtSLayer)
        self:updatePaintable()
end
java_overload(HumanRTSPlayerGameInput, "setSelectedRTSLayer", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


function HumanRTSPlayerGameInput:updatePaintable()
        local list = self:getSelectedBuildingPlayerGameInput():getSelectedBasicArrayList()
        if list:size() > 1 then
            local geographicMapCompositeInterface = self:getGameCanvas()
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            self.multiSelectPaintable:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
            self.multiSelectPaintable:update(list)
            self:getRTSLayerInfoPaintable():updateRTSLayerInfoSelection(self.multiSelectPaintable)
        elseif rawequal(list:size(), 1) then
            local rtsLayer = list:get(0)
            self:getRTSLayerInfoPaintable():updateRTSLayerInfoSelection(rtsLayer:createHudPaintable())
        else
            self:getRTSLayerInfoPaintable():updateRTSLayerInfoInit(NullInitUpdatePaintable.getInstance())
        end
end
java_overload(HumanRTSPlayerGameInput, "updatePaintable", 0)


function HumanRTSPlayerGameInput:paint(graphics)
        java_super(RTSPlayerGameInput, "paint", 1)(self, graphics)
        if not rawequal(self.startPoint, PointFactory.getInstance().ZERO_ZERO) and not rawequal(self.endPoint, PointFactory.getInstance().ZERO_ZERO) then
            graphics:setColor(require("allbinary_java").number_value(BasicColorFactory.getInstance().RED, "intValue"))
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
java_overload(HumanRTSPlayerGameInput, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HumanRTSPlayerGameInput:onMotionGestureEvent(motionGestureEvent)
        self:getMotionGestureInputList():add(motionGestureEvent)
end
java_overload(HumanRTSPlayerGameInput, "onMotionGestureEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MotionGestureEvent")) end)


function HumanRTSPlayerGameInput:onScrolledMotionGestureEvent(motionGestureEvent)
end
java_overload(HumanRTSPlayerGameInput, "onScrolledMotionGestureEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MotionGestureEvent")) end)


function HumanRTSPlayerGameInput:getSelectedRtsLayer()
        return self.selectedRtsLayer
end
java_overload(HumanRTSPlayerGameInput, "getSelectedRtsLayer", 0)


function HumanRTSPlayerGameInput:setSelectedRtsLayer(selectedRtsLayer)
        self.selectedRtsLayer = selectedRtsLayer
end
java_overload(HumanRTSPlayerGameInput, "setSelectedRtsLayer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) end)

return HumanRTSPlayerGameInput

