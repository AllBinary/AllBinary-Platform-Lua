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
-- package org.allbinary.game.layer

local PathFindingLayerInterface = {}
package.loaded["org.allbinary.game.layer.PathFindingLayerInterface"] = PathFindingLayerInterface

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

local DestroyableInterface = require("org.allbinary.game.combat.destroy.DestroyableInterface")
local GroupInterfaceCompositeInterface = require("org.allbinary.game.identification.GroupInterfaceCompositeInterface")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local WaypointLayerInterface = require("org.allbinary.game.layer.waypoint.WaypointLayerInterface")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local GeographicMapCellPositionAreaBase = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local RTSLayer2LogHelper = java_lazy("org.allbinary.game.layer.RTSLayer2LogHelper")
local SelectionHudPaintable = java_lazy("org.allbinary.game.layer.SelectionHudPaintable")

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
-- class table PathFindingLayerInterface is declared before the requires
PathFindingLayerInterface.__index = PathFindingLayerInterface
PathFindingLayerInterface.className = "PathFindingLayerInterface"
PathFindingLayerInterface.javaClassName = "org.allbinary.game.layer.PathFindingLayerInterface"
setmetatable(PathFindingLayerInterface, {__index = WaypointLayerInterface})
PathFindingLayerInterface.java_interfaces = function() return {WaypointLayerInterface, GameKeyEventSourceInterface, GroupInterfaceCompositeInterface, DestroyableInterface} end


-- throws Exception
function PathFindingLayerInterface:getEndGeographicMapCellPositionList()
    error("abstract method getEndGeographicMapCellPositionList")
end


function PathFindingLayerInterface:shouldHandleStartSameAsEnd()
    error("abstract method shouldHandleStartSameAsEnd")
end


function PathFindingLayerInterface:getGeographicMapCellPositionArea()
    error("abstract method getGeographicMapCellPositionArea")
end


function PathFindingLayerInterface:getHudPaintable()
    error("abstract method getHudPaintable")
end


-- throws Exception
function PathFindingLayerInterface:handleCost(ownerLayer)
    error("abstract method handleCost")
end


function PathFindingLayerInterface:getParentLayer()
    error("abstract method getParentLayer")
end


function PathFindingLayerInterface:getRTSLayer2LogHelper()
    error("abstract method getRTSLayer2LogHelper")
end


-- throws Exception
function PathFindingLayerInterface:setTarget(targetGameLayer)
    error("abstract method setTarget")
end

return PathFindingLayerInterface

