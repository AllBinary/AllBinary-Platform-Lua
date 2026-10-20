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
-- package org.allbinary.game.layer.geological.resources

local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local WaypointLayer = require("org.allbinary.game.layer.waypoint.WaypointLayer")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local Group = require("org.allbinary.game.identification.Group")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ResourceWaypointLayer = {}
ResourceWaypointLayer.__index = ResourceWaypointLayer
ResourceWaypointLayer.className = "ResourceWaypointLayer"
setmetatable(ResourceWaypointLayer, {__index = WaypointLayer})


function ResourceWaypointLayer.new(remoteInfo, parentLayer, groupInterface, rootName, name, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y)
    local self = setmetatable(WaypointLayer.new(remoteInfo, parentLayer, groupInterface, rootName, name, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y), ResourceWaypointLayer)
        -- super(...) made self above
    return self
end


function ResourceWaypointLayer:createHudPaintable()
        local rtsLayerHudPaintable = GeologicalResourceInfoHudPaintableSingleton.getInstance()
        rtsLayerHudPaintable:setBasicColorP(self.allBinaryGameLayerManagerP:getForegroundBasicColor())
        rtsLayerHudPaintable:setRtsLayer(self)
        return rtsLayerHudPaintable
end


function ResourceWaypointLayer:getHudPaintable()
        local rtsLayerHudPaintable = GeologicalResourceInfoHudPaintableSingleton.getInstance()
        return rtsLayerHudPaintable
end

return ResourceWaypointLayer

