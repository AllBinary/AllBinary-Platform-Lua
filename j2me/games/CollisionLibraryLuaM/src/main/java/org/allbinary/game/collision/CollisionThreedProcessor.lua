-- Generated Code Do Not Modify
-- package org.allbinary.game.collision

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local CollisionProcessor = require("org.allbinary.game.collision.CollisionProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollisionThreedProcessor = {}
CollisionThreedProcessor.__index = CollisionThreedProcessor
CollisionThreedProcessor.className = "CollisionThreedProcessor"
setmetatable(CollisionThreedProcessor, {__index = CollisionProcessor})

function CollisionThreedProcessor.new()
    local self = setmetatable(CollisionProcessor.new(), CollisionThreedProcessor)
    return self
end


function CollisionThreedProcessor:isCollision(myLayer, myLayer2)
        if myLayer2:getXP() >= myLayer:getX2() or myLayer2:getYP() >= myLayer:getY2() or myLayer2:getX2() <= myLayer:getXP() or myLayer2:getY2() <= myLayer:getYP() or myLayer2:getZP() < myLayer:getZ2() or myLayer2:getZ2() > myLayer:getZP() then
            return false
        else
            return true
        end
end

return CollisionThreedProcessor

