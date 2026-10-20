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
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LayerManager = require("org.allbinary.layer.LayerManager")
local LayerProcessor = require("org.allbinary.layer.LayerProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer = {}
OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer.__index = OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer
OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer.className = "OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer"
setmetatable(OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer, {__index = LayerProcessor})


function OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer.new()
    local self = setmetatable(LayerProcessor.new(OptimizedAllBinaryCollisionLayerManager.new()), OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer)
        -- super(...) made self above
    return self
end


-- throws Exception
function OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer:processAt(allBinaryLayerManager, layerInterface, startIndex)
        local collidableInterfaceCompositeInterface = layerInterface
        local collidableBase = collidableInterfaceCompositeInterface:getCollidableInferface()
        if collidableBase:isCollidable(collidableInterfaceCompositeInterface) then
            local layerManager = self:getLayerManager()
            local size = layerManager:getSize()
            local collidableInterfaceCompositeInterface2 = nil
            local collidableBase2 = nil
            for index = startIndex + 1, size - 1 do
                collidableInterfaceCompositeInterface2 = layerManager:getLayerAt(index)
                collidableBase2 = collidableInterfaceCompositeInterface2:getCollidableInferface()
                if collidableBase2:isCollidable(collidableInterfaceCompositeInterface) and collidableBase:isCollision(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2) then
                    collidableBase:collide(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)
                    collidableBase2:collide(collidableInterfaceCompositeInterface2, collidableInterfaceCompositeInterface)
                end
            end
        end
end


function OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer:isProcessorLayer(layerInterface)
        if layerInterface:implmentsCollidableInterface() then
            return true
        else
            return false
        end
end

return OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer

