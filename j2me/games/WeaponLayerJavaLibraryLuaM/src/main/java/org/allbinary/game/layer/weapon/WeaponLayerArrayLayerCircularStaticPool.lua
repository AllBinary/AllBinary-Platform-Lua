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
-- package org.allbinary.game.layer.weapon

local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeaponLayerArrayLayerCircularStaticPool = {}
WeaponLayerArrayLayerCircularStaticPool.__index = WeaponLayerArrayLayerCircularStaticPool
WeaponLayerArrayLayerCircularStaticPool.className = "WeaponLayerArrayLayerCircularStaticPool"

function WeaponLayerArrayLayerCircularStaticPool:_init_fields()
    self.MAX = 5
    self.circularIndexUtil = CircularIndexUtil.createInstance(self.MAX)
    self.ALL_WEAPONLAYER_ARRAY = java_new_array(nil, 4)
end

function WeaponLayerArrayLayerCircularStaticPool.new()
    local self = setmetatable({}, WeaponLayerArrayLayerCircularStaticPool)
    self:_init_fields()
    return self
end


function WeaponLayerArrayLayerCircularStaticPool.getInstance()
        return WeaponLayerArrayLayerCircularStaticPool.instance
end


function WeaponLayerArrayLayerCircularStaticPool:init()
        local WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX * 2)
        local TWO_WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX)
        local THREE_WEAPONLAYER_ARRAY = java_new_array(nil, self.MAX)
        for index = 0, self.MAX - 1 do
            WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 1)
            TWO_WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 2)
            THREE_WEAPONLAYER_ARRAY[index + 1] = java_new_array(nil, 3)
        end
        self.ALL_WEAPONLAYER_ARRAY[2] = WEAPONLAYER_ARRAY
        self.ALL_WEAPONLAYER_ARRAY[3] = TWO_WEAPONLAYER_ARRAY
        self.ALL_WEAPONLAYER_ARRAY[4] = THREE_WEAPONLAYER_ARRAY
end


-- throws Exception
function WeaponLayerArrayLayerCircularStaticPool:getInstanceArray(size)
        local weaponLayerArray = self.ALL_WEAPONLAYER_ARRAY[size + 1][self.circularIndexUtil:getIndex() + 1]
        self.circularIndexUtil:next()
        return weaponLayerArray
end

WeaponLayerArrayLayerCircularStaticPool.instance = WeaponLayerArrayLayerCircularStaticPool.new()

return WeaponLayerArrayLayerCircularStaticPool

