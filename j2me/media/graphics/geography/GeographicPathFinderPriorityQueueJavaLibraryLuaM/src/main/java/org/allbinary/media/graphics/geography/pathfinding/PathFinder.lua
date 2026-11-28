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
-- package org.allbinary.media.graphics.geography.pathfinding

local PathFinder = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.PathFinder"] = PathFinder

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

local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local RaceTrackGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local ABHashSet = java_lazy("org.allbinary.util.ABHashSet")
local ABPriorityQueue = java_lazy("org.allbinary.util.ABPriorityQueue")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local GeographicPathFinderBase = require("org.allbinary.media.graphics.geography.pathfinding.GeographicPathFinderBase")
local MultipassState = java_lazy("org.allbinary.media.graphics.geography.pathfinding.MultipassState")
local PathFindingNode = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
local PathFindingNodeCost = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCost")
local PathFindingNodeCostInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfo")

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

-- class table PathFinder is declared before the requires
PathFinder.__index = PathFinder
PathFinder.className = "PathFinder"
PathFinder.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.PathFinder"
setmetatable(PathFinder, {__index = GeographicPathFinderBase})

function PathFinder:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.mathUtil = MathUtil.getInstance()
    self.openPriorityQueue = ABPriorityQueue.new()
    self.closedSet = ABHashSet.new()
    self.geographicMapInterface = NullUtil.getInstance().NULL_OBJECT
    self.costArray = PathFindingNodeCost.NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY
end

function PathFinder._jinit(self)
    java_super_init(GeographicPathFinderBase, self)
    PathFinder._init_fields(self)
    return self
end

function PathFinder.new()
    return PathFinder._jinit(setmetatable({}, PathFinder))
end


-- throws Exception
function PathFinder:init(geographicMapInterface)
        self.geographicMapInterface = geographicMapInterface
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        self.costArray = java_new_array(nil, tiledLayer:getColumns(), tiledLayer:getRows())
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local node = nil
        local sizeX = (self.costArray.n or #self.costArray)
        local sizeY = (self.costArray[1].n or #self.costArray[1])
        for column = 0, sizeX - 1 do
            for row = 0, sizeY - 1 do
                local geographicMapCellType = geographicMapInterface:getCellTypeAt(basicGeographicMapCellPositionFactory:getAt(column, row))
                local raceTrackGeographicMapCellType = geographicMapCellType
                node = PathFindingNodeCost.new(NullUtil.getInstance().NULL_OBJECT, basicGeographicMapCellPositionFactory:getAt(column, row), PathFindingNodeCostInfo.new(java_int(raceTrackGeographicMapCellType:getTravelCost()), -1))
                self.costArray[column + 1][row + 1] = node
            end
        end
end
java_overload(PathFinder, "init", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicGeographicMap")) end)


function PathFinder:searchTotalPath(startPathFindingNodeList, endPathFindingNodeList, totalPaths)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self:search(startPathFindingNodeList:get(0), endPathFindingNodeList:get(0)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "search", e)
            return self.basicArrayListUtil:getImmutableInstance()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PathFinder, "searchTotalPath", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) and type(java_a3) == "number" end)


-- throws Exception
function PathFinder:searchTotalPathN(startPathFindingNodeList, endPathFindingNodeList, totalPaths, multipassState)
        if rawequal(multipassState.step, 0) then
            multipassState.step = multipassState.step + 1
        elseif rawequal(multipassState.step, 1) then
            self:searchStart(startPathFindingNodeList:get(0), endPathFindingNodeList:get(0), multipassState)
        elseif rawequal(multipassState.step, 2) then
            return self:searchN(startPathFindingNodeList:get(0), endPathFindingNodeList:get(0), multipassState)
        end
        return self.basicArrayListUtil:getImmutableInstance()
end
java_overload(PathFinder, "searchTotalPathN", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) and type(java_a3) == "number" and (java_a4 == nil or java_is(java_a4, "MultipassState")) end)


-- throws Exception
function PathFinder:search(startPathFindingNode, endPathFindingNode)
        local list = self:findPath(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition)
        local pathList = BasicArrayListD.new()
        pathList:add(list)
        return pathList
