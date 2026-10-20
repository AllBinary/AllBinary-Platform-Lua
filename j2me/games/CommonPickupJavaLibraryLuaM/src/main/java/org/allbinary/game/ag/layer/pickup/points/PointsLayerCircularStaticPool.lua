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
-- package org.allbinary.game.ag.layer.pickup.points

local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
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

local PointsLayerCircularStaticPool = {}
PointsLayerCircularStaticPool.__index = PointsLayerCircularStaticPool
PointsLayerCircularStaticPool.className = "PointsLayerCircularStaticPool"
setmetatable(PointsLayerCircularStaticPool, {__index = AllBinaryLayerCircularPool})


function PointsLayerCircularStaticPool.new(allbinaryLayerFactoryInterface, total)
    local self = setmetatable(AllBinaryLayerCircularPool.new(), PointsLayerCircularStaticPool)
        AllBinaryLayerCircularPool.initAllBinaryLayerCircularPool(self, allbinaryLayerFactoryInterface, total)
    return self
end


-- throws Exception
function PointsLayerCircularStaticPool:visit(sourceLayerInterface)
        local pointsLayer = self:getNextInstance()
        local scoreableInterface = sourceLayerInterface
        pointsLayer:visit(scoreableInterface)
end

return PointsLayerCircularStaticPool

