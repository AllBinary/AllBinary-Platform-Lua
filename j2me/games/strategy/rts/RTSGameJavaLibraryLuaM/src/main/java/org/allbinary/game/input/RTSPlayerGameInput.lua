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

local RTSPlayerGameInput = {}
package.loaded["org.allbinary.game.input.RTSPlayerGameInput"] = RTSPlayerGameInput

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RTSFormInput = java_lazy("org.allbinary.game.input.form.RTSFormInput")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSLayerInfoPaintable = java_lazy("org.allbinary.game.layer.RTSLayerInfoPaintable")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local NullRTSFormInputFactory = java_lazy("org.allbinary.game.input.form.NullRTSFormInputFactory")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local NullRTSLayer = java_lazy("org.allbinary.game.layer.NullRTSLayer")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local MotionGestureEvent = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = java_lazy("org.allbinary.media.audio.SelectSound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local LayerPositionFinderInterface = java_lazy("org.allbinary.game.input.LayerPositionFinderInterface")
local RTSPlayerFireGameInputProcessor = java_lazy("org.allbinary.game.input.RTSPlayerFireGameInputProcessor")
local RTSPlayerLeftGameInputProcessor = java_lazy("org.allbinary.game.input.RTSPlayerLeftGameInputProcessor")
local RTSPlayerRightGameInputProcessor = java_lazy("org.allbinary.game.input.RTSPlayerRightGameInputProcessor")
local SelectRTSLayerVisitorFactoryInterface = java_lazy("org.allbinary.game.input.SelectRTSLayerVisitorFactoryInterface")
local SelectedRTSLayersPlayerGameInput = java_lazy("org.allbinary.game.input.SelectedRTSLayersPlayerGameInput")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table RTSPlayerGameInput is declared before the requires
RTSPlayerGameInput.__index = RTSPlayerGameInput
RTSPlayerGameInput.className = "RTSPlayerGameInput"
RTSPlayerGameInput.javaClassName = "org.allbinary.game.input.RTSPlayerGameInput"
setmetatable(RTSPlayerGameInput, {__index = PlayerGameInput})

function RTSPlayerGameInput:_init_fields()
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.removeInputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    if self.inputList == nil then self.inputList = nil end
    self.isSingleKeyProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) or Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS)
    if self.gameCanvas == nil then self.gameCanvas = nil end
    self.motionGestureInputList = BasicArrayListD.new()
    if self.scrollPlayerGameInput == nil then self.scrollPlayerGameInput = nil end
    if self.selectedRTSLayerPlayerGameInput == nil then self.selectedRTSLayerPlayerGameInput = nil end
    if self.towerInfoPaintable == nil then self.towerInfoPaintable = nil end
    if self.rtsPlayerLayerInterface == nil then self.rtsPlayerLayerInterface = nil end
    if self.layerPositionFinderInterface == nil then self.layerPositionFinderInterface = nil end
    self.selectedRtsFormInput = NullRTSFormInputFactory.getInstance()
end


function RTSPlayerGameInput._jinit(self, gameCanvas, inputList, playerInputId, towerInfoPaintable, rtsPlayerLayerInterface, layerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface)
    java_super_init(PlayerGameInput, self, inputList, BasicArrayListD.new(), playerInputId)
    RTSPlayerGameInput._init_fields(self)
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

function RTSPlayerGameInput.new(...)
    local self = setmetatable({}, RTSPlayerGameInput)
    RTSPlayerGameInput._jinit(self, ...)
    return self
end


-- throws Exception
function RTSPlayerGameInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        self.selectedRTSLayerPlayerGameInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        if self.selectedRtsFormInput ~= NullRTSFormInputFactory.getInstance() then
            self.selectedRtsFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        end
end
java_overload(RTSPlayerGameInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


function RTSPlayerGameInput:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onDisplayChangeEvent")
            self:getRTSLayerInfoPaintable():update()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onDisplayChangeEvent", e)
        end
end
java_overload(RTSPlayerGameInput, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


-- throws Exception
function RTSPlayerGameInput:left()
        self.rtsPlayerLayerInterface:getCurrentScrollSelectionForm():processInputKey(Canvas.LEFT)
end
java_overload(RTSPlayerGameInput, "left", 0)


-- throws Exception
function RTSPlayerGameInput:right()
        self.rtsPlayerLayerInterface:getCurrentScrollSelectionForm():processInputKey(Canvas.RIGHT)
end
java_overload(RTSPlayerGameInput, "right", 0)


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
java_overload(RTSPlayerGameInput, "initInputProcessors", 0)


-- throws Exception
function RTSPlayerGameInput:processInput(layerManager)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.PROCESS_INPUT, e)
        end
end
java_overload(RTSPlayerGameInput, "processInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


-- throws Exception
function RTSPlayerGameInput:processMotionInput(layerManager)
end
java_overload(RTSPlayerGameInput, "processMotionInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


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
java_overload(RTSPlayerGameInput, "select", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MotionGestureEvent")) end)


-- throws Exception
function RTSPlayerGameInput:setSelectedRTSLayer(rtsLayer, geographicMapCellPosition)
        self:getSelectedBuildingPlayerGameInput():setSelectedRTSLayer(rtsLayer)
end
java_overload(RTSPlayerGameInput, "setSelectedRTSLayer", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


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
java_overload(RTSPlayerGameInput, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function RTSPlayerGameInput:updatePaintable()
end
java_overload(RTSPlayerGameInput, "updatePaintable", 0)


function RTSPlayerGameInput:getSelectedBuildingPlayerGameInput()
        return self.selectedRTSLayerPlayerGameInput
end
java_overload(RTSPlayerGameInput, "getSelectedBuildingPlayerGameInput", 0)


function RTSPlayerGameInput:getSelectedRtsFormInput()
        return self.selectedRtsFormInput
end
java_overload(RTSPlayerGameInput, "getSelectedRtsFormInput", 0)


function RTSPlayerGameInput:setSelectedRtsFormInput(selectedRtsFormInput)
        self.logUtil:putF(tostring(StringMaker.new():append("RTSFormInput: "):append(StringUtil.getInstance():toString(selectedRtsFormInput))), self, "setSelectedRtsFormInput")
        self.selectedRtsFormInput = selectedRtsFormInput
end
java_overload(RTSPlayerGameInput, "setSelectedRtsFormInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSFormInput")) end)


function RTSPlayerGameInput:getRtsPlayerLayerInterface()
        return self.rtsPlayerLayerInterface
end
java_overload(RTSPlayerGameInput, "getRtsPlayerLayerInterface", 0)


function RTSPlayerGameInput:getRTSLayerInfoPaintable()
        return self.towerInfoPaintable
end
java_overload(RTSPlayerGameInput, "getRTSLayerInfoPaintable", 0)


function RTSPlayerGameInput:getMotionGestureInputList()
        return self.motionGestureInputList
end
java_overload(RTSPlayerGameInput, "getMotionGestureInputList", 0)


function RTSPlayerGameInput:getGameCanvas()
        return self.gameCanvas
end
java_overload(RTSPlayerGameInput, "getGameCanvas", 0)


function RTSPlayerGameInput:isIsSingleKeyProcessing()
        return self.isSingleKeyProcessing
end
java_overload(RTSPlayerGameInput, "isIsSingleKeyProcessing", 0)


function RTSPlayerGameInput:getScrollPlayerGameInput()
        return self.scrollPlayerGameInput
end
java_overload(RTSPlayerGameInput, "getScrollPlayerGameInput", 0)

return RTSPlayerGameInput