end
java_overload(PathFinder, "search", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "PathFindingNode")) and (java_a2 == nil or java_is(java_a2, "PathFindingNode")) end)


-- throws Exception
function PathFinder:searchStart(startPathFindingNode, endPathFindingNode, multipassState)
        self:findPathStart(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition, multipassState)
end
java_overload(PathFinder, "searchStart", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingNode")) and (java_a2 == nil or java_is(java_a2, "PathFindingNode")) and (java_a3 == nil or java_is(java_a3, "MultipassState")) end)


-- throws Exception
function PathFinder:searchN(startPathFindingNode, endPathFindingNode, multipassState)
        local list = self:findPathEnd(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition, multipassState)
        if rawequal(list, nil) then
            return self.basicArrayListUtil:getImmutableInstance()
        end
        local pathList = BasicArrayListD.new()
        pathList:add(list)
        multipassState.iteration = 0
        multipassState.step = 0
        return pathList
end
java_overload(PathFinder, "searchN", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "PathFindingNode")) and (java_a2 == nil or java_is(java_a2, "PathFindingNode")) and (java_a3 == nil or java_is(java_a3, "MultipassState")) end)


-- throws Exception
function PathFinder:findPath(start, target)
        self.openPriorityQueue:clear()
        self.closedSet:clear()
        local discoveryCalculation = 0
        local node = nil
        local targetColumn = target:getColumn()
        local targetRow = target:getRow()
        local sizeX = (self.costArray.n or #self.costArray)
        local sizeY = (self.costArray[1].n or #self.costArray[1])
        for column = 0, sizeX - 1 do
            for row = 0, sizeY - 1 do
                discoveryCalculation = java_int(self.mathUtil:abs(column - targetColumn)) + self.mathUtil:abs(row - targetRow)
                node = self.costArray[column + 1][row + 1]
                node.pathFindingNodeCostInfoP.totalCostP = 0
                node.pathFindingNodeCostInfoP.costToEndP = discoveryCalculation
            end
        end
        local startNode = self.costArray[start:getColumn() + 1][start:getRow() + 1]
        self.openPriorityQueue:add(startNode)
        local geographicMapInterface = self.geographicMapInterface
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local targetNode = self.costArray[target:getColumn() + 1][target:getRow() + 1]
        local current = nil
        repeat
            current = self.openPriorityQueue:poll()
            self.closedSet:add(current)
            if require("allbinary_java").equals(current, targetNode) then
                return self:extractPath(start, current)
            end
            local neighbor = nil
            local neighborInfo = nil
            local calculatedCost = 0
            for column = current.geographicMapCellPosition:getColumn() - 1, current.geographicMapCellPosition:getColumn() + 2 - 1 do
                for row = current.geographicMapCellPosition:getRow() - 1, current.geographicMapCellPosition:getRow() + 2 - 1 do
                    do
                    if column > 0 and row > 0 and column < allBinaryTiledLayer:getColumns() and row < allBinaryTiledLayer:getRows() and geographicMapInterface:isOnMap(basicGeographicMapCellPositionFactory:getAt(column, row)) then
                        neighbor = self.costArray[column + 1][row + 1]
                        if self.closedSet:contains(neighbor) then
                            goto continue_N70404
                        end
                        neighborInfo = neighbor.pathFindingNodeCostInfoP
                        calculatedCost = neighborInfo.costToEndP + neighborInfo.costFromStartP + current.pathFindingNodeCostInfoP.totalCostP
                        if calculatedCost < neighborInfo.totalCostP or not (self.openPriorityQueue:contains(neighbor)) then
                            neighborInfo.totalCostP = calculatedCost
                            neighbor.parent = current
                            if not (self.openPriorityQueue:contains(neighbor)) then
                                if geographicMapInterface:isOfFourDirections(current.geographicMapCellPosition, neighbor.geographicMapCellPosition) then
                                    self.openPriorityQueue:add(neighbor)
                                end
                            end
                        end
                    end
                    end
                    ::continue_N70404::
                end
            end
        until not (not (self.openPriorityQueue:isEmpty()))
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(PathFinder, "findPath", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


-- throws Exception
function PathFinder:findPathStart(start, target, multipassState)
        self.openPriorityQueue:clear()
        self.closedSet:clear()
        local discoveryCalculation = 0
        local node = nil
        local targetColumn = target:getColumn()
        local targetRow = target:getRow()
        local sizeX = (self.costArray.n or #self.costArray)
        local sizeY = (self.costArray[1].n or #self.costArray[1])
        for column = 0, sizeX - 1 do
            for row = 0, sizeY - 1 do
                discoveryCalculation = java_int(self.mathUtil:abs(column - targetColumn)) + self.mathUtil:abs(row - targetRow)
                node = self.costArray[column + 1][row + 1]
                node.pathFindingNodeCostInfoP.totalCostP = 0
                node.pathFindingNodeCostInfoP.costToEndP = discoveryCalculation
            end
        end
        local startNode = self.costArray[start:getColumn() + 1][start:getRow() + 1]
        self.openPriorityQueue:add(startNode)
        multipassState.step = multipassState.step + 1
end
java_overload(PathFinder, "findPathStart", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) and (java_a3 == nil or java_is(java_a3, "MultipassState")) end)


-- throws Exception
function PathFinder:findPathEnd(start, target, multipassState)
        local geographicMapInterface = self.geographicMapInterface
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local targetNode = self.costArray[target:getColumn() + 1][target:getRow() + 1]
        local current = nil
        local total = 0
        repeat
            current = self.openPriorityQueue:poll()
            self.closedSet:add(current)
            if require("allbinary_java").equals(current, targetNode) then
                return self:extractPath(start, current)
            end
            local neighbor = nil
            local neighborInfo = nil
            local calculatedCost = 0
            for column = current.geographicMapCellPosition:getColumn() - 1, current.geographicMapCellPosition:getColumn() + 2 - 1 do
                for row = current.geographicMapCellPosition:getRow() - 1, current.geographicMapCellPosition:getRow() + 2 - 1 do
                    do
                    if column > 0 and row > 0 and column < allBinaryTiledLayer:getColumns() and row < allBinaryTiledLayer:getRows() and geographicMapInterface:isOnMap(basicGeographicMapCellPositionFactory:getAt(column, row)) then
                        neighbor = self.costArray[column + 1][row + 1]
                        if self.closedSet:contains(neighbor) then
                            goto continue_N72950
                        end
                        neighborInfo = neighbor.pathFindingNodeCostInfoP
                        calculatedCost = neighborInfo.costToEndP + neighborInfo.costFromStartP + current.pathFindingNodeCostInfoP.totalCostP
                        if calculatedCost < neighborInfo.totalCostP or not (self.openPriorityQueue:contains(neighbor)) then
                            neighborInfo.totalCostP = calculatedCost
                            neighbor.parent = current
                            if not (self.openPriorityQueue:contains(neighbor)) then
                                if geographicMapInterface:isOfFourDirections(current.geographicMapCellPosition, neighbor.geographicMapCellPosition) then
                                    self.openPriorityQueue:add(neighbor)
                                end
                            end
                        end
                    end
                    end
                    ::continue_N72950::
                end
            end
            total = total + 1
            if total > 10 then
                return self.basicArrayListUtil:getImmutableInstance()
            end
        until not (not (self.openPriorityQueue:isEmpty()))
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(PathFinder, "findPathEnd", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) and (java_a3 == nil or java_is(java_a3, "MultipassState")) end)


function PathFinder:extractPath(start, current)
        local path = BasicArrayListD.new()
        while not rawequal(current.parent, NullUtil.getInstance().NULL_OBJECT) do
            path:add(current.geographicMapCellPosition)
            current = current.parent
        end
        path:add(start)
        self.basicArrayListUtil:reverse(path)
        return path
end
java_overload(PathFinder, "extractPath", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) and (java_a2 == nil or java_is(java_a2, "PathFindingNodeCost")) end)

return PathFinder

