--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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

local MapSelectionGameInputProcessor = {}
package.loaded["org.allbinary.game.input.MapSelectionGameInputProcessor"] = MapSelectionGameInputProcessor

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local LockedFeatureNotificationUtil = java_lazy("org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil")
local LockedUtil = java_lazy("org.allbinary.logic.system.security.licensing.LockedUtil")
local Processor = require("org.allbinary.canvas.Processor")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local PreGameSelectorPaintable = java_lazy("org.allbinary.game.displayable.canvas.PreGameSelectorPaintable")
local GameKeyEventHandler = java_lazy("org.allbinary.game.input.event.GameKeyEventHandler")
local GameKeyEventUtil = java_lazy("org.allbinary.game.input.event.GameKeyEventUtil")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = java_lazy("org.allbinary.media.audio.SelectSound")
local MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface")
local ABRunnable = require("org.allbinary.thread.ABRunnable")
local ThreadObjectUtil = java_lazy("org.allbinary.thread.ThreadObjectUtil")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local GameInputProcessorInterface = require("org.allbinary.game.input.GameInputProcessorInterface")
local PlayerGameInputCompositeInterface = require("org.allbinary.game.input.PlayerGameInputCompositeInterface")
local GameInputProcessorComposite = java_lazy("org.allbinary.game.input.GameInputProcessorComposite")
local PlayerGameInput = java_lazy("org.allbinary.game.input.PlayerGameInput")

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

-- class table MapSelectionGameInputProcessor is declared before the requires
MapSelectionGameInputProcessor.__index = MapSelectionGameInputProcessor
MapSelectionGameInputProcessor.className = "MapSelectionGameInputProcessor"
MapSelectionGameInputProcessor.javaClassName = "org.allbinary.game.input.MapSelectionGameInputProcessor"
setmetatable(MapSelectionGameInputProcessor, {__index = Processor})
MapSelectionGameInputProcessor.java_implements = " GameInputProcessorInterface PlayerGameInputCompositeInterface "
MapSelectionGameInputProcessor.java_interfaces = function() return {GameInputProcessorInterface, PlayerGameInputCompositeInterface} end
local MapSelectionRunnable = {}
    MapSelectionRunnable.__index = MapSelectionRunnable
    MapSelectionRunnable.className = "MapSelectionRunnable"
    MapSelectionRunnable.javaClassName = "org.allbinary.game.input.MapSelectionGameInputProcessor$MapSelectionRunnable"
    setmetatable(MapSelectionRunnable, {__index = ABRunnable})
    MapSelectionGameInputProcessor.MapSelectionRunnable = MapSelectionRunnable

    function MapSelectionRunnable:_init_fields()
        if self.inputProcessor == nil then self.inputProcessor = nil end
    end
    

    function MapSelectionRunnable._jinit(self, inputProcessor)
        java_super_init(ABRunnable, self)
        MapSelectionRunnable._init_fields(self)
            self.inputProcessor = inputProcessor
        return self
    end

    function MapSelectionRunnable.new(...)
        local self = setmetatable({}, MapSelectionRunnable)
        MapSelectionRunnable._jinit(self, ...)
        return self
    end
    

    function MapSelectionRunnable:run()
            local try_ok, try_error, try_value = pcall(function()
                self:setRunning(true)
                SecondaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
                local track = self.inputProcessor.preGameSelectorPaintable:getPreGameSelectionForm():getSelectedIndex() + 1
                local wave = self.inputProcessor.raceTrackGeographicMapInterfaceFactoryInterface:getFirstWaveWithTrack(track)
                self.inputProcessor.gameCanvas:getLayerManager():getGameInfo():setCurrentLevel(wave)
                self.inputProcessor.gameCanvas:buildGameInit(false)
                GameKeyEventHandler.getInstance():removeListener(self.inputProcessor:getPlayerGameInput())
                self:setRunning(false)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self:setRunning(false)
                local logUtil = LogUtil.getInstance()
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end
    java_overload(MapSelectionRunnable, "run", 0)


function MapSelectionGameInputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.gameCanvas == nil then self.gameCanvas = nil end
    if self.raceTrackGeographicMapInterfaceFactoryInterface == nil then self.raceTrackGeographicMapInterfaceFactoryInterface = nil end
    if self.preGameSelectorPaintable == nil then self.preGameSelectorPaintable = nil end
    self.inputTimeHelper = TimeDelayHelper.new(650)
    if self.playerGameInput == nil then self.playerGameInput = nil end
    if self.lockedIndex == nil then self.lockedIndex = nil end
    self.abRunnable = MapSelectionRunnable.new(self)
end


function MapSelectionGameInputProcessor._jinit(self, gameCanvas, raceTrackGeographicMapInterfaceFactoryInterface, mapSelectorPaintable, lockedIndex)
    java_super_init(Processor, self)
    MapSelectionGameInputProcessor._init_fields(self)
        self.gameCanvas = gameCanvas
        self.raceTrackGeographicMapInterfaceFactoryInterface = raceTrackGeographicMapInterfaceFactoryInterface
        self.preGameSelectorPaintable = mapSelectorPaintable
        self.playerGameInput = GameInputProcessorComposite.new("Map Selection", self)
        self.lockedIndex = lockedIndex
    return self
end

function MapSelectionGameInputProcessor.new(...)
    local self = setmetatable({}, MapSelectionGameInputProcessor)
    MapSelectionGameInputProcessor._jinit(self, ...)
    return self
end


-- throws Exception
function MapSelectionGameInputProcessor:process()
        self:getPlayerGameInput():update()
end
java_overload(MapSelectionGameInputProcessor, "process", 0)


-- throws Exception
function MapSelectionGameInputProcessor:onInput(list)
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list:get(index)
            local key = GameKeyEventUtil.getKey(anyType)
            if key == Canvas.LEFT or key == Canvas.RIGHT or key == Canvas.UP or key == Canvas.DOWN then
                if self.inputTimeHelper:isTimeTNT() then
                    SecondaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
                    self.preGameSelectorPaintable:getPreGameSelectionForm():processInputKey(key)
                    break
                end
            elseif key == Canvas.KEY_NUM0 then
                local selectedIndex = self.preGameSelectorPaintable:getPreGameSelectionForm():getSelectedIndex()
                if selectedIndex < self.lockedIndex or not LockedUtil.getInstance():isLocked() then
                    if not self.abRunnable:isRunning() then
                        self.abRunnable:setRunning(true)
                        ThreadObjectUtil.getInstance():processThread(self.abRunnable)
                    end
                    break
                else
                    LockedFeatureNotificationUtil.getInstance():fire()
                end
            end
            list:clear()
        end
end
java_overload(MapSelectionGameInputProcessor, "onInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws Exception
function MapSelectionGameInputProcessor:processInput(layerManager)
end
java_overload(MapSelectionGameInputProcessor, "processInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function MapSelectionGameInputProcessor:initInputProcessors()
end
java_overload(MapSelectionGameInputProcessor, "initInputProcessors", 0)


function MapSelectionGameInputProcessor:getName()
        return tostring(self)
end
java_overload(MapSelectionGameInputProcessor, "getName", 0)


function MapSelectionGameInputProcessor:getPlayerGameInput()
        return self.playerGameInput
end
java_overload(MapSelectionGameInputProcessor, "getPlayerGameInput", 0)

return MapSelectionGameInputProcessor

