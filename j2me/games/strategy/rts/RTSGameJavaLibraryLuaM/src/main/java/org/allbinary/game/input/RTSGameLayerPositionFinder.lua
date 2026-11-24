-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.input

local RTSGameLayerPositionFinder = {}
package.loaded["org.allbinary.game.input.RTSGameLayerPositionFinder"] = RTSGameLayerPositionFinder

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

local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local LayerPositionFinderInterface = require("org.allbinary.game.input.LayerPositionFinderInterface")

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

-- class table RTSGameLayerPositionFinder is declared before the requires
RTSGameLayerPositionFinder.__index = RTSGameLayerPositionFinder
RTSGameLayerPositionFinder.className = "RTSGameLayerPositionFinder"
RTSGameLayerPositionFinder.javaClassName = "org.allbinary.game.input.RTSGameLayerPositionFinder"
RTSGameLayerPositionFinder.java_implements = " LayerPositionFinderInterface "
RTSGameLayerPositionFinder.java_interfaces = function() return {LayerPositionFinderInterface} end


function RTSGameLayerPositionFinder.getInstance()
        return RTSGameLayerPositionFinder.instance_f
end


function RTSGameLayerPositionFinder._jinit(self)
    return self
end

function RTSGameLayerPositionFinder.new(...)
    local self = setmetatable({}, RTSGameLayerPositionFinder)
    RTSGameLayerPositionFinder._jinit(self, ...)
    return self
end


function RTSGameLayerPositionFinder:getLayerInterface(geographicMapCellPosition)
        return DropCellPositionHistory.getInstance():getLayerInterface(geographicMapCellPosition)
end

RTSGameLayerPositionFinder.instance_f = RTSGameLayerPositionFinder.new()

return RTSGameLayerPositionFinder

