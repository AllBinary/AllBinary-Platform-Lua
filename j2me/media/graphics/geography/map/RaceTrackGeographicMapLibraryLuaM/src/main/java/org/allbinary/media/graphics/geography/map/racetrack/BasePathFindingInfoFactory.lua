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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathFindingNode = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
local GeographicMapCellPositionFactoryInitVisitorInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface")
local CommonSeps = require("org.allbinary.string.CommonSeps")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasePathFindingInfoFactory = {}
BasePathFindingInfoFactory.__index = BasePathFindingInfoFactory
BasePathFindingInfoFactory.className = "BasePathFindingInfoFactory"

function BasePathFindingInfoFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function BasePathFindingInfoFactory.new()
    local self = setmetatable({}, BasePathFindingInfoFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function BasePathFindingInfoFactory:init(geographicMapInterface, pathFindingInfo, mapArray)
        local RaceTrackGeographicMapCellPositionFactoryInitVisitor = {}
        RaceTrackGeographicMapCellPositionFactoryInitVisitor.__index = RaceTrackGeographicMapCellPositionFactoryInitVisitor
        RaceTrackGeographicMapCellPositionFactoryInitVisitor.className = "RaceTrackGeographicMapCellPositionFactoryInitVisitor"

        function RaceTrackGeographicMapCellPositionFactoryInitVisitor:_init_fields()
            self.startLineId = nil
            self.finishLineId = nil
        end
        

        function BasePathFindingInfoFactory.new()
            local self = setmetatable({}, BasePathFindingInfoFactory)
            self:_init_fields()
                local raceTrackGeographicMapCellTypeFactory = self.geographicMapInterface:getGeographicMapCellTypeFactory()
                self.startLineId = raceTrackGeographicMapCellTypeFactory:getStartType()
                self.finishLineId = raceTrackGeographicMapCellTypeFactory:getEndType()
            return self
        end
        

        -- throws Exception
        function BasePathFindingInfoFactory:visit(tiledLayer, cellPosition)
                local row = cellPosition:getRow()
                local column = cellPosition:getColumn()
                local try_ok, try_error = pcall(function()
                    local cellTypeId = self.mapArray[row + 1][column + 1]
                    local geographicCellType = self.geographicMapInterface:getCellTypeFromMapCellTypeInt(cellTypeId)
                    if geographicCellType == self.startLineId then
                        self:addStartPathFindingNode(self.pathFindingInfo, cellPosition)
                    end
                    if geographicCellType == self.finishLineId then
                        if geographicCellType == self.startLineId then
                            self:addEndPathFindingNode(self.pathFindingInfo, self.geographicMapInterface:getGeographicMapCellPositionFactoryInterface():getInstance(self.geographicMapInterface, cellPosition:getColumn(), cellPosition:getRow(), tiledLayer:getColumns(), tiledLayer:getRows(), tiledLayer:getCellWidth(), tiledLayer:getCellHeight()))
                        else
                            self:addEndPathFindingNode(self.pathFindingInfo, cellPosition)
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
                    local commonSeps = CommonSeps.getInstance()
                    self.logUtil:put(tostring(StringMaker.new():append(commonSeps.BRACKET_OPEN):appendint(row):append(commonSeps.BRACKET_CLOSE):append(commonSeps.BRACKET_OPEN):appendint(column):append("] in ["):appendint((self.mapArray.n or #self.mapArray)):append(commonSeps.BRACKET_CLOSE):append(commonSeps.BRACKET_OPEN):appendint((self.mapArray[1].n or #self.mapArray[1])):append(commonSeps.BRACKET_CLOSE)), self, "visit", e)
                    error(e, 0)
                end
        end

        geographicMapInterface:getGeographicMapCellPositionFactory():visit(RaceTrackGeographicMapCellPositionFactoryInitVisitor.new())
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
        error(java_exception("RuntimeException"), 0)
end

return BasePathFindingInfoFactory

