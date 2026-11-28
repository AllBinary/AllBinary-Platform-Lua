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

local BuildingRTSFormInput = {}
package.loaded["org.allbinary.game.input.form.BuildingRTSFormInput"] = BuildingRTSFormInput

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

local RTSPlayerGameInput = java_lazy("org.allbinary.game.input.RTSPlayerGameInput")
local DemoLockedWithCostLayerInterfaceFactoryInterface = java_lazy("org.allbinary.game.layer.DemoLockedWithCostLayerInterfaceFactoryInterface")
local GeographicMapCellPositionAreaBase = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local RTSGameStrings = java_lazy("org.allbinary.game.layer.RTSGameStrings")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSPlayerLayerInterface = java_lazy("org.allbinary.game.layer.RTSPlayerLayerInterface")
local Capital = java_lazy("org.allbinary.game.layer.capital.Capital")
local LayerInterfaceFactoryImageItem = java_lazy("org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local BuildingSound = java_lazy("org.allbinary.media.audio.BuildingSound")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local LockedFeatureNotificationUtil = java_lazy("org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil")
local LockedUtil = java_lazy("org.allbinary.logic.system.security.licensing.LockedUtil")
local Group = java_lazy("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEvent = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ErrorSound = java_lazy("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local RaceTrackGeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")
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

-- class table BuildingRTSFormInput is declared before the requires
BuildingRTSFormInput.__index = BuildingRTSFormInput
BuildingRTSFormInput.className = "BuildingRTSFormInput"
BuildingRTSFormInput.javaClassName = "org.allbinary.game.input.form.BuildingRTSFormInput"
setmetatable(BuildingRTSFormInput, {__index = RTSFormInput})

function BuildingRTSFormInput:_init_fields()
    if self.isUnitProducer == nil then self.isUnitProducer = false end
    if self.buildOnPathGameNotificationEvent == nil then self.buildOnPathGameNotificationEvent = nil end
    if self.spotTakenGameNotificationEvent == nil then self.spotTakenGameNotificationEvent = nil end
    if self.selectBuildSpotGameNotificationEvent == nil then self.selectBuildSpotGameNotificationEvent = nil end
    if self.roadCollisionGameNotificationEvent == nil then self.roadCollisionGameNotificationEvent = nil end
    if self.noMoneyGameNotificationEvent == nil then self.noMoneyGameNotificationEvent = nil end
    if self.buildingCollisionGameNotificationEvent == nil then self.buildingCollisionGameNotificationEvent = nil end
    if self.structureToCloseCollisionGameNotificationEvent == nil then self.structureToCloseCollisionGameNotificationEvent = nil end
    if self.buildingGameNotificationEvent == nil then self.buildingGameNotificationEvent = nil end
    if self.mapEdgeGameNotificationEvent == nil then self.mapEdgeGameNotificationEvent = nil end
    self.dropCellPositionHistory = DropCellPositionHistory.getInstance()
end


function BuildingRTSFormInput._jinit(self, groupInterface, isUnitProducer)
    java_super_init(RTSFormInput, self, groupInterface)
    BuildingRTSFormInput._init_fields(self)
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

function BuildingRTSFormInput.new(...)
    local self = setmetatable({}, BuildingRTSFormInput)
    BuildingRTSFormInput._jinit(self, ...)
    return self
end


-- throws Exception
function BuildingRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        java_super(RTSFormInput, "setAllBinaryGameLayerManager", 1)(self, allBinaryGameLayerManager)
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
java_overload(BuildingRTSFormInput, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function BuildingRTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, itemIndex)
        java_super(RTSFormInput, "process", 1)(self, layerManager)
        self:buildFromMotionInput(rtsPlayerLayerInterface, layerManager, item, itemIndex)
end
java_overload(BuildingRTSFormInput, "processGameSpecific", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "CollidableDestroyableDamageableLayer")) and (java_a2 == nil or java_is(java_a2, "RTSPlayerLayerInterface")) and (java_a3 == nil or java_is(java_a3, "AllBinaryLayerManager")) and (java_a4 == nil or java_is(java_a4, "ABCustomItem")) and type(java_a5) == "number" end)


function BuildingRTSFormInput:isPositionBlocked()
        return self.dropCellPositionHistory:isCellPositionWithDrop(self:getSelectedGeographicCellPosition())
end
java_overload(BuildingRTSFormInput, "isPositionBlocked", 0)


function BuildingRTSFormInput:isDemoLocked(item)
        local factoryItem = item
        local layerInterfaceFactoryInterface = factoryItem:getLayerInterfaceFactoryInterface()
        if LockedUtil.getInstance():isLocked() and layerInterfaceFactoryInterface:isDemoLocked() then
            return true
        else
            return false
        end
