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
-- package org.allbinary.game.collision.layer

local CollidableBaseBehavior = require("org.allbinary.game.collision.CollidableBaseBehavior")
local CollidableInterfaceCompositeInterface = require("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local LayerManager = require("org.allbinary.layer.LayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryCollisionManager = {}
AllBinaryCollisionManager.__index = AllBinaryCollisionManager
AllBinaryCollisionManager.className = "AllBinaryCollisionManager"


function AllBinaryCollisionManager.new()
    local self = setmetatable({}, AllBinaryCollisionManager)
    return self
end


function AllBinaryCollisionManager.getInstance()
        return AllBinaryCollisionManager.allBinaryCollisionManager
end


-- throws Exception
function AllBinaryCollisionManager:process(layerManager, collidableInterfaceCompositeInterface, startIndex)
        local size = layerManager:getSize()
        for index = startIndex + 1, size - 1 do
            local collidableInterfaceCompositeInterface2 = layerManager:getLayerAt(index)
            self:collide(layerManager, collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)
        end
end


-- throws Exception
function AllBinaryCollisionManager:collide(layerManager, collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)
        local collidableBase2 = collidableInterfaceCompositeInterface2:getCollidableInferface()
        local collidableBase = collidableInterfaceCompositeInterface:getCollidableInferface()
        if collidableBase2:isCollidable(collidableInterfaceCompositeInterface) then
            if collidableBase:isCollisionInterface(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2) then
                collidableBase:collideInterface(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)
                collidableBase2:collideInterface(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface)
            end
        end
end

AllBinaryCollisionManager.allBinaryCollisionManager = AllBinaryCollisionManager.new()

return AllBinaryCollisionManager

