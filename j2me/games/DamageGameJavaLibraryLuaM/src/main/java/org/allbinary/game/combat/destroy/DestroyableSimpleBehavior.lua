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
-- package org.allbinary.game.combat.destroy

local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local DestroyableBaseBehavior = require("org.allbinary.game.combat.destroy.DestroyableBaseBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DestroyableSimpleBehavior = {}
DestroyableSimpleBehavior.__index = DestroyableSimpleBehavior
DestroyableSimpleBehavior.className = "DestroyableSimpleBehavior"
setmetatable(DestroyableSimpleBehavior, {__index = DestroyableBaseBehavior})

function DestroyableSimpleBehavior:_init_fields()
    self.ownerLayer = nil
    self.destroyed = false
end


function DestroyableSimpleBehavior.new(ownerLayer)
    local self = setmetatable(DestroyableBaseBehavior.new(), DestroyableSimpleBehavior)
    self:_init_fields()
        self.ownerLayer = ownerLayer
    return self
end


function DestroyableSimpleBehavior:isDestroyed()
        return self.destroyed
end


function DestroyableSimpleBehavior:setDestroyed(destroyed)
        self.destroyed = destroyed
        if self:isDestroyed() then
            DestroyedLayerProcessor.getInstance():add(self.ownerLayer)
        end
end

return DestroyableSimpleBehavior

