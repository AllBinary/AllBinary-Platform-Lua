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
-- package org.allbinary.game.collision

local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerCollisionUtil = {}
LayerCollisionUtil.__index = LayerCollisionUtil
LayerCollisionUtil.className = "LayerCollisionUtil"

function LayerCollisionUtil:_init_fields()
    self.collisionProcessor = nil
end


function LayerCollisionUtil.getInstance()
        return LayerCollisionUtil.instance
end


function LayerCollisionUtil.new()
    local self = setmetatable({}, LayerCollisionUtil)
    self:_init_fields()
        local features = Features.getInstance()
        local gameFeatureFactory = GameFeatureFactory.getInstance()
        if OpenGLFeatureUtil.getInstance():isAnyThreed() and not features:isFeature(gameFeatureFactory.COLLISIONS_FORCED_TWO_DIMENSIONAL) then
            self.collisionProcessor = CollisionThreedProcessor.new()
        else
            self.collisionProcessor = Collision2DProcessor.new()
        end
    return self
end


function LayerCollisionUtil:isCollision(myLayer, myLayer2)
        return self.collisionProcessor:isCollision(myLayer, myLayer2)
end

LayerCollisionUtil.instance = LayerCollisionUtil.new()

return LayerCollisionUtil

