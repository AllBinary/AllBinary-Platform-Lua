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

local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableRTSBehavior = require("org.allbinary.game.layer.CollidableRTSBehavior")
local CollidableInterfaceCompositeInterface = require("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableWaypointBehavior = {}
CollidableWaypointBehavior.__index = CollidableWaypointBehavior
CollidableWaypointBehavior.className = "CollidableWaypointBehavior"
setmetatable(CollidableWaypointBehavior, {__index = CollidableRTSBehavior})


function CollidableWaypointBehavior.new(collidable)
    local self = setmetatable(CollidableRTSBehavior.new(collidable), CollidableWaypointBehavior)
        -- super(...) made self above
    return self
end


function CollidableWaypointBehavior:isCollision(ownerLayer, collisionLayer)
        return false
end


-- throws Exception
function CollidableWaypointBehavior:collide(ownerLayer, collisionLayer)
end


function CollidableWaypointBehavior:isCollisionInterface(ownerLayer, collidableInterface)
        return false
end


-- throws Exception
function CollidableWaypointBehavior:collideInterface(ownerLayer, collidableInterface)
end

return CollidableWaypointBehavior

