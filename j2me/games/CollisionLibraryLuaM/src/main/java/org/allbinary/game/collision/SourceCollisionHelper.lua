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

local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local CollisionHelper = require("org.allbinary.game.collision.CollisionHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SourceCollisionHelper = {}
SourceCollisionHelper.__index = SourceCollisionHelper
SourceCollisionHelper.className = "SourceCollisionHelper"
setmetatable(SourceCollisionHelper, {__index = CollisionHelper})


function SourceCollisionHelper.new(layerInterface)
    local self = setmetatable(CollisionHelper.new(layerInterface), SourceCollisionHelper)
        -- super(...) made self above
    return self
end


function SourceCollisionHelper:isCollidable(layerInterface)
        if self.sourceLayerInterface ~= layerInterface then
            return true
        end
        return false
end

return SourceCollisionHelper

