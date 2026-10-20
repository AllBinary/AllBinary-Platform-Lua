-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
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

-- Java interface
local GeographicMapCellPositionAreaInterface = {}
GeographicMapCellPositionAreaInterface.__index = GeographicMapCellPositionAreaInterface
GeographicMapCellPositionAreaInterface.className = "GeographicMapCellPositionAreaInterface"


function GeographicMapCellPositionAreaInterface:getNextSurroundingGeographicMapCellPosition()
    error("abstract method getNextSurroundingGeographicMapCellPosition")
end


function GeographicMapCellPositionAreaInterface:getOccupyingGeographicMapCellPositionList()
    error("abstract method getOccupyingGeographicMapCellPositionList")
end


function GeographicMapCellPositionAreaInterface:getSurroundingGeographicMapCellPositionList()
    error("abstract method getSurroundingGeographicMapCellPositionList")
end


-- throws Exception
function GeographicMapCellPositionAreaInterface:update(geographicMapInterface)
    error("abstract method update")
end

return GeographicMapCellPositionAreaInterface

