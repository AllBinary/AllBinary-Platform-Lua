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

local UnitRTSFormInput = {}
package.loaded["org.allbinary.game.input.form.UnitRTSFormInput"] = UnitRTSFormInput

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

local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AdvancedPlayerOwnedRTSLayers = java_lazy("org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers")
local AdvancedRTSGameLayer = java_lazy("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local RTSGameStrings = java_lazy("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = java_lazy("org.allbinary.game.layer.capital.Capital")
local UnitLayer = java_lazy("org.allbinary.game.layer.unit.UnitLayer")
local WorkWaypoint = java_lazy("org.allbinary.game.layer.waypoint.WorkWaypoint")
local BuildingSound = java_lazy("org.allbinary.media.audio.BuildingSound")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local Group = java_lazy("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GeographicMapCellPositionAreaBase = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
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
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local AssignWaypointsUtil = java_lazy("org.allbinary.game.input.form.AssignWaypointsUtil")
local PlayersSingletonFactory = java_lazy("org.allbinary.game.input.form.PlayersSingletonFactory")

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

-- class table UnitRTSFormInput is declared before the requires
UnitRTSFormInput.__index = UnitRTSFormInput
UnitRTSFormInput.className = "UnitRTSFormInput"
UnitRTSFormInput.javaClassName = "org.allbinary.game.input.form.UnitRTSFormInput"
setmetatable(UnitRTSFormInput, {__index = RTSFormInput})

function UnitRTSFormInput:_init_fields()
    if self.noMoneyGameNotificationEvent == nil then self.noMoneyGameNotificationEvent = nil end
    if self.newUnitGameNotificationEvent == nil then self.newUnitGameNotificationEvent = nil end
end


function UnitRTSFormInput._jinit(self, groupInterface)
    java_super_init(RTSFormInput, self, groupInterface)
    UnitRTSFormInput._init_fields(self)
        -- super(...) made self above
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local basicColorFactory = BasicColorFactory.getInstance()
        self.noMoneyGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self.newUnitGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NEW_UNIT, smallIntegerSingletonFactory:getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
        self:getHashtable():put(WorkWaypoint.ID, smallIntegerSingletonFactory:getAt(50))
    return self
end

function UnitRTSFormInput.new(...)
    local self = setmetatable({}, UnitRTSFormInput)
    UnitRTSFormInput._jinit(self, ...)
    return self
end


-- throws Exception
function UnitRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(RTSFormInput, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.noMoneyGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
        self.newUnitGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end
java_overload(UnitRTSFormInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function UnitRTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, itemIndex)
        java_super(RTSFormInput, "process", 1)(self, layerManager)
        local associatedRtsLayer2 = associatedRtsLayer
        local geographicMapCellPositionArea = associatedRtsLayer2.geographicMapCellPositionAreaBase
        local geographicMapCellPosition = geographicMapCellPositionArea:getNextSurroundingGeographicMapCellPosition()
        self:getHashtable():put(Layer.ID, associatedRtsLayer)
        self:getHashtable():put(UnitRTSFormInput.DECAL_ID, (rtsPlayerLayerInterface):getDecalBasicColor())
        if rawequal(self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1], CollidableDestroyableDamageableLayer.getNullInstance()) then
            self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] = self:getInstance(layerManager, item, geographicMapCellPosition)
        else
            local selectedCellPoint = geographicMapCellPosition:getPoint()
            local positionedLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
            positionedLayer:setPosition(selectedCellPoint:getX(), selectedCellPoint:getY(), positionedLayer:getZP())
            local geographicMapCompositeInterface = positionedLayer.allBinaryGameLayerManagerP
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            positionedLayer.geographicMapCellPositionAreaBase:update(geographicMapInterface)
        end
        local cellPoint = geographicMapCellPosition:getMidPoint()
        local rtsLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
        rtsLayer:setPosition(cellPoint:getX() - rtsLayer:getHalfWidth(), cellPoint:getY() - rtsLayer:getHalfHeight(), rtsLayer:getZP())
        self:attemptBuild(associatedRtsLayer2, rtsPlayerLayerInterface, layerManager, rtsLayer, itemIndex)
end
java_overload(UnitRTSFormInput, "processGameSpecific", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "ABCustomItem")) and type(java_a5) == "number" end)


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
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.newUnitGameNotificationEvent)
            end
        else
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.noMoneyGameNotificationEvent)
            end
        end
end
java_overload(UnitRTSFormInput, "attemptBuild", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "RTSLayer")) and type(java_a5) == "number" end)

UnitRTSFormInput.DECAL_ID = SmallIntegerSingletonFactory.getInstance():getAt(23)

return UnitRTSFormInput

