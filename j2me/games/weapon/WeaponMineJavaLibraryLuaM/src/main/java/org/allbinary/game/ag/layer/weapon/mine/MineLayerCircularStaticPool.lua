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
-- package org.allbinary.game.ag.layer.weapon.mine

local WeaponLayerCircularPool = require("org.allbinary.game.layer.weapon.WeaponLayerCircularPool")
local ViewPositionFactoryInterface = require("org.allbinary.view.ViewPositionFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MineLayerCircularStaticPool = {}
MineLayerCircularStaticPool.__index = MineLayerCircularStaticPool
MineLayerCircularStaticPool.className = "MineLayerCircularStaticPool"

function MineLayerCircularStaticPool.new()
    local self = setmetatable({}, MineLayerCircularStaticPool)
    return self
end


-- throws Exception
function MineLayerCircularStaticPool.init(viewPositionFactoryInterface)
        MineCountedPickedUpLayerInterfaceFactory.init()
        MineLayerCircularStaticPool.WEAPON_LAYER_CIRCULAR_STATIC_POOL:initAllBinaryLayerCircularPool(MineLayerFactory.new(viewPositionFactoryInterface), 20)
end


function MineLayerCircularStaticPool.getInstance()
        return MineLayerCircularStaticPool.WEAPON_LAYER_CIRCULAR_STATIC_POOL
end

MineLayerCircularStaticPool.WEAPON_LAYER_CIRCULAR_STATIC_POOL = WeaponLayerCircularPool.new()

return MineLayerCircularStaticPool

