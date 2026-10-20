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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultiGeographicMapBehavior = {}
MultiGeographicMapBehavior.__index = MultiGeographicMapBehavior
MultiGeographicMapBehavior.className = "MultiGeographicMapBehavior"

function MultiGeographicMapBehavior.new()
    local self = setmetatable({}, MultiGeographicMapBehavior)
    return self
end


-- throws Exception
function MultiGeographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
        local size = (geographicMapInterfaceArray.n or #geographicMapInterfaceArray)
        local cellType = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE
        do
            local index = size
            while (function() index = index - 1 return index end)() >= 0 do
            cellType = geographicMapInterfaceArray[index + 1]:getCellTypeAt(geographicMapCellPosition)
            geographicMapCellTypeArray[index + 1] = cellType
            end
        end
        return geographicMapCellTypeArray
end

return MultiGeographicMapBehavior

