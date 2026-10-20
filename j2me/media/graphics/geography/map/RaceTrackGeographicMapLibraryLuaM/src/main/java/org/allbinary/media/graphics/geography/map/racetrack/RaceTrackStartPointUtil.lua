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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathFindingNode = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackStartPointUtil = {}
RaceTrackStartPointUtil.__index = RaceTrackStartPointUtil
RaceTrackStartPointUtil.className = "RaceTrackStartPointUtil"

function RaceTrackStartPointUtil.new()
    local self = setmetatable({}, RaceTrackStartPointUtil)
    return self
end


-- throws Exception
function RaceTrackStartPointUtil.get(geographicMapInterface, pathFindingInfo, index)
        local list = pathFindingInfo:getStartPathFindingNodeList()
        local startPathFindingNode = list:get(index)
        local geographicMapCellPosition = startPathFindingNode.geographicMapCellPosition
        local point = geographicMapCellPosition:getPoint()
        return PointFactory.getInstance():createXY(point:getX(), point:getY() + geographicMapInterface:getAllBinaryTiledLayer():getHalfCellHeight())
end

return RaceTrackStartPointUtil

