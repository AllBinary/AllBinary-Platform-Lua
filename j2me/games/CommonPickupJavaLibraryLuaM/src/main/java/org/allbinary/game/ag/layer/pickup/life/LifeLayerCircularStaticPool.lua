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
-- package org.allbinary.game.ag.layer.pickup.life

local Life = require("org.allbinary.game.ag.life.Life")
local LifeInterfaceCompositeInterface = require("org.allbinary.game.ag.life.LifeInterfaceCompositeInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerCircularPool = require("org.allbinary.layer.AllBinaryLayerCircularPool")
local AllBinaryLayerFactoryInterface = require("org.allbinary.layer.AllBinaryLayerFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LifeLayerCircularStaticPool = {}
LifeLayerCircularStaticPool.__index = LifeLayerCircularStaticPool
LifeLayerCircularStaticPool.className = "LifeLayerCircularStaticPool"
setmetatable(LifeLayerCircularStaticPool, {__index = AllBinaryLayerCircularPool})


function LifeLayerCircularStaticPool.new(allbinaryLayerFactoryInterface, total)
    local self = setmetatable(AllBinaryLayerCircularPool.new(), LifeLayerCircularStaticPool)
        AllBinaryLayerCircularPool.initAllBinaryLayerCircularPool(self, allbinaryLayerFactoryInterface, total)
    return self
end


-- throws Exception
function LifeLayerCircularStaticPool:visit(sourceLayerInterface)
        local lifeLayer = self:getNextInstance()
        local lifeInterfaceCompositeInterface = sourceLayerInterface
        local lifeInterface = lifeInterfaceCompositeInterface:getLifeInterface()
        lifeLayer:visit(lifeInterface)
end

return LifeLayerCircularStaticPool

