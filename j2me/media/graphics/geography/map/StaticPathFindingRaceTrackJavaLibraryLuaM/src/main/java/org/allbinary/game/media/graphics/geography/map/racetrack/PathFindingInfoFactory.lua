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

local CommonStrings = require("org.allbinary.string.CommonStrings")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasePathFindingInfoFactory = require("org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory")
local RaceTrackRoadsGeographicMapCellHistoryFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathFindingNodeCostInfoFactoryBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathFindingInfoFactory = {}
PathFindingInfoFactory.__index = PathFindingInfoFactory
PathFindingInfoFactory.className = "PathFindingInfoFactory"
setmetatable(PathFindingInfoFactory, {__index = BasePathFindingInfoFactory})


function PathFindingInfoFactory.getInstance()
        return PathFindingInfoFactory.instance
end


function PathFindingInfoFactory.new()
    local self = setmetatable(BasePathFindingInfoFactory.new(), PathFindingInfoFactory)
    return self
end


-- throws Exception
function PathFindingInfoFactory:getInstancePathFindingInfo(geographicMapInterface, graphArray)
        local commonStrings = CommonStrings.getInstance()
        PreLogUtil.put(commonStrings.START, self, commonStrings.GET_INSTANCE)
        local pathFindingInfo = PathFindingInfo.new(PathFindingNodeCostInfoFactoryBase.new(), BasicArrayListS.new(1), BasicArrayListS.new(1))
        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance():init()
        self:init(geographicMapInterface, pathFindingInfo, graphArray)
        return pathFindingInfo
end

PathFindingInfoFactory.instance = PathFindingInfoFactory.new()

return PathFindingInfoFactory

