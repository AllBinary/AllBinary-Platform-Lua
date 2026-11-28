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

local SelectedRTSLayersPlayerGameInput = {}
package.loaded["org.allbinary.game.input.SelectedRTSLayersPlayerGameInput"] = SelectedRTSLayersPlayerGameInput

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local RTSGameStrings = java_lazy("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSLayerInfoPaintable = java_lazy("org.allbinary.game.layer.RTSLayerInfoPaintable")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = java_lazy("org.allbinary.game.layer.capital.Capital")
local DowngradeSound = java_lazy("org.allbinary.media.audio.DowngradeSound")
local UpgradeSound = java_lazy("org.allbinary.media.audio.UpgradeSound")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEvent = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = java_lazy("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local GameInputProcessor = java_lazy("org.allbinary.game.input.GameInputProcessor")
local GameInputProcessorUtil = java_lazy("org.allbinary.game.input.GameInputProcessorUtil")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local RTSPlayerGameInput = java_lazy("org.allbinary.game.input.RTSPlayerGameInput")
local SelectRTSLayerVisitorFactoryInterface = java_lazy("org.allbinary.game.input.SelectRTSLayerVisitorFactoryInterface")
local SelectedRTSLayersPlayerDowngradeGameInputProcessor = java_lazy("org.allbinary.game.input.SelectedRTSLayersPlayerDowngradeGameInputProcessor")
local SelectedRTSLayersPlayerUpgradeGameInputProcessor = java_lazy("org.allbinary.game.input.SelectedRTSLayersPlayerUpgradeGameInputProcessor")

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

-- class table SelectedRTSLayersPlayerGameInput is declared before the requires
SelectedRTSLayersPlayerGameInput.__index = SelectedRTSLayersPlayerGameInput
SelectedRTSLayersPlayerGameInput.className = "SelectedRTSLayersPlayerGameInput"
SelectedRTSLayersPlayerGameInput.javaClassName = "org.allbinary.game.input.SelectedRTSLayersPlayerGameInput"
setmetatable(SelectedRTSLayersPlayerGameInput, {__index = PlayerGameInput})

function SelectedRTSLayersPlayerGameInput:_init_fields()
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    if self.list == nil then self.list = nil end
    self.isSingleKeyProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) or Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS)
    self.selectedRTSLayersList = BasicArrayListD.new()
    self.preSelectedRTSLayersList = BasicArrayListD.new()
    self.paintSelectedRTSLayersList = BasicArrayListUtil.getInstance():getImmutableInstance()
    if self.rtsPlayerLayerInterface == nil then self.rtsPlayerLayerInterface = nil end
    if self.selectRTSLayerVisitorInterface == nil then self.selectRTSLayerVisitorInterface = nil end
    if self.upgradeGameNotificationEvent == nil then self.upgradeGameNotificationEvent = nil end
    if self.noMoneyGameNotificationEvent == nil then self.noMoneyGameNotificationEvent = nil end
    if self.downgradeGameNotificationEvent == nil then self.downgradeGameNotificationEvent = nil end
end


function SelectedRTSLayersPlayerGameInput._jinit(self, towerInfoPaintable, rtsPlayerLayerInterface, list, playerInputId, selectRTSLayerVisitorFactoryInterface)
    java_super_init(PlayerGameInput, self, list, BasicArrayListD.new(), playerInputId)
    SelectedRTSLayersPlayerGameInput._init_fields(self)
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

