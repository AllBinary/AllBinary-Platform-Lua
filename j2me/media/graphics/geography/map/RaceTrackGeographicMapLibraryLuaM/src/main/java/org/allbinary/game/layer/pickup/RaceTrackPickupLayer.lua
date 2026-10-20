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
-- package org.allbinary.game.layer.pickup

local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local TileLayerPositionIntoViewPosition = require("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local ViewPosition = require("org.allbinary.view.ViewPosition")
local ViewPositionEventHandler = require("org.allbinary.view.event.ViewPositionEventHandler")
local PickupLayer = require("org.allbinary.game.layer.pickup.PickupLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackPickupLayer = {}
RaceTrackPickupLayer.__index = RaceTrackPickupLayer
RaceTrackPickupLayer.className = "RaceTrackPickupLayer"
setmetatable(RaceTrackPickupLayer, {__index = PickupLayer})

function RaceTrackPickupLayer:_init_fields()
    self.viewPositionEventHandler = ViewPositionEventHandler.getInstance()
end


function RaceTrackPickupLayer.new()
    local self = setmetatable(PickupLayer.new(RaceTrackPickupLayer.NAME, RemoteInfo.REMOTE_INFO, 0, CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY, NullAnimationFactory.getFactoryInstance():getInstance(0), Rectangle.new(PointFactory.getInstance().ZERO_ZERO, 0, 0), TileLayerPositionIntoViewPosition.new()), RaceTrackPickupLayer)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function RaceTrackPickupLayer:setTiledLayer(tiledLayer)
        local viewPosition = self:getViewPosition()
        viewPosition:setTiledLayer(tiledLayer)
        self.viewPositionEventHandler:addListener(self)
end


function RaceTrackPickupLayer:setDestroyed(destroyed)
        PickupLayer.setDestroyed(self, destroyed)
        if self:isDestroyed() then
            self.viewPositionEventHandler:removeListener(self)
        end
end

RaceTrackPickupLayer.NAME = "RaceTrackPickupLayer"

return RaceTrackPickupLayer

