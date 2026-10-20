--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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

local CellPosition = require("org.allbinary.graphics.CellPosition")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CachingGeographicMapCellPositionFactory = {}
CachingGeographicMapCellPositionFactory.__index = CachingGeographicMapCellPositionFactory
CachingGeographicMapCellPositionFactory.className = "CachingGeographicMapCellPositionFactory"
setmetatable(CachingGeographicMapCellPositionFactory, {__index = BasicGeographicMapCellPositionFactory})


function CachingGeographicMapCellPositionFactory.new(geographicMapInterface)
    local self = setmetatable(BasicGeographicMapCellPositionFactory.new(geographicMapInterface), CachingGeographicMapCellPositionFactory)
        -- super(...) made self above
    return self
end


-- throws Exception
function CachingGeographicMapCellPositionFactory:createInstance(i_column, i_row, width, height)
        local hashtable = GeographicMapCellPositionFactory.getHashtable()
        local cellPositionKey = CellPosition.toStringColRow(i_column, i_row)
        local cellPositionCanBeNull = hashtable:get(cellPositionKey)
        if cellPositionCanBeNull == nil then
            cellPositionCanBeNull = self.geographicMapCellPositionFactoryInterface:getInstance(self.geographicMapInterface, i_column, i_row, self:getColumns(), self:getRows(), width, height)
            self.geographicMapCellPositionArray[i_row + 1][i_column + 1] = cellPositionCanBeNull
            hashtable:put(cellPositionKey, cellPositionCanBeNull)
        end
        return cellPositionCanBeNull
end

return CachingGeographicMapCellPositionFactory

