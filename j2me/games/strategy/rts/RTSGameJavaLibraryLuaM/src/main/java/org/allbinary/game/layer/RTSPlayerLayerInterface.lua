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
-- package org.allbinary.game.layer

local GameNotificationHudCompositeInterface = require("org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHudCompositeInterface")
local BuildMenuCompositeInterface = require("org.allbinary.game.input.BuildMenuCompositeInterface")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local Capital = require("org.allbinary.game.layer.capital.Capital")
local DestroyedEventListenerInterface = require("org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface")
local PlayerGameInputCompositeInterface = require("org.allbinary.game.input.PlayerGameInputCompositeInterface")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")
local Sound = require("org.allbinary.media.audio.Sound")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")

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
local RTSPlayerLayerInterface = {}
RTSPlayerLayerInterface.__index = RTSPlayerLayerInterface
RTSPlayerLayerInterface.className = "RTSPlayerLayerInterface"
setmetatable(RTSPlayerLayerInterface, {__index = GameNotificationHudCompositeInterface})


function RTSPlayerLayerInterface:getCapital()
    error("abstract method getCapital")
end


function RTSPlayerLayerInterface:getRTSFormInput()
    error("abstract method getRTSFormInput")
end


function RTSPlayerLayerInterface:add(sound)
    error("abstract method add")
end


function RTSPlayerLayerInterface:getPlayerOwnedRTSLayers()
    error("abstract method getPlayerOwnedRTSLayers")
end


function RTSPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface()
    error("abstract method implmentsArtificialIntelligenceCompositeInterface")
end

return RTSPlayerLayerInterface

