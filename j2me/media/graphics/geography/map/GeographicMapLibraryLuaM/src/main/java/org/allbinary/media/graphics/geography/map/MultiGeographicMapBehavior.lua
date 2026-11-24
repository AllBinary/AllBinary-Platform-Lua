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

local MultiGeographicMapBehavior = {}
package.loaded["org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior"] = MultiGeographicMapBehavior

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table MultiGeographicMapBehavior is declared before the requires
MultiGeographicMapBehavior.__index = MultiGeographicMapBehavior
MultiGeographicMapBehavior.className = "MultiGeographicMapBehavior"
MultiGeographicMapBehavior.javaClassName = "org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior"

function MultiGeographicMapBehavior._jinit(self)
    return self
end

function MultiGeographicMapBehavior.new()
    return MultiGeographicMapBehavior._jinit(setmetatable({}, MultiGeographicMapBehavior))
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

