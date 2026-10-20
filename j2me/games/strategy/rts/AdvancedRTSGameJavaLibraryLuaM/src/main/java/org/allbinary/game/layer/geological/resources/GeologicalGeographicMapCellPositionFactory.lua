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
--   
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer.geological.resources

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionFactoryInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeologicalGeographicMapCellPositionFactory = {}
GeologicalGeographicMapCellPositionFactory.__index = GeologicalGeographicMapCellPositionFactory
GeologicalGeographicMapCellPositionFactory.className = "GeologicalGeographicMapCellPositionFactory"

function GeologicalGeographicMapCellPositionFactory:_init_fields()
    self.resourcePerMapCellType = nil
end


function GeologicalGeographicMapCellPositionFactory.new(resourcePerMapCellType)
    local self = setmetatable({}, GeologicalGeographicMapCellPositionFactory)
    self:_init_fields()
        self.resourcePerMapCellType = resourcePerMapCellType
    return self
end


-- throws Exception
function GeologicalGeographicMapCellPositionFactory:getInstance(geographicMapInterface, i_column, i_row, columns, rows, width, height)
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local resources = self.resourcePerMapCellType[tiledLayer:getCell(i_column, i_row) + 1] + MyRandomFactory.getInstance():getAbsoluteNextInt(1000)
        return GeologicalGeographicMapCellPosition.new(i_column, i_row, columns, rows, width, height, GeologicalResource.new(resources))
end

return GeologicalGeographicMapCellPositionFactory

