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

local TopViewCharacterBehavior = {}
package.loaded["org.allbinary.game.behavior.topview.TopViewCharacterBehavior"] = TopViewCharacterBehavior

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

local Direction = java_lazy("org.allbinary.direction.Direction")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local BasicTopViewGeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory")

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

-- class table TopViewCharacterBehavior is declared before the requires
TopViewCharacterBehavior.__index = TopViewCharacterBehavior
TopViewCharacterBehavior.className = "TopViewCharacterBehavior"
TopViewCharacterBehavior.javaClassName = "org.allbinary.game.behavior.topview.TopViewCharacterBehavior"

function TopViewCharacterBehavior._jinit(self)
    return self
end

function TopViewCharacterBehavior.new()
    return TopViewCharacterBehavior._jinit(setmetatable({}, TopViewCharacterBehavior))
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

