-- Generated Code Do Not Modify
-- package org.allbinary.game.collision

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

local CollisionProcessor = {}
CollisionProcessor.__index = CollisionProcessor
CollisionProcessor.className = "CollisionProcessor"

function CollisionProcessor.new()
    local self = setmetatable({}, CollisionProcessor)
    return self
end


function CollisionProcessor:isCollision(myLayer, myLayer2)
        return false
end

return CollisionProcessor

