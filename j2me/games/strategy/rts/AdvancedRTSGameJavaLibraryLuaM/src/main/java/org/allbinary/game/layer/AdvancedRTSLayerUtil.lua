-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer

local WorkWaypoint = require("org.allbinary.game.layer.waypoint.WorkWaypoint")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local BaseRaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvancedRTSLayerUtil = {}
AdvancedRTSLayerUtil.__index = AdvancedRTSLayerUtil
AdvancedRTSLayerUtil.className = "AdvancedRTSLayerUtil"

function AdvancedRTSLayerUtil.new()
    local self = setmetatable({}, AdvancedRTSLayerUtil)
    return self
end


function AdvancedRTSLayerUtil.getInstance()
        return AdvancedRTSLayerUtil.instance
end


function AdvancedRTSLayerUtil:createFakeRTSLayerHashtable(baseRaceTrackGeographicMap)
        local hashtable = RTSLayerUtil.getInstance():createFakeRTSLayerHashtable(baseRaceTrackGeographicMap)
        hashtable:put(WorkWaypoint.ID, SmallIntegerSingletonFactory.getInstance():getAt(50))
        return hashtable
end

AdvancedRTSLayerUtil.instance = AdvancedRTSLayerUtil.new()

return AdvancedRTSLayerUtil

