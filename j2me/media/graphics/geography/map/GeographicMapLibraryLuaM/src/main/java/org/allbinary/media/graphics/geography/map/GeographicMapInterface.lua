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

local GeographicMapInterface = {}
package.loaded["org.allbinary.media.graphics.geography.map.GeographicMapInterface"] = GeographicMapInterface

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

local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local Layer = java_lazy("org.allbinary.layer.Layer")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
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
-- class table GeographicMapInterface is declared before the requires
GeographicMapInterface.__index = GeographicMapInterface
GeographicMapInterface.className = "GeographicMapInterface"
GeographicMapInterface.javaClassName = "org.allbinary.media.graphics.geography.map.GeographicMapInterface"


function GeographicMapInterface:getId()
    error("abstract method getId")
end


function GeographicMapInterface:getName()
    error("abstract method getName")
end


function GeographicMapInterface:reset()
    error("abstract method reset")
end


function GeographicMapInterface:getAllBinaryTiledLayer()
    error("abstract method getAllBinaryTiledLayer")
end


-- throws Exception
function GeographicMapInterface:getCellPositionsAt(layer, currentCellPositionArray, cellPositionArray)
    error("abstract method getCellPositionsAt")
end


-- throws Exception
function GeographicMapInterface:getCellPositionAtXY(x, y)
    error("abstract method getCellPositionAtXY")
end


-- throws Exception
function GeographicMapInterface:getCellPositionAtXYNoThrow(x, y)
    error("abstract method getCellPositionAtXYNoThrow")
end


function GeographicMapInterface:getCellTypeFromMapCellTypeInt(cellTypeId)
    error("abstract method getCellTypeFromMapCellTypeInt")
end


-- throws Exception
function GeographicMapInterface:getCellTypeAtXY(x, y)
    error("abstract method getCellTypeAtXY")
end


-- throws Exception
function GeographicMapInterface:getCellTypeAt(geographicMapCellPosition)
    error("abstract method getCellTypeAt")
end


function GeographicMapInterface:getGeographicMapCellPositionFactory()
    error("abstract method getGeographicMapCellPositionFactory")
end


function GeographicMapInterface:getGeographicMapCellPositionFactoryInterface()
    error("abstract method getGeographicMapCellPositionFactoryInterface")
end


function GeographicMapInterface:getForegroundBasicColor()
    error("abstract method getForegroundBasicColor")
end


function GeographicMapInterface:getBackgroundBasicColor()
    error("abstract method getBackgroundBasicColor")
end

return GeographicMapInterface

