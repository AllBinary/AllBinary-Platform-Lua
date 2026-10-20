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

local Collision2DProcessor = {}
Collision2DProcessor.__index = Collision2DProcessor
Collision2DProcessor.className = "Collision2DProcessor"
setmetatable(Collision2DProcessor, {__index = CollisionProcessor})

function Collision2DProcessor.new()
    local self = setmetatable(CollisionProcessor.new(), Collision2DProcessor)
    return self
end


function Collision2DProcessor:isCollision(myLayer, myLayer2)
        if myLayer2:getXP() >= myLayer:getX2() or myLayer2:getYP() >= myLayer:getY2() or myLayer2:getX2() <= myLayer:getXP() or myLayer2:getY2() <= myLayer:getYP() then
            return false
        else
            return true
        end
end

return Collision2DProcessor

