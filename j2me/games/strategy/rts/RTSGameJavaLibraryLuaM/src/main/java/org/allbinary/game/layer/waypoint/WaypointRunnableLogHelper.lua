-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.layer.waypoint

local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointRunnableLogHelper = {}
WaypointRunnableLogHelper.__index = WaypointRunnableLogHelper
WaypointRunnableLogHelper.className = "WaypointRunnableLogHelper"

function WaypointRunnableLogHelper.new()
    local self = setmetatable({}, WaypointRunnableLogHelper)
    return self
end


function WaypointRunnableLogHelper.getInstance()
        return WaypointRunnableLogHelper.instance
end


function WaypointRunnableLogHelper:start(pathFindingLayerInterface)
end


function WaypointRunnableLogHelper:end_(pathFindingLayerInterface)
end

WaypointRunnableLogHelper.instance = WaypointRunnableLogHelper.new()

return WaypointRunnableLogHelper

