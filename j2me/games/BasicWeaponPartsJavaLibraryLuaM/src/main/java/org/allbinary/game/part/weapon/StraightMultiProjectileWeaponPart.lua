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
local NoDecimalTrigTable = require("org.allbinary.math.NoDecimalTrigTable")
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

local StraightMultiProjectileWeaponPart = {}
StraightMultiProjectileWeaponPart.__index = StraightMultiProjectileWeaponPart
StraightMultiProjectileWeaponPart.className = "StraightMultiProjectileWeaponPart"
setmetatable(StraightMultiProjectileWeaponPart, {__index = BasicWeaponPart})

function StraightMultiProjectileWeaponPart:_init_fields()
    self.weaponLayerCircularStaticPool = nil
    self.total = nil
    self.noDecimalTrigTable = NoDecimalTrigTable.getInstance()
end


function StraightMultiProjectileWeaponPart.createStraightMultiProjectileWeaponPart(animationInterface, weaponLayerCircularStaticPool)
        return StraightMultiProjectileWeaponPart.new(animationInterface, AllBinaryLayer.NULL_ALLBINARY_LAYER, weaponLayerCircularStaticPool, 2, WeaponProperties.NULL_WEAPON_PROPERTIES, NoScoreable.getInstance(), RelativeRelationship.NULL_RELATIVE_RELATIONSHIP)
end


function StraightMultiProjectileWeaponPart.new(animationInterface, sourceLayerInterface, weaponLayerCircularStaticPool, total, weaponProperties, scoreableInterface, relativeRelationship)
    local self = setmetatable(BasicWeaponPart.new(animationInterface, sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship), StraightMultiProjectileWeaponPart)
    self:_init_fields()
        -- super(...) made self above
        self.total = total
        self.weaponLayerCircularStaticPool = weaponLayerCircularStaticPool
    return self
end


-- throws Exception
function StraightMultiProjectileWeaponPart:processScore(allbinaryLayerManager, angle, otherAngle, weaponProperties, scoreableInterface)
        local sourceLayerInterface = self:getOwnerLayerInterface()
        local reducedWidth = (sourceLayerInterface:getWidth() * 8 / 10)
        local halfWidth = (((reducedWidth) // (1 << (1))))
        local x = self.relativeRelationship:getX()
        local y = self.relativeRelationship:getY()
        local sine = 0
        local beamX = 0
        local cosine = 0
        local beamY = 0
        local weaponLayer = nil
        local increment = java_idiv(reducedWidth, (self.total - 1))
        local next = -halfWidth
        for index = 0, self.total - 1 do
            sine = java_int((next * self.noDecimalTrigTable:sin(angle)))
            beamX = java_int((sine / self.noDecimalTrigTable.SCALE))
            cosine = java_int((next * self.noDecimalTrigTable:cos(angle)))
            beamY = -java_int((cosine / self.noDecimalTrigTable.SCALE))
            weaponLayer = self.weaponLayerCircularStaticPool:getInstanceWeaponLayer(sourceLayerInterface, x + beamX, y + beamY, 0, angle, otherAngle, weaponProperties, scoreableInterface)
            allbinaryLayerManager:append(weaponLayer)
            next = next + (increment)
        end
end

return StraightMultiProjectileWeaponPart

