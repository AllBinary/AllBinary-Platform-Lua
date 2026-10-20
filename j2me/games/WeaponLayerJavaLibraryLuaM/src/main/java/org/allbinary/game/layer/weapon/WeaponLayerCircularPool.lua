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

local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerCircularPool = require("org.allbinary.layer.AllBinaryLayerCircularPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeaponLayerCircularPool = {}
WeaponLayerCircularPool.__index = WeaponLayerCircularPool
WeaponLayerCircularPool.className = "WeaponLayerCircularPool"
setmetatable(WeaponLayerCircularPool, {__index = AllBinaryLayerCircularPool})


function WeaponLayerCircularPool.new()
    local self = setmetatable(AllBinaryLayerCircularPool.new(), WeaponLayerCircularPool)
    return self
end


-- throws Exception
function WeaponLayerCircularPool:getInstanceWeaponLayer(sourceLayerInterface, x, y, z, angle, otherAngle, weaponProperties, scoreable)
        local weaponLayer = AllBinaryLayerCircularPool.getNextInstance(self)
        weaponLayer:initXYZ(x, y, z)
        weaponLayer:init(sourceLayerInterface, angle, otherAngle, weaponProperties, scoreable)
        return weaponLayer
end

return WeaponLayerCircularPool

