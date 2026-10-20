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
-- package org.allbinary.game.layer

local AngleInfo = require("org.allbinary.math.AngleInfo")
local NamedAngle = require("org.allbinary.math.NamedAngle")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayerLogHelper = {}
RTSLayerLogHelper.__index = RTSLayerLogHelper
RTSLayerLogHelper.className = "RTSLayerLogHelper"

function RTSLayerLogHelper.new()
    local self = setmetatable({}, RTSLayerLogHelper)
    return self
end


function RTSLayerLogHelper.getInstance()
        return RTSLayerLogHelper.instance
end


function RTSLayerLogHelper:setClosestGeographicMapCellHistory(associatedAdvancedRTSGameLayer, pathsList)
end


function RTSLayerLogHelper:trackTo(associatedAdvancedRTSGameLayer, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason)
end


function RTSLayerLogHelper:turnTo(associatedAdvancedRTSGameLayer, dx, dy, angleInfo, angle, movementAngle, evading, targetAngle)
end


function RTSLayerLogHelper:doneMoving(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:closeEnough(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingLeft(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingRight(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingUp(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingDown(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:currentMoveEnded(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:evade(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:rotateLeft(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:rotateRight(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:handle(associatedAdvancedRTSGameLayer, movementAngle)
end


function RTSLayerLogHelper:noRotation(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:notOnPath(associatedAdvancedRTSGameLayer, geographicMapCellHistory, currentGeographicMapCellPosition, pathList)
end

RTSLayerLogHelper.instance = RTSLayerLogHelper.new()

return RTSLayerLogHelper

