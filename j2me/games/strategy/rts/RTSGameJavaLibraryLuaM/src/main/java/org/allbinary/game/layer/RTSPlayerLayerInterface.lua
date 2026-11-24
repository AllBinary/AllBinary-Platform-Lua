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

local RTSPlayerLayerInterface = {}
package.loaded["org.allbinary.game.layer.RTSPlayerLayerInterface"] = RTSPlayerLayerInterface

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

local GameNotificationHudCompositeInterface = require("org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHudCompositeInterface")
local BuildMenuCompositeInterface = require("org.allbinary.game.input.BuildMenuCompositeInterface")
local RTSFormInput = java_lazy("org.allbinary.game.input.form.RTSFormInput")
local Capital = java_lazy("org.allbinary.game.layer.capital.Capital")
local DestroyedEventListenerInterface = require("org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface")
local PlayerGameInputCompositeInterface = require("org.allbinary.game.input.PlayerGameInputCompositeInterface")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local PlayerOwnedRTSLayers = java_lazy("org.allbinary.game.layer.PlayerOwnedRTSLayers")

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
-- class table RTSPlayerLayerInterface is declared before the requires
RTSPlayerLayerInterface.__index = RTSPlayerLayerInterface
RTSPlayerLayerInterface.className = "RTSPlayerLayerInterface"
RTSPlayerLayerInterface.javaClassName = "org.allbinary.game.layer.RTSPlayerLayerInterface"
setmetatable(RTSPlayerLayerInterface, {__index = GameNotificationHudCompositeInterface})
RTSPlayerLayerInterface.java_interfaces = function() return {GameNotificationHudCompositeInterface, BuildMenuCompositeInterface, PlayerGameInputCompositeInterface, DestroyedEventListenerInterface, TickableInterface, PathFindingLayerInterface} end


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

