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
local CollidableBaseBehavior = require("org.allbinary.game.collision.CollidableBaseBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableNeverCollideBehavior = {}
CollidableNeverCollideBehavior.__index = CollidableNeverCollideBehavior
CollidableNeverCollideBehavior.className = "CollidableNeverCollideBehavior"
setmetatable(CollidableNeverCollideBehavior, {__index = CollidableBaseBehavior})


function CollidableNeverCollideBehavior.new(isCollidable)
    local self = setmetatable(CollidableBaseBehavior.new(isCollidable), CollidableNeverCollideBehavior)
        -- super(...) made self above
    return self
end


function CollidableNeverCollideBehavior:isCollision(ownerLayer, allbinaryCollidableLayer)
        return false
end


-- throws Exception
function CollidableNeverCollideBehavior:collide(ownerLayer, allbinaryCollidableLayer)
end


function CollidableNeverCollideBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
end


function CollidableNeverCollideBehavior:isCollisionInterface(ownerLayer, collidableInterfaceCompositeInterface)
        return false
end

return CollidableNeverCollideBehavior

