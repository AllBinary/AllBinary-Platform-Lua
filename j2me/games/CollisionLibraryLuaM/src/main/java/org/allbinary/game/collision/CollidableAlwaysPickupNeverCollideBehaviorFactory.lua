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

local CollidableBaseBehaviorFactory = require("org.allbinary.game.collision.CollidableBaseBehaviorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableAlwaysPickupNeverCollideBehaviorFactory = {}
CollidableAlwaysPickupNeverCollideBehaviorFactory.__index = CollidableAlwaysPickupNeverCollideBehaviorFactory
CollidableAlwaysPickupNeverCollideBehaviorFactory.className = "CollidableAlwaysPickupNeverCollideBehaviorFactory"
setmetatable(CollidableAlwaysPickupNeverCollideBehaviorFactory, {__index = CollidableBaseBehaviorFactory})

function CollidableAlwaysPickupNeverCollideBehaviorFactory:_init_fields()
    self.instance = CollidableAlwaysPickupNeverCollideBehavior.new()
end

function CollidableAlwaysPickupNeverCollideBehaviorFactory.new()
    local self = setmetatable(CollidableBaseBehaviorFactory.new(), CollidableAlwaysPickupNeverCollideBehaviorFactory)
    self:_init_fields()
    return self
end


function CollidableAlwaysPickupNeverCollideBehaviorFactory.getInstance()
        return CollidableAlwaysPickupNeverCollideBehaviorFactory.instanceC
end


function CollidableAlwaysPickupNeverCollideBehaviorFactory:createBehavior()
        return self.instance
end

CollidableAlwaysPickupNeverCollideBehaviorFactory.instanceC = CollidableAlwaysPickupNeverCollideBehaviorFactory.new()

return CollidableAlwaysPickupNeverCollideBehaviorFactory

