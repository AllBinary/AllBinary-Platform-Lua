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
-- package org.allbinary.game.multiplayer.layer

local Group = require("org.allbinary.game.identification.Group")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local MultiPlayerGameLayerInterface = require("org.allbinary.game.multiplayer.layer.MultiPlayerGameLayerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultiPlayerGameLayer = {}
MultiPlayerGameLayer.__index = MultiPlayerGameLayer
MultiPlayerGameLayer.className = "MultiPlayerGameLayer"
setmetatable(MultiPlayerGameLayer, {__index = CollidableDestroyableDamageableLayer})


function MultiPlayerGameLayer.new(remoteInfo, groupInterface, name, layerInfo, viewPosition)
    local self = setmetatable(CollidableDestroyableDamageableLayer.new(groupInterface, name, layerInfo, viewPosition), MultiPlayerGameLayer)
        -- super(...) made self above
    return self
end


function MultiPlayerGameLayer:getMultiplayerBehavior()
        return MultiplayerBehavior.NULL_MULTIPLAYER_BEHAVIOR
end


function MultiPlayerGameLayer:setPingInfo(show)
end


function MultiPlayerGameLayer:setFiring(firing)
end


function MultiPlayerGameLayer:getFiring()
        return 0
end

return MultiPlayerGameLayer

