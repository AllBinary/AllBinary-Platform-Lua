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
-- package org.allbinary.media.graphics.geography.map.racetrack.drop

local RaceTrackDropCellPositionGenerator = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackDropCellPositionGenerator"] = RaceTrackDropCellPositionGenerator

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local BaseDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator")
local BaseRaceTrackGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")
local NullRaceTrackGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.NullRaceTrackGeographicMap")
local RaceTrackGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local RaceTrackGeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")
local RaceTrackGeographicMapInterface = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterface")
local RaceTrackRoadsGeographicMapCellHistoryFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")

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

-- class table RaceTrackDropCellPositionGenerator is declared before the requires
RaceTrackDropCellPositionGenerator.__index = RaceTrackDropCellPositionGenerator
RaceTrackDropCellPositionGenerator.className = "RaceTrackDropCellPositionGenerator"
RaceTrackDropCellPositionGenerator.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackDropCellPositionGenerator"
setmetatable(RaceTrackDropCellPositionGenerator, {__index = BaseDropCellPositionGenerator})

function RaceTrackDropCellPositionGenerator:_init_fields()
    self.list = BasicArrayListD.new()
    if self.timeDelayHelper == nil then self.timeDelayHelper = nil end
    self.STRAIGHTAWAY = 4
    self.raceTrackGeographicMap = NullRaceTrackGeographicMap.NULL_RACE_TRACK_GEOGRAPHIC_MAP
    self.raceTrackGeographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function RaceTrackDropCellPositionGenerator._jinit(self)
    java_super_init(BaseDropCellPositionGenerator, self)
    RaceTrackDropCellPositionGenerator._init_fields(self)
        self.timeDelayHelper = TimeDelayHelper.new(10000)
    return self
end

function RaceTrackDropCellPositionGenerator.new(...)
    local self = setmetatable({}, RaceTrackDropCellPositionGenerator)
    RaceTrackDropCellPositionGenerator._jinit(self, ...)
    return self
end


function RaceTrackDropCellPositionGenerator:init()
        self.list:clear()
end
java_overload(RaceTrackDropCellPositionGenerator, "init", 0)


-- throws Exception
function RaceTrackDropCellPositionGenerator:isDropAllowedAt(geographicMapCellPosition)
        local raceTrackGeographicMapCellType = self.raceTrackGeographicMap:getCellTypeAt(geographicMapCellPosition)
        local raceTrackGeographicMapCellTypeFactory = self.raceTrackGeographicMapCellTypeFactory
        if rawequal(raceTrackGeographicMapCellType, raceTrackGeographicMapCellTypeFactory.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE) or rawequal(raceTrackGeographicMapCellType, raceTrackGeographicMapCellTypeFactory.VERTICAL_STRAIGHT_ROAD_CELL_TYPE) then
            return true
        end
        return false
end
java_overload(RaceTrackDropCellPositionGenerator, "isDropAllowedAt", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


-- throws Exception
function RaceTrackDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
        self:init()
        local baseRaceTrackGeographicMap = geographicMapInterface
        self.raceTrackGeographicMap = baseRaceTrackGeographicMap
        self.raceTrackGeographicMapCellTypeFactory = baseRaceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local roadGeographicMapCellHistory = RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance()
        local trackedList = roadGeographicMapCellHistory:getTracked()
        local geographicMapCellPosition = nil
        local lastIndex = trackedList:size() - 1
        local total = 0
        local ahead = 0
        for index = lastIndex, 0 + 1, -1 do
            geographicMapCellPosition = trackedList:get(index)
            total = 0
            ahead = index
            while self:isDropAllowedAt(trackedList:get(ahead)) do
                total = total + 1
                if total > self.STRAIGHTAWAY then
                    self.list:add(geographicMapCellPosition)
                    break
                end
                ahead = ahead + 1
                if ahead > lastIndex then
                    break
                end
            end
        end
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            self:drop(allBinaryGameLayerManager, index)
        end
end
java_overload(RaceTrackDropCellPositionGenerator, "update", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) and (java_a2 == nil or java_is(java_a2, "BasicGeographicMap")) end)


-- throws Exception
function RaceTrackDropCellPositionGenerator:processTick(allBinaryLayerManager)
        if self.timeDelayHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            local index = self.basicArrayListUtil:getRandomIndex(self.list)
            self:drop(allBinaryLayerManager, index)
        end
end
java_overload(RaceTrackDropCellPositionGenerator, "processTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


-- throws Exception
function RaceTrackDropCellPositionGenerator:drop(allBinaryLayerManager, index)
        error(require("java.lang.Exception").new(CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end
java_overload(RaceTrackDropCellPositionGenerator, "drop", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and type(java_a2) == "number" end)

return RaceTrackDropCellPositionGenerator

