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
-- package org.allbinary.game.layer

local AllBinaryTiledLayerFactory = {}
package.loaded["org.allbinary.game.layer.AllBinaryTiledLayerFactory"] = AllBinaryTiledLayerFactory

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

local TiledLayer = java_lazy("javax.microedition.lcdui.game.TiledLayer")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local AllBinaryTiledLayerFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface")
local RaceTrackData = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData")
local RaceTrackInfo = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo")
local TiledLayerFactory = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.TiledLayerFactory")
local AllBinaryJ2METiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryJ2METiledLayer")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")

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

-- class table AllBinaryTiledLayerFactory is declared before the requires
AllBinaryTiledLayerFactory.__index = AllBinaryTiledLayerFactory
AllBinaryTiledLayerFactory.className = "AllBinaryTiledLayerFactory"
AllBinaryTiledLayerFactory.javaClassName = "org.allbinary.game.layer.AllBinaryTiledLayerFactory"
AllBinaryTiledLayerFactory.java_implements = " AllBinaryTiledLayerFactoryInterface "
AllBinaryTiledLayerFactory.java_interfaces = function() return {AllBinaryTiledLayerFactoryInterface} end

function AllBinaryTiledLayerFactory._jinit(self)
    return self
end

function AllBinaryTiledLayerFactory.new()
    return AllBinaryTiledLayerFactory._jinit(setmetatable({}, AllBinaryTiledLayerFactory))
end


-- throws Exception
function AllBinaryTiledLayerFactory:getInstance(raceTrackInfo, raceTrackData)
        local allbinaryTiledLayer = nil
        local tiledLayer = TiledLayerFactory.new():getInstance(raceTrackData)
        allbinaryTiledLayer = AllBinaryJ2METiledLayer.new(raceTrackData:getId(), tiledLayer, raceTrackData:getMapArray(), math.tointeger(BasicColorFactory.getInstance().RED // 1))
        allbinaryTiledLayer:setCells(raceTrackData:getMapArray())
        return allbinaryTiledLayer
end


-- throws Exception
function AllBinaryTiledLayerFactory:getMiniInstance(raceTrackData)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local tiledLayer = TiledLayerFactory.new():getMiniInstance(raceTrackData)
        local allbinaryTiledLayer = AllBinaryJ2METiledLayer.new(smallIntegerSingletonFactory:getAt(math.tointeger(raceTrackData:getId() // 1) + 100 + 1), tiledLayer, raceTrackData:getMapArray(), math.tointeger(BasicColorFactory.getInstance().RED // 1))
        allbinaryTiledLayer:setCells(raceTrackData:getMapArray())
        return allbinaryTiledLayer
end

return AllBinaryTiledLayerFactory

