-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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

local GameType = require("org.allbinary.game.GameType")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local AdvancedRTSPlayerLayerInterface = {}
AdvancedRTSPlayerLayerInterface.__index = AdvancedRTSPlayerLayerInterface
AdvancedRTSPlayerLayerInterface.className = "AdvancedRTSPlayerLayerInterface"
setmetatable(AdvancedRTSPlayerLayerInterface, {__index = RTSPlayerLayerInterface})


function AdvancedRTSPlayerLayerInterface:getAdvancedPlayerOwnedRTSLayers()
    error("abstract method getAdvancedPlayerOwnedRTSLayers")
end


function AdvancedRTSPlayerLayerInterface:isLocalPlayer()
    error("abstract method isLocalPlayer")
end


function AdvancedRTSPlayerLayerInterface:getGameType()
    error("abstract method getGameType")
end


function AdvancedRTSPlayerLayerInterface:getDecalBasicColor()
    error("abstract method getDecalBasicColor")
end

return AdvancedRTSPlayerLayerInterface

