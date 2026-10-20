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
-- package org.allbinary.game.layer.geological.resources

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionFactoryInitVisitorInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeologicalGeographicMapCellPositionFactoryInitVisitor = {}
GeologicalGeographicMapCellPositionFactoryInitVisitor.__index = GeologicalGeographicMapCellPositionFactoryInitVisitor
GeologicalGeographicMapCellPositionFactoryInitVisitor.className = "GeologicalGeographicMapCellPositionFactoryInitVisitor"

function GeologicalGeographicMapCellPositionFactoryInitVisitor.new()
    local self = setmetatable({}, GeologicalGeographicMapCellPositionFactoryInitVisitor)
    return self
end


-- throws Exception
function GeologicalGeographicMapCellPositionFactoryInitVisitor:visit(tiledLayer, cellPosition)
        local geologicalGeographicMapCellPosition = (cellPosition)
        geologicalGeographicMapCellPosition:getGeologicalResource():init()
end

return GeologicalGeographicMapCellPositionFactoryInitVisitor

