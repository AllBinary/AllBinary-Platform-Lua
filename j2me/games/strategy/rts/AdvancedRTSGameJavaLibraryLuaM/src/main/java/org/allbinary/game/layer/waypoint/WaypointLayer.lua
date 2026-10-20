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
-- package org.allbinary.game.layer.waypoint

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local Health = require("org.allbinary.game.health.Health")
local Group = require("org.allbinary.game.identification.Group")
local NullRTSFormInputFactory = require("org.allbinary.game.input.form.NullRTSFormInputFactory")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSProperties = require("org.allbinary.game.layer.AdvancedRTSProperties")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local TileLayerPositionIntoViewPosition = require("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local AttackSound = require("org.allbinary.media.audio.AttackSound")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointLayer = {}
WaypointLayer.__index = WaypointLayer
WaypointLayer.className = "WaypointLayer"
setmetatable(WaypointLayer, {__index = AdvancedRTSGameLayer})


function WaypointLayer.new(remoteInfo, parentLayer, groupInterface, rootName, name, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y)
    local self = setmetatable(AdvancedRTSGameLayer.new(remoteInfo, parentLayer, AdvancedRTSProperties.createProperties(), groupInterface, rootName, name, Health.new(1000), NullRTSFormInputFactory.getInstance(), animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, TileLayerPositionIntoViewPosition.new()), WaypointLayer)
        -- super(...) made self above
        self:setCollidableInferface(CollidableWaypointBehavior.new(true))
        self:getWaypointBehavior():setWaypoint(Waypoint.new(self, AttackSound.getInstance()))
        self:setAnimationInterface(self.indexedButShouldBeRotationAnimationInterface)
    return self
end


function WaypointLayer:construct(rtsPlayerLayerInterface)
        self.percentCompleteP = 100
        self:initVisibility(rtsPlayerLayerInterface)
end


function WaypointLayer:paint(graphics)
        if self:isVisible() then
            AdvancedRTSGameLayer.paint(self, graphics)
        end
end


function WaypointLayer:processTick(allBinaryLayerManager)
        local try_ok, try_error = pcall(function()
            self.indexedButShouldBeRotationAnimationInterface:nextFrame()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "processTick", e)
        end
end


function WaypointLayer:damage(damage, damageType)
end


-- throws Exception
function WaypointLayer:getDamage(damageType)
        return 0
end


-- throws Exception
function WaypointLayer:setDestroyed(destroyed)
        AdvancedRTSGameLayer.setDestroyed(self, destroyed)
        if self:isDestroyed() then
            WaypointCellPositionHistory.getInstance():removeLayer(self)
        end
end


function WaypointLayer:getType()
        return WaypointLayer.getStaticType()
end


function WaypointLayer.getStaticType()
        return 4
end


function WaypointLayer:isSelfUpgradeable()
        return false
end

return WaypointLayer

