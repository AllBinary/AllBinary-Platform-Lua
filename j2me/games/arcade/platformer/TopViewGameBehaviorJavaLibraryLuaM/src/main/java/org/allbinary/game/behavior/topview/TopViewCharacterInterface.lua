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
-- package org.allbinary.game.behavior.topview

local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")

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
local TopViewCharacterInterface = {}
TopViewCharacterInterface.__index = TopViewCharacterInterface
TopViewCharacterInterface.className = "TopViewCharacterInterface"


function TopViewCharacterInterface:terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y)
    error("abstract method terrainMove")
end


-- throws Exception
function TopViewCharacterInterface:terrainEvent(x, y, geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
    error("abstract method terrainEvent")
end


function TopViewCharacterInterface:move()
    error("abstract method move")
end


function TopViewCharacterInterface:upp()
    error("abstract method upp")
end


function TopViewCharacterInterface:leftp()
    error("abstract method leftp")
end


function TopViewCharacterInterface:rightp()
    error("abstract method rightp")
end


-- throws Exception
function TopViewCharacterInterface:reset()
    error("abstract method reset")
end

return TopViewCharacterInterface

