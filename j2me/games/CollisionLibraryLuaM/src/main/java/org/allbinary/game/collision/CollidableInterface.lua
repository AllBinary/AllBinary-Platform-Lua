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
local NamedInterface = require("org.allbinary.layer.NamedInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local CollidableInterface = {}
CollidableInterface.__index = CollidableInterface
CollidableInterface.className = "CollidableInterface"
setmetatable(CollidableInterface, {__index = NamedInterface})


-- throws Exception
function CollidableInterface:isCollidable(ownerLayer)
    error("abstract method isCollidable")
end


-- throws Exception
function CollidableInterface:isCollision(ownerLayer, collidableInterfaceCompositeInterface)
    error("abstract method isCollision")
end


-- throws Exception
function CollidableInterface:collide(ownerLayer, collidableInterfaceCompositeInterface)
    error("abstract method collide")
end


function CollidableInterface:getCollisionTypeWith(layerInterface)
    error("abstract method getCollisionTypeWith")
end

return CollidableInterface

