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
-- package org.allbinary.game.media.graphics.geography.map.racetrack

local PathFindingInfoFactory = {}
package.loaded["org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory"] = PathFindingInfoFactory

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

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local BasicGeographicMapUtil = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local BasePathFindingInfoFactory = require("org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory")
local RaceTrackGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local RaceTrackRoadsGeographicMapCellHistoryFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")
local PathFindingNodeCostInfoFactoryBase = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase")
local BasicGeographicMapGraph = java_lazy("org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapGraph")
local BasicGeographicMapPathFinder = java_lazy("org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapPathFinder")
local PathFinderGraphVisitorFactoryBase = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorFactoryBase")
local PathFindingInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathFindingNodeCostInfoFactory = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactory")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local SimplePathFinderGraphVisitorFactory = java_lazy("org.allbinary.game.media.graphics.geography.map.racetrack.SimplePathFinderGraphVisitorFactory")

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

-- class table PathFindingInfoFactory is declared before the requires
PathFindingInfoFactory.__index = PathFindingInfoFactory
PathFindingInfoFactory.className = "PathFindingInfoFactory"
PathFindingInfoFactory.javaClassName = "org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory"
setmetatable(PathFindingInfoFactory, {__index = BasePathFindingInfoFactory})

function PathFindingInfoFactory:_init_fields()
    self.MAX_DIRECTIONS = 4
    if self.pathFindingInfo == nil then self.pathFindingInfo = nil end
    if self.basicGeographicMapGraph == nil then self.basicGeographicMapGraph = nil end
    if self.basicGeographicMapPathFinder == nil then self.basicGeographicMapPathFinder = nil end
    if self.pathFinderGraphVisitorFactoryInterface == nil then self.pathFinderGraphVisitorFactoryInterface = nil end
end


function PathFindingInfoFactory.getInstance()
        return PathFindingInfoFactory.instance_f
end


function PathFindingInfoFactory.initMax(max)
        PathFindingInfoFactory.instance_f = PathFindingInfoFactory.new(SimplePathFinderGraphVisitorFactory.new(1, 1, require("java.lang.Integer").MAX_VALUE), max)
end


function PathFindingInfoFactory._jinit(self, pathFinderGraphVisitorFactoryInterface, max)
    java_super_init(BasePathFindingInfoFactory, self)
    PathFindingInfoFactory._init_fields(self)
        local commonStrings = CommonStrings.getInstance()
        PreLogUtil.put("Using Dynamic Path Finding", self, commonStrings.GET_INSTANCE)
        self.basicGeographicMapPathFinder = BasicGeographicMapPathFinder.new(max)
        self.pathFindingInfo = PathFindingInfo.new(PathFindingNodeCostInfoFactory.new(max), BasicArrayListS.new(1), BasicArrayListS.new(1))
        self.basicGeographicMapGraph = BasicGeographicMapGraph.new(self.pathFindingInfo:getPathFindingNodeCostInfoFactoryInterface())
        self.pathFinderGraphVisitorFactoryInterface = pathFinderGraphVisitorFactoryInterface
    return self
end

function PathFindingInfoFactory.new(...)
    local self = setmetatable({}, PathFindingInfoFactory)
    PathFindingInfoFactory._jinit(self, ...)
    return self
end


-- throws Exception
function PathFindingInfoFactory:getInstancePathFindingInfo(geographicMapInterface, mapArray)
        local pathFindingInfo = PathFindingInfo.new(self.pathFindingInfo:getPathFindingNodeCostInfoFactoryInterface(), BasicArrayListS.new(1), BasicArrayListS.new(1))
        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance():init()
        self:init(geographicMapInterface, pathFindingInfo, mapArray)
        self.basicGeographicMapPathFinder:init(geographicMapInterface, self.basicGeographicMapGraph, self.pathFinderGraphVisitorFactoryInterface:getInstance(geographicMapInterface))
        pathFindingInfo:setPathFinder(self.basicGeographicMapPathFinder)
        return pathFindingInfo
