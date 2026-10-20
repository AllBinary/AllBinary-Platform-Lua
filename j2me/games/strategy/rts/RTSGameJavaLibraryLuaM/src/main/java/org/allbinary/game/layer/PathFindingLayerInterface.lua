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

local DestroyableInterface = require("org.allbinary.game.combat.destroy.DestroyableInterface")
local GroupInterfaceCompositeInterface = require("org.allbinary.game.identification.GroupInterfaceCompositeInterface")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local WaypointLayerInterface = require("org.allbinary.game.layer.waypoint.WaypointLayerInterface")
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

-- Java interface
local PathFindingLayerInterface = {}
PathFindingLayerInterface.__index = PathFindingLayerInterface
PathFindingLayerInterface.className = "PathFindingLayerInterface"
setmetatable(PathFindingLayerInterface, {__index = WaypointLayerInterface})


-- throws Exception
function PathFindingLayerInterface:getEndGeographicMapCellPositionList()
    error("abstract method getEndGeographicMapCellPositionList")
end


function PathFindingLayerInterface:shouldHandleStartSameAsEnd()
    error("abstract method shouldHandleStartSameAsEnd")
end


function PathFindingLayerInterface:getGeographicMapCellPositionArea()
    error("abstract method getGeographicMapCellPositionArea")
end


function PathFindingLayerInterface:getHudPaintable()
    error("abstract method getHudPaintable")
end


-- throws Exception
function PathFindingLayerInterface:handleCost(ownerLayer)
    error("abstract method handleCost")
end


function PathFindingLayerInterface:getParentLayer()
    error("abstract method getParentLayer")
end


function PathFindingLayerInterface:getRTSLayer2LogHelper()
    error("abstract method getRTSLayer2LogHelper")
end


-- throws Exception
function PathFindingLayerInterface:setTarget(targetGameLayer)
    error("abstract method setTarget")
end

return PathFindingLayerInterface

