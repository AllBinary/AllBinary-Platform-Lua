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

local TopViewCharacterInterface = {}
package.loaded["org.allbinary.game.behavior.topview.TopViewCharacterInterface"] = TopViewCharacterInterface

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

-- Java interface
-- class table TopViewCharacterInterface is declared before the requires
TopViewCharacterInterface.__index = TopViewCharacterInterface
TopViewCharacterInterface.className = "TopViewCharacterInterface"
TopViewCharacterInterface.javaClassName = "org.allbinary.game.behavior.topview.TopViewCharacterInterface"


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