function SelectedRTSLayersPlayerGameInput.new(...)
    local self = setmetatable({}, SelectedRTSLayersPlayerGameInput)
    SelectedRTSLayersPlayerGameInput._jinit(self, ...)
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
java_overload(SelectedRTSLayersPlayerGameInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


function SelectedRTSLayersPlayerGameInput:isSelected(rtsLayer)
        if self.selectedRTSLayersList:contains(rtsLayer) then
            return true
        else
            return false
        end
end
java_overload(SelectedRTSLayersPlayerGameInput, "isSelected", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


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
                    if not (self.rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                        GameNotificationEventHandler.getInstance():fireEvent(self.upgradeGameNotificationEvent)
                    end
                else
                    self.rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                    if not (self.rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
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
java_overload(SelectedRTSLayersPlayerGameInput, "upgrade", 0)


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
                if not (self.rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
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
java_overload(SelectedRTSLayersPlayerGameInput, "downgrade", 0)


function SelectedRTSLayersPlayerGameInput:initInputProcessors()
        self.inputProcessorArray[Canvas.KEY_NUM1 + 1] = SelectedRTSLayersPlayerUpgradeGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM3 + 1] = SelectedRTSLayersPlayerDowngradeGameInputProcessor.new(self)
        GameInputProcessorUtil.init(self.inputProcessorArray)
end
java_overload(SelectedRTSLayersPlayerGameInput, "initInputProcessors", 0)


-- throws Exception
function SelectedRTSLayersPlayerGameInput:processInputKey(key)
        if not rawequal(self.selectedRTSLayersList, nil) then
            self.inputProcessorArray[key + 1]:processEvent(AllBinaryGameLayerManager.getNullInstance(), GameKeyEvent.NONE)
        end
end
java_overload(SelectedRTSLayersPlayerGameInput, "processInputKey", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function SelectedRTSLayersPlayerGameInput:processInput(layerManager)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.PROCESS_INPUT, e)
        end
end
java_overload(SelectedRTSLayersPlayerGameInput, "processInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function SelectedRTSLayersPlayerGameInput:getSelectedBasicArrayList()
        return self.selectedRTSLayersList
end
java_overload(SelectedRTSLayersPlayerGameInput, "getSelectedBasicArrayList", 0)


function SelectedRTSLayersPlayerGameInput:addSelectedRTSLayer(selectedLayer)
        self.paintSelectedRTSLayersList = BasicArrayListUtil.getInstance():getImmutableInstance()
        if rawequal(selectedLayer, CollidableDestroyableDamageableLayer.getNullInstance()) then
            self:deselectAll()
            self.selectedRTSLayersList:clear()
        else
            if not (self.selectedRTSLayersList:contains(selectedLayer)) then
                self.selectedRTSLayersList:add(selectedLayer)
            end
        end
        self.paintSelectedRTSLayersList = self.selectedRTSLayersList
end
java_overload(SelectedRTSLayersPlayerGameInput, "addSelectedRTSLayer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function SelectedRTSLayersPlayerGameInput:setSelectedRTSLayer(selectedLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Selected Layer: ")
        if not rawequal(selectedLayer, nil) then
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
        if not rawequal(selectedLayer, CollidableDestroyableDamageableLayer.getNullInstance()) then
            self.selectedRTSLayersList:add(selectedLayer)
        end
        self.paintSelectedRTSLayersList = self.selectedRTSLayersList
end
java_overload(SelectedRTSLayersPlayerGameInput, "setSelectedRTSLayer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) end)


function SelectedRTSLayersPlayerGameInput:getLastSelectedRtsLayer()
        if self:isAnyRTSLayerSelected() then
            return self.selectedRTSLayersList:get(self.selectedRTSLayersList:size() - 1)
        else
            return CollidableDestroyableDamageableLayer.getNullInstance()
        end
end
java_overload(SelectedRTSLayersPlayerGameInput, "getLastSelectedRtsLayer", 0)


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
java_overload(SelectedRTSLayersPlayerGameInput, "selectAllPreselected", 0)


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
java_overload(SelectedRTSLayersPlayerGameInput, "deselectAllPreselected", 0)


function SelectedRTSLayersPlayerGameInput:deselectAll()
        for index = self.selectedRTSLayersList:size() - 1, 0, -1 do
            local rtsLayer = self.selectedRTSLayersList:get(index)
            rtsLayer:deselect()
        end
end
java_overload(SelectedRTSLayersPlayerGameInput, "deselectAll", 0)


function SelectedRTSLayersPlayerGameInput:isAnyRTSLayerSelected()
        if rawequal(self.selectedRTSLayersList:size(), 0) then
            return false
        end
        return true
end
java_overload(SelectedRTSLayersPlayerGameInput, "isAnyRTSLayerSelected", 0)


function SelectedRTSLayersPlayerGameInput:getPaintSelectedRTSLayersList()
        return self.paintSelectedRTSLayersList
end
java_overload(SelectedRTSLayersPlayerGameInput, "getPaintSelectedRTSLayersList", 0)


function SelectedRTSLayersPlayerGameInput:getPreSelectedRTSLayersList()
        return self.preSelectedRTSLayersList
end
java_overload(SelectedRTSLayersPlayerGameInput, "getPreSelectedRTSLayersList", 0)

return SelectedRTSLayersPlayerGameInput

