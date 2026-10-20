-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer.waypoint

local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local Group = require("org.allbinary.game.identification.Group")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local WaypointLayer = require("org.allbinary.game.layer.waypoint.WaypointLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VisualWaypointLayer = {}
VisualWaypointLayer.__index = VisualWaypointLayer
VisualWaypointLayer.className = "VisualWaypointLayer"
setmetatable(VisualWaypointLayer, {__index = WaypointLayer})


function VisualWaypointLayer.new(remoteInfo, parentLayer, groupInterface, rootName, name, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y)
    local self = setmetatable(WaypointLayer.new(remoteInfo, parentLayer, groupInterface, rootName, name, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y), VisualWaypointLayer)
        -- super(...) made self above
    return self
end


function VisualWaypointLayer:createHudPaintable()
        local rtsLayerHudPaintable = WaypointInfoHudPaintableSingleton.getInstance()
        rtsLayerHudPaintable:setBasicColorP(self.allBinaryGameLayerManagerP:getForegroundBasicColor())
        rtsLayerHudPaintable:setRtsLayer(self)
        return rtsLayerHudPaintable
end


function VisualWaypointLayer:getHudPaintable()
        local rtsLayerHudPaintable = WaypointInfoHudPaintableSingleton.getInstance()
        return rtsLayerHudPaintable
end

return VisualWaypointLayer