end
java_overload(PathFindingInfoFactory, "getInstancePathFindingInfo", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) end)


-- throws Exception
function PathFindingInfoFactory:init(geographicMapInterface, pathFindingInfo, mapArray)
        java_super(BasePathFindingInfoFactory, "init", 3)(self, geographicMapInterface, pathFindingInfo, mapArray)
        self:buildPathFindingNodes(geographicMapInterface, pathFindingInfo, mapArray)
end
java_overload(PathFindingInfoFactory, "init", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) and (java_a2 == nil or java_is(java_a2, "PathFindingInfo")) and (java_a3 == nil or (type(java_a3) == "table" and getmetatable(java_a3) == nil and java_a3.jt == nil and (java_a3[1] == nil or type(java_a3[1]) == "table"))) end)


-- throws Exception
function PathFindingInfoFactory:buildPathFindingNodesForCellPosition(geographicMapInterface, pathFindingInfo, mapArray, cellPosition)
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local cellTypeId = mapArray[cellPosition:getRow() + 1][cellPosition:getColumn() + 1]
        local geographicMapCellType = GeographicMapCellTypeFactory.getInstance():get(geographicMapInterface:getCellTypeFromMapCellTypeInt(cellTypeId))
        local raceTrackGeographicMapCellType = geographicMapCellType
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local pathFindingNodeCostInfoFactoryInterface = pathFindingInfo:getPathFindingNodeCostInfoFactoryInterface()
        local basicGeographicMapUtil = BasicGeographicMapUtil.getInstance()
        local row = 0
        local column = 0
        local goingToGeographicMapCellPosition = nil
        local costFromStart = 0
        local costToEnd = 0
        for index = 0, self.MAX_DIRECTIONS - 1 do
            row = basicGeographicMapUtil:getBorderingRow(index, cellPosition)
            column = basicGeographicMapUtil:getBorderingColumn(index, cellPosition)
            if row < allBinaryTiledLayer:getRows() and column < allBinaryTiledLayer:getColumns() and row >= 0 and column >= 0 then
                goingToGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(column, row)
                costFromStart = raceTrackGeographicMapCellType:getTravelCost()
                costToEnd = costFromStart
                pathFindingNodeCostInfoFactoryInterface:create(geographicMapInterface, goingToGeographicMapCellPosition, cellPosition, costFromStart, costToEnd)
            end
        end
end
java_overload(PathFindingInfoFactory, "buildPathFindingNodesForCellPosition", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) and (java_a2 == nil or java_is(java_a2, "PathFindingInfo")) and (java_a3 == nil or (type(java_a3) == "table" and getmetatable(java_a3) == nil and java_a3.jt == nil and (java_a3[1] == nil or type(java_a3[1]) == "table"))) and (java_a4 == nil or java_is(java_a4, "GeographicMapCellPosition")) end)


-- throws Exception
function PathFindingInfoFactory:buildPathFindingNodes(geographicMapInterface, pathFindingInfo, mapArray)
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local totalColumns = allBinaryTiledLayer:getColumns()
        local totalRows = allBinaryTiledLayer:getRows()
        for column = 0, totalColumns - 1 do
            for row = 0, totalRows - 1 do
                self:buildPathFindingNodesForCellPosition(geographicMapInterface, pathFindingInfo, mapArray, geographicMapCellPositionFactory:getAt(column, row))
            end
        end
end
java_overload(PathFindingInfoFactory, "buildPathFindingNodes", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) and (java_a2 == nil or java_is(java_a2, "PathFindingInfo")) and (java_a3 == nil or (type(java_a3) == "table" and getmetatable(java_a3) == nil and java_a3.jt == nil and (java_a3[1] == nil or type(java_a3[1]) == "table"))) end)

PathFindingInfoFactory.instance_f = nil

return PathFindingInfoFactory

