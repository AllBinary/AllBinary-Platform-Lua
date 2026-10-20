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

local Direction = require("org.allbinary.direction.Direction")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local BasicTopViewGeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TopViewCharacterBehavior = {}
TopViewCharacterBehavior.__index = TopViewCharacterBehavior
TopViewCharacterBehavior.className = "TopViewCharacterBehavior"

function TopViewCharacterBehavior.new()
    local self = setmetatable({}, TopViewCharacterBehavior)
    return self
end


-- throws Exception
function TopViewCharacterBehavior:terrainEvent(layer, direction, x, y, geographicMapInterfaceArray, geographicMapCellPosition)
end


function TopViewCharacterBehavior:terrainMove(layer, geographicMapInterfaceArray, x, y)
end


function TopViewCharacterBehavior:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
        local size = (geographicMapInterfaceArray.n or #geographicMapInterfaceArray)
        local basicTopViewGeographicMapCellTypeFactory = nil
        for index = 0, size - 1 do
            basicTopViewGeographicMapCellTypeFactory = geographicMapInterfaceArray[index + 1]:getGeographicMapCellTypeFactory()
            if basicTopViewGeographicMapCellTypeFactory.BLOCK_CELL_TYPE:isType(geographicMapCellTypeArray[index + 1]) then
                return true
            end
        end
        return false
end

return TopViewCharacterBehavior

