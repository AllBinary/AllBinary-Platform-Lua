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
-- package org.allbinary.media.graphics.geography.map.racetrack

local BasicGeographicMapFactory = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.BasicGeographicMapFactory"] = BasicGeographicMapFactory

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

local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPositionBaseFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory")
local GeographicMapCellPositionFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local AllBinaryTiledLayerFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface")
local RaceTrackData = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData")
local RaceTrackInfo = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo")

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

-- class table BasicGeographicMapFactory is declared before the requires
BasicGeographicMapFactory.__index = BasicGeographicMapFactory
BasicGeographicMapFactory.className = "BasicGeographicMapFactory"
BasicGeographicMapFactory.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.BasicGeographicMapFactory"

function BasicGeographicMapFactory._jinit(self)
    return self
end

function BasicGeographicMapFactory.new()
    return BasicGeographicMapFactory._jinit(setmetatable({}, BasicGeographicMapFactory))
end


-- throws Exception
function BasicGeographicMapFactory:getInstance(raceTrackInfo, raceTrackData, tiledLayerFactoryInterface, geographicMapCellPositionFactoryInterface, geographicMapCellTypeFactory)
        return BasicGeographicMap.new(SmallIntegerSingletonFactory.getInstance():getAt(require("allbinary_java").number_value(raceTrackInfo:getId(), "intValue") + 100 + 1), raceTrackInfo:getName(), raceTrackData:getCellTypeIdToGeographicMapCellTypeArray(), tiledLayerFactoryInterface:getMiniInstance(raceTrackData), BasicColorFactory.getInstance().CLEAR_COLOR, BasicColorFactory.getInstance().CLEAR_COLOR, geographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory.new(), geographicMapCellTypeFactory)
end

return BasicGeographicMapFactory

