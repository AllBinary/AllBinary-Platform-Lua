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
-- package org.allbinary.game.part.weapon

local Animation = require("org.allbinary.animation.Animation")
local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local WeaponLayer = require("org.allbinary.game.layer.weapon.WeaponLayer")
local WeaponLayerCircularPool = require("org.allbinary.game.layer.weapon.WeaponLayerCircularPool")
local NoScoreable = require("org.allbinary.game.score.NoScoreable")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicWeaponPart = require("org.allbinary.game.part.weapon.BasicWeaponPart")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicProjectileWeaponPart = {}
BasicProjectileWeaponPart.__index = BasicProjectileWeaponPart
BasicProjectileWeaponPart.className = "BasicProjectileWeaponPart"
setmetatable(BasicProjectileWeaponPart, {__index = BasicWeaponPart})

function BasicProjectileWeaponPart:_init_fields()
    self.weaponLayerCircularStaticPool = nil
end


function BasicProjectileWeaponPart.createBasicProjectileWeaponPart(animationInterface, weaponLayerCircularStaticPool)
        return BasicProjectileWeaponPart.new(animationInterface, AllBinaryLayer.NULL_ALLBINARY_LAYER, weaponLayerCircularStaticPool, WeaponProperties.NULL_WEAPON_PROPERTIES, NoScoreable.getInstance(), RelativeRelationship.NULL_RELATIVE_RELATIONSHIP)
end


function BasicProjectileWeaponPart.new(animationInterface, sourceLayerInterface, weaponLayerCircularStaticPool, weaponProperties, scoreableInterface, relativeRelationship)
    local self = setmetatable(BasicWeaponPart.new(animationInterface, sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship), BasicProjectileWeaponPart)
    self:_init_fields()
        -- super(...) made self above
        self.weaponLayerCircularStaticPool = weaponLayerCircularStaticPool
    return self
end


-- throws Exception
function BasicProjectileWeaponPart:processScore(allbinaryLayerManager, angle, otherAngle, weaponProperties, scoreableInterface)
        local weaponLayer = self.weaponLayerCircularStaticPool:getInstanceWeaponLayer(self:getOwnerLayerInterface(), self.relativeRelationship:getX(), self.relativeRelationship:getY(), self.relativeRelationship:getZ(), angle, otherAngle, weaponProperties, scoreableInterface)
        allbinaryLayerManager:append(weaponLayer)
end

return BasicProjectileWeaponPart

