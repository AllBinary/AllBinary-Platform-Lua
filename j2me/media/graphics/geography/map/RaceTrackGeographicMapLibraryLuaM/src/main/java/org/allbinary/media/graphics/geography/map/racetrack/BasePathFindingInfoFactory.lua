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
-- package org.allbinary.media.graphics.geography.map.racetrack

local BasePathFindingInfoFactory = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory"] = BasePathFindingInfoFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local PathFindingInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathFindingNode = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
local GeographicMapCellPositionFactoryInitVisitorInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local RaceTrackRoadsGeographicMapCellHistoryFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")

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

-- class table BasePathFindingInfoFactory is declared before the requires
BasePathFindingInfoFactory.__index = BasePathFindingInfoFactory
BasePathFindingInfoFactory.className = "BasePathFindingInfoFactory"
BasePathFindingInfoFactory.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory"

function BasePathFindingInfoFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function BasePathFindingInfoFactory._jinit(self)
    BasePathFindingInfoFactory._init_fields(self)
    return self
end

function BasePathFindingInfoFactory.new()
    return BasePathFindingInfoFactory._jinit(setmetatable({}, BasePathFindingInfoFactory))
end


-- throws Exception
function BasePathFindingInfoFactory:init(geographicMapInterface, pathFindingInfo, mapArray)
        local RaceTrackGeographicMapCellPositionFactoryInitVisitor = {}
        RaceTrackGeographicMapCellPositionFactoryInitVisitor.__index = RaceTrackGeographicMapCellPositionFactoryInitVisitor
        RaceTrackGeographicMapCellPositionFactoryInitVisitor.className = "RaceTrackGeographicMapCellPositionFactoryInitVisitor"
        RaceTrackGeographicMapCellPositionFactoryInitVisitor.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory$RaceTrackGeographicMapCellPositionFactoryInitVisitor"
        RaceTrackGeographicMapCellPositionFactoryInitVisitor.java_implements = " GeographicMapCellPositionFactoryInitVisitorInterface "
        RaceTrackGeographicMapCellPositionFactoryInitVisitor.java_interfaces = function() return {GeographicMapCellPositionFactoryInitVisitorInterface} end

        function RaceTrackGeographicMapCellPositionFactoryInitVisitor:_init_fields()
            if self.startLineId == nil then self.startLineId = 0 end
            if self.finishLineId == nil then self.finishLineId = 0 end
            if self.pathFindingInfoFactory == nil then self.pathFindingInfoFactory = nil end
            if self.geographicMapInterface == nil then self.geographicMapInterface = nil end
            if self.pathFindingInfo == nil then self.pathFindingInfo = nil end
            if self.mapArray == nil then self.mapArray = nil end
        end
        

        function RaceTrackGeographicMapCellPositionFactoryInitVisitor._jinit(self, pathFindingInfoFactory, geographicMapInterface, pathFindingInfo, mapArray)
            RaceTrackGeographicMapCellPositionFactoryInitVisitor._init_fields(self)
                self.pathFindingInfoFactory = pathFindingInfoFactory
                self.geographicMapInterface = geographicMapInterface
                self.pathFindingInfo = pathFindingInfo
                self.mapArray = mapArray
                local raceTrackGeographicMapCellTypeFactory = geographicMapInterface:getGeographicMapCellTypeFactory()
                self.startLineId = raceTrackGeographicMapCellTypeFactory:getStartType()
                self.finishLineId = raceTrackGeographicMapCellTypeFactory:getEndType()
            return self
        end

        function RaceTrackGeographicMapCellPositionFactoryInitVisitor.new(...)
            local self = setmetatable({}, RaceTrackGeographicMapCellPositionFactoryInitVisitor)
            RaceTrackGeographicMapCellPositionFactoryInitVisitor._jinit(self, ...)
            return self
        end
            function RaceTrackGeographicMapCellPositionFactoryInitVisitor.newEnclosed(outer, ...)
                local self = setmetatable({__javaOuter = outer}, RaceTrackGeographicMapCellPositionFactoryInitVisitor)
                RaceTrackGeographicMapCellPositionFactoryInitVisitor._jinit(self, ...)
                return self
            end
        

        -- throws Exception
        function RaceTrackGeographicMapCellPositionFactoryInitVisitor:visit(tiledLayer, cellPosition)
                local row = cellPosition:getRow()
                local column = cellPosition:getColumn()
                local try_ok, try_error, try_value = pcall(function()
                    local cellTypeId = self.mapArray[row + 1][column + 1]
                    local geographicCellType = self.geographicMapInterface:getCellTypeFromMapCellTypeInt(cellTypeId)
                    if rawequal(geographicCellType, self.startLineId) then
                        self.pathFindingInfoFactory:addStartPathFindingNode(self.pathFindingInfo, cellPosition)
                    end
                    if rawequal(geographicCellType, self.finishLineId) then
                        if rawequal(geographicCellType, self.startLineId) then
                            self.pathFindingInfoFactory:addEndPathFindingNode(self.pathFindingInfo, self.geographicMapInterface:getGeographicMapCellPositionFactoryInterface():getInstance(self.geographicMapInterface, cellPosition:getColumn(), cellPosition:getRow(), tiledLayer:getColumns(), tiledLayer:getRows(), tiledLayer:getCellWidth(), tiledLayer:getCellHeight()))
                        else
                            self.pathFindingInfoFactory:addEndPathFindingNode(self.pathFindingInfo, cellPosition)
                        end
                    end
                    local raceTrackGeographicMapCellTypeFactory = self.geographicMapInterface:getGeographicMapCellTypeFactory()
                    local geographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
                    if raceTrackGeographicMapCellTypeFactory:isPath(geographicMapCellTypeFactory:get(geographicCellType)) then
                        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance():track(cellPosition)
                    else
                    end
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    local commonSeps = CommonSeps.getInstance()
                    self.pathFindingInfoFactory.logUtil:put(tostring(StringMaker.new():append(commonSeps.BRACKET_OPEN):appendint(row):append(commonSeps.BRACKET_CLOSE):append(commonSeps.BRACKET_OPEN):appendint(column):append("] in ["):appendint((self.mapArray.n or #self.mapArray)):append(commonSeps.BRACKET_CLOSE):append(commonSeps.BRACKET_OPEN):appendint((self.mapArray[1].n or #self.mapArray[1])):append(commonSeps.BRACKET_CLOSE)), self, "visit", e)
                    error(e, 0)
                end
        end

        geographicMapInterface:getGeographicMapCellPositionFactory():visit(RaceTrackGeographicMapCellPositionFactoryInitVisitor.newEnclosed(self, self, geographicMapInterface, pathFindingInfo, mapArray))
end


-- throws Exception
function BasePathFindingInfoFactory:addStartPathFindingNode(pathFindingInfo, startGeographicMapCellPosition)
        pathFindingInfo:addStartPathFindingNode(PathFindingNode.new(NullUtil.getInstance().NULL_OBJECT, startGeographicMapCellPosition))
end


-- throws Exception
function BasePathFindingInfoFactory:addEndPathFindingNode(pathFindingInfo, endGeographicMapCellPosition)
        pathFindingInfo:addEndPathFindingNode(PathFindingNode.new(NullUtil.getInstance().NULL_OBJECT, endGeographicMapCellPosition))
end


-- throws Exception
function BasePathFindingInfoFactory:getInstancePathFindingInfo(geographicMapInterface, graphArray)
        error(require("java.lang.RuntimeException").new(), 0)
end

return BasePathFindingInfoFactory

