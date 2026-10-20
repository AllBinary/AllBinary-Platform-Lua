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
-- package org.allbinary.media.graphics.geography.map

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
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

local NoGeographicMapCellPositionFactoryInitVisitor = {}
NoGeographicMapCellPositionFactoryInitVisitor.__index = NoGeographicMapCellPositionFactoryInitVisitor
NoGeographicMapCellPositionFactoryInitVisitor.className = "NoGeographicMapCellPositionFactoryInitVisitor"

function NoGeographicMapCellPositionFactoryInitVisitor.new()
    local self = setmetatable({}, NoGeographicMapCellPositionFactoryInitVisitor)
    return self
end


-- throws Exception
function NoGeographicMapCellPositionFactoryInitVisitor:visit(tiledLayer, cellPosition)
end

return NoGeographicMapCellPositionFactoryInitVisitor