end
java_overload(BuildingRTSFormInput, "isDemoLocked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)


-- throws Exception
function BuildingRTSFormInput:buildFromMotionInput(rtsPlayerLayerInterface, layerManager, item, itemIndex)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(commonStrings.START, self, "buildFromMotionInput")
        if rawequal(layerManager, nil) then
            error(require("java.lang.RuntimeException").new(), 0)
        end
        local geographicMapCompositeInterface = layerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        if self:isDemoLocked(item) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            LockedFeatureNotificationUtil.getInstance():fireWithColor(geographicMapInterface:getForegroundBasicColor())
            return
        end
        local geographicMapCellPosition = self:getSelectedGeographicCellPosition()
        if not rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            if not (self:isPositionBlocked()) then
                local geographicMapCellType = geographicMapInterface:getCellTypeAt(geographicMapCellPosition)
                local raceTrackGeographicMapCellTypeFactory = geographicMapInterface:getGeographicMapCellTypeFactory()
                if not (raceTrackGeographicMapCellTypeFactory:isPath(geographicMapCellType)) then
                    if rawequal(self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1], CollidableDestroyableDamageableLayer.getNullInstance()) then
                        self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1] = self:getInstance(layerManager, item, geographicMapCellPosition)
                    else
                        local positionedLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
                        local cellPoint = geographicMapCellPosition:getPoint()
                        positionedLayer:setPosition(cellPoint:getX(), cellPoint:getY(), cellPoint:getZ())
                        positionedLayer.geographicMapCellPositionAreaBase:update(geographicMapInterface)
                    end
                    local rtsLayer = self.newUnconstructedRTSLayerInterfaceArray[itemIndex + 1]
                    self:attemptBuild(rtsPlayerLayerInterface, layerManager, rtsLayer, itemIndex)
                else
                    rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                    if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                        GameNotificationEventHandler.getInstance():fireEvent(self.buildOnPathGameNotificationEvent)
                    end
                end
            else
                rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                    GameNotificationEventHandler.getInstance():fireEvent(self.spotTakenGameNotificationEvent)
                end
            end
        else
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.selectBuildSpotGameNotificationEvent)
            end
        end
end
java_overload(BuildingRTSFormInput, "buildFromMotionInput", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayerManager")) and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" end)


-- throws Exception
function BuildingRTSFormInput:attemptBuild(rtsPlayerLayerInterface, layerManager, layerInterface, itemIndex)
        self.logUtil:putF(tostring(StringMaker.new():append("Layer: "):append(StringUtil.getInstance():toString(layerInterface))), self, "attemptBuild")
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        if not (self:isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface)) then
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
                if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
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
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.noMoneyGameNotificationEvent)
            end
            return false
        end
end
java_overload(BuildingRTSFormInput, "attemptBuild", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayerManager")) and (java_a3 == nil or java_is(java_a3, "RTSLayer")) and type(java_a4) == "number" end)


-- throws Exception
function BuildingRTSFormInput:isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface)
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        if self.dropCellPositionHistory:anyCellPositionWithDrop(occupyList) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.buildingCollisionGameNotificationEvent)
            end
            return false
        end
        if self.isUnitProducer and self.dropCellPositionHistory:anyCellPositionWithDrop(geographicMapCellPositionArea:getSurroundingGeographicMapCellPositionList()) then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                GameNotificationEventHandler.getInstance():fireEvent(self.structureToCloseCollisionGameNotificationEvent)
            end
            return false
        else
            if self:isSurroundingCellsOffMap(layerInterface) then
                rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
                    GameNotificationEventHandler.getInstance():fireEvent(self.mapEdgeGameNotificationEvent)
                end
                return false
            end
        end
        return true
end
java_overload(BuildingRTSFormInput, "isBuildAttemptValid", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "RTSLayer")) end)


-- throws Exception
function BuildingRTSFormInput:add(rtsPlayerLayerInterface, layerManager, layerInterface)
        local geographicMapCellPositionArea = layerInterface.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        self.dropCellPositionHistory:addAll(occupyList, layerInterface)
        local rtsPlayerGameInput = rtsPlayerLayerInterface:getPlayerGameInput()
        rtsPlayerGameInput:setSelectedRTSLayer(layerInterface, self:getSelectedGeographicCellPosition())
        layerManager:append(layerInterface)
        rtsPlayerLayerInterface:add(BuildingSound.getInstance())
        if not (rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()) then
            GameNotificationEventHandler.getInstance():fireEvent(self.buildingGameNotificationEvent)
        end
end
java_overload(BuildingRTSFormInput, "add", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "RTSPlayerLayerInterface")) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayerManager")) and (java_a3 == nil or java_is(java_a3, "RTSLayer")) end)


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
        if rawequal(occupySize, 1) and not rawequal(surroundSize, 8) then
            isSurroundOffMap = true
        elseif rawequal(occupySize, 4) and not rawequal(surroundSize, 12) then
            isSurroundOffMap = true
        end
        if rawequal(occupySize, 0) or isSurroundOffMap then
            return true
        else
            return false
        end
end
java_overload(BuildingRTSFormInput, "isSurroundingCellsOffMap", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)

return BuildingRTSFormInput

