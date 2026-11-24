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
-- package org.allbinary.media.graphics.geography.pathfinding

local GeographicMapCellPathHistoryInfo = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.GeographicMapCellPathHistoryInfo"] = GeographicMapCellPathHistoryInfo

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

local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")

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

-- class table GeographicMapCellPathHistoryInfo is declared before the requires
GeographicMapCellPathHistoryInfo.__index = GeographicMapCellPathHistoryInfo
GeographicMapCellPathHistoryInfo.className = "GeographicMapCellPathHistoryInfo"
GeographicMapCellPathHistoryInfo.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.GeographicMapCellPathHistoryInfo"

function GeographicMapCellPathHistoryInfo:_init_fields()
    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.previousOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.nextUnvisitedOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.nextOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.nextChosenOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end

function GeographicMapCellPathHistoryInfo._jinit(self)
    GeographicMapCellPathHistoryInfo._init_fields(self)
    return self
end

function GeographicMapCellPathHistoryInfo.new()
    return GeographicMapCellPathHistoryInfo._jinit(setmetatable({}, GeographicMapCellPathHistoryInfo))
end


function GeographicMapCellPathHistoryInfo:getPreviousGeographicMapCellPosition()
        return self.previousGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setPreviousGeographicMapCellPosition(previousGeographicMapCellPosition)
        self.previousGeographicMapCellPosition = previousGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getPreviousOnPathGeographicMapCellPosition()
        return self.previousOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setPreviousOnPathGeographicMapCellPosition(previousOnPathGeographicMapCellPosition)
        self.previousOnPathGeographicMapCellPosition = previousOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getNextUnvisitedOnPathGeographicMapCellPosition()
        return self.nextUnvisitedOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setNextUnvisitedOnPathGeographicMapCellPosition(nextUnvisitedOnPathGeographicMapCellPosition)
        self.nextUnvisitedOnPathGeographicMapCellPosition = nextUnvisitedOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getNextOnPathGeographicMapCellPosition()
        return self.nextOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setNextOnPathGeographicMapCellPosition(nextOnPathGeographicMapCellPosition)
        self.nextOnPathGeographicMapCellPosition = nextOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getNextChosenOnPathGeographicMapCellPosition()
        return self.nextChosenOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setNextChosenOnPathGeographicMapCellPosition(nextChosenOnPathGeographicMapCellPosition)
        self.nextChosenOnPathGeographicMapCellPosition = nextChosenOnPathGeographicMapCellPosition
end

return GeographicMapCellPathHistoryInfo

