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

local RTSLayerLogHelper = {}
package.loaded["org.allbinary.game.layer.RTSLayerLogHelper"] = RTSLayerLogHelper

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

local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local NamedAngle = java_lazy("org.allbinary.math.NamedAngle")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")

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

-- class table RTSLayerLogHelper is declared before the requires
RTSLayerLogHelper.__index = RTSLayerLogHelper
RTSLayerLogHelper.className = "RTSLayerLogHelper"
RTSLayerLogHelper.javaClassName = "org.allbinary.game.layer.RTSLayerLogHelper"

function RTSLayerLogHelper._jinit(self)
    return self
end

function RTSLayerLogHelper.new()
    return RTSLayerLogHelper._jinit(setmetatable({}, RTSLayerLogHelper))
end


function RTSLayerLogHelper.getInstance()
        return RTSLayerLogHelper.instance_f
end


function RTSLayerLogHelper:setClosestGeographicMapCellHistory(associatedAdvancedRTSGameLayer, pathsList)
end


function RTSLayerLogHelper:trackTo(associatedAdvancedRTSGameLayer, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason)
end


function RTSLayerLogHelper:turnTo(associatedAdvancedRTSGameLayer, dx, dy, angleInfo, angle, movementAngle, evading, targetAngle)
end


function RTSLayerLogHelper:doneMoving(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:closeEnough(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingLeft(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingRight(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingUp(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:movingDown(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:currentMoveEnded(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:evade(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:rotateLeft(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:rotateRight(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:handle(associatedAdvancedRTSGameLayer, movementAngle)
end


function RTSLayerLogHelper:noRotation(associatedAdvancedRTSGameLayer)
end


function RTSLayerLogHelper:notOnPath(associatedAdvancedRTSGameLayer, geographicMapCellHistory, currentGeographicMapCellPosition, pathList)
end

RTSLayerLogHelper.instance_f = RTSLayerLogHelper.new()

return RTSLayerLogHelper

