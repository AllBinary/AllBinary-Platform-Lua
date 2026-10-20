-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.input.form

local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointLayer = require("org.allbinary.game.layer.waypoint.WaypointLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PrimaryWaypointHelper = {}
PrimaryWaypointHelper.__index = PrimaryWaypointHelper
PrimaryWaypointHelper.className = "PrimaryWaypointHelper"

function PrimaryWaypointHelper:_init_fields()
    self.waypointLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
end


function PrimaryWaypointHelper.getInstance()
        return PrimaryWaypointHelper.instance
end


function PrimaryWaypointHelper.new()
    local self = setmetatable({}, PrimaryWaypointHelper)
    self:_init_fields()
    return self
end


function PrimaryWaypointHelper:getWaypointLayer()
        return self.waypointLayer
end


function PrimaryWaypointHelper:setWaypointLayer(waypointLayer)
        self.waypointLayer = waypointLayer
end

PrimaryWaypointHelper.instance = PrimaryWaypointHelper.new()

return PrimaryWaypointHelper

