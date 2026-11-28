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

local RaceTrackAdjacentDropCellPositionGenerator = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackAdjacentDropCellPositionGenerator"] = RaceTrackAdjacentDropCellPositionGenerator

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

local GroupCommonFactory = java_lazy("org.allbinary.game.identification.GroupCommonFactory")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local BasicGroupFactory = java_lazy("org.allbinary.game.identification.BasicGroupFactory")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local LayerCoveringCellPositionsUtil = java_lazy("org.allbinary.game.layer.geographic.map.LayerCoveringCellPositionsUtil")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapDirectionUtil = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local DropCellPositionGeneratorInterface = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionGeneratorInterface")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local BaseRaceTrackGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")
local RaceTrackGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local RaceTrackGeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local RaceTrackDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackDropCellPositionGenerator")
local RaceTrackAdjacentDropLayerFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackAdjacentDropLayerFactory")

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

-- class table RaceTrackAdjacentDropCellPositionGenerator is declared before the requires
RaceTrackAdjacentDropCellPositionGenerator.__index = RaceTrackAdjacentDropCellPositionGenerator
RaceTrackAdjacentDropCellPositionGenerator.className = "RaceTrackAdjacentDropCellPositionGenerator"
RaceTrackAdjacentDropCellPositionGenerator.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackAdjacentDropCellPositionGenerator"
setmetatable(RaceTrackAdjacentDropCellPositionGenerator, {__index = RaceTrackDropCellPositionGenerator})

function RaceTrackAdjacentDropCellPositionGenerator:_init_fields()
    self.layerCoveringCellPositionsUtil = LayerCoveringCellPositionsUtil.getInstance()
    self.groupCommonFactory = GroupCommonFactory.getInstance()
    self.surroundingCellPositions = java_new_array(nil, 4)
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.geographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance()
end


function RaceTrackAdjacentDropCellPositionGenerator.getInstance()
        return RaceTrackAdjacentDropCellPositionGenerator.SINGLETON
end


function RaceTrackAdjacentDropCellPositionGenerator._jinit(self)
    java_super_init(RaceTrackDropCellPositionGenerator, self)
    RaceTrackAdjacentDropCellPositionGenerator._init_fields(self)
    return self
end

function RaceTrackAdjacentDropCellPositionGenerator.new(...)
    local self = setmetatable({}, RaceTrackAdjacentDropCellPositionGenerator)
    RaceTrackAdjacentDropCellPositionGenerator._jinit(self, ...)
    return self
end


-- throws Exception
function RaceTrackAdjacentDropCellPositionGenerator:getFirstNonRoadAdjacentCellPosition(column, row)
        local nonRoadGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        local geographicMapCellPositionFactory = self.raceTrackGeographicMap:getGeographicMapCellPositionFactory()
        self.surroundingCellPositions[1] = geographicMapCellPositionFactory:getAt(column, row - 1)
        self.surroundingCellPositions[2] = geographicMapCellPositionFactory:getAt(column, row + 1)
        self.surroundingCellPositions[3] = geographicMapCellPositionFactory:getAt(column - 1, row)
        self.surroundingCellPositions[4] = geographicMapCellPositionFactory:getAt(column + 1, row)
        local baseRaceTrackGeographicMap = self.raceTrackGeographicMap
        local raceTrackGeographicMapCellTypeFactory = baseRaceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local geographicMapCellPosition = nil
        local raceTrackGeographicMapCellType = nil
        do
            local index = (self.surroundingCellPositions.n or #self.surroundingCellPositions)
            while (function() index = index - 1 return index end)() >= 0 do
            geographicMapCellPosition = self.surroundingCellPositions[index + 1]
            raceTrackGeographicMapCellType = self.raceTrackGeographicMap:getCellTypeAt(geographicMapCellPosition)
            if not (raceTrackGeographicMapCellTypeFactory:isPath(raceTrackGeographicMapCellType)) then
                nonRoadGeographicMapCellPosition = geographicMapCellPosition
                break
            end
            end
        end
        return nonRoadGeographicMapCellPosition
end
java_overload(RaceTrackAdjacentDropCellPositionGenerator, "getFirstNonRoadAdjacentCellPosition", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function RaceTrackAdjacentDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
        self.hashtable:put(AllBinaryGameLayerManager.ID, allBinaryGameLayerManager)
        java_super(RaceTrackDropCellPositionGenerator, "update", 2)(self, allBinaryGameLayerManager, geographicMapInterface)
end
java_overload(RaceTrackAdjacentDropCellPositionGenerator, "update", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) and (java_a2 == nil or java_is(java_a2, "BasicGeographicMap")) end)


-- throws Exception
function RaceTrackAdjacentDropCellPositionGenerator:drop(allBinaryLayerManager, index)
        local geographicMapCellPosition = self.list:get(index)
        local randomGeographicMapCellPosition = self:getFirstNonRoadAdjacentCellPosition(geographicMapCellPosition:getColumn(), geographicMapCellPosition:getRow())
        if rawequal(randomGeographicMapCellPosition, nil) then
            return
        end
        local dropCellPositionHistory = DropCellPositionHistory.getInstance()
        if not (dropCellPositionHistory:isCellPositionWithDrop(geographicMapCellPosition)) then
            local direction = self.geographicMapDirectionUtil:getDirectionFromCellPositionToAdjacentCellPosition(randomGeographicMapCellPosition, geographicMapCellPosition)
            local objectCanBeNull = self.hashtable:get(self.groupCommonFactory.ID)
            if not rawequal(objectCanBeNull, nil) then
            else
                self.hashtable:put(self.groupCommonFactory.ID, BasicGroupFactory.getInstance().NONE_ARRAY)
            end
            self.hashtable:put(DirectionFactory.getInstance().NAME, direction)
            local point = randomGeographicMapCellPosition:getPoint()
            local x = point:getX()
            local y = point:getY()
            local z = point:getZ()
            local layerInterface = RaceTrackAdjacentDropLayerFactory.getInstance():getRandomInstance():getNextInstance(self.hashtable, x, y, z)
            local baseRaceTrackGeographicMap = self.raceTrackGeographicMap
            local list = self.layerCoveringCellPositionsUtil:getAll(baseRaceTrackGeographicMap, randomGeographicMapCellPosition, layerInterface, BasicArrayListD.new())
            if dropCellPositionHistory:anyCellPositionWithDrop(list) then
                return
            end
            local geographicMapCellType = nil
            do
                local index2 = list:size()
                while (function() index2 = index2 - 1 return index2 end)() >= 0 do
                geographicMapCellType = self.raceTrackGeographicMap:getCellTypeAt(list:get(index2))
                if self.raceTrackGeographicMapCellTypeFactory:isPath(geographicMapCellType) then
                    return
                end
                end
            end
            dropCellPositionHistory:addAll(list, layerInterface)
            allBinaryLayerManager:append(layerInterface)
        end
end
java_overload(RaceTrackAdjacentDropCellPositionGenerator, "drop", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and type(java_a2) == "number" end)

RaceTrackAdjacentDropCellPositionGenerator.SINGLETON = RaceTrackAdjacentDropCellPositionGenerator.new()

return RaceTrackAdjacentDropCellPositionGenerator

