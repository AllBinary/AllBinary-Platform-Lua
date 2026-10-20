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
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local AngleFactory = require("org.allbinary.math.AngleFactory")
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

local ArcedMultiBeamWeaponPart = {}
ArcedMultiBeamWeaponPart.__index = ArcedMultiBeamWeaponPart
ArcedMultiBeamWeaponPart.className = "ArcedMultiBeamWeaponPart"
setmetatable(ArcedMultiBeamWeaponPart, {__index = BasicWeaponPart})

function ArcedMultiBeamWeaponPart:_init_fields()
    self.weaponLayerCircularStaticPool = nil
    self.total = nil
    self.TOTAL_ANGLE = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
end


function ArcedMultiBeamWeaponPart.new(animationInterface, sourceLayerInterface, weaponLayerCircularStaticPool, total, weaponProperties, scoreableInterface, relativeRelationship)
    local self = setmetatable(BasicWeaponPart.new(animationInterface, sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship), ArcedMultiBeamWeaponPart)
    self:_init_fields()
        -- super(...) made self above
        self.total = total
        self.weaponLayerCircularStaticPool = weaponLayerCircularStaticPool
    return self
end


-- throws Exception
function ArcedMultiBeamWeaponPart:processScore(allbinaryLayerManager, angle, otherAngle, weaponProperties, scoreableInterface)
        local increment = (java_idiv((self.total - 1), self.TOTAL_ANGLE))
        local minAngle = (angle - ((((increment * self.total)) // (1 << (1)))))
        local next = 0
        local weaponLayer = nil
        for index = 0, self.total - 1 do
            weaponLayer = self.weaponLayerCircularStaticPool:getInstanceWeaponLayer(self:getOwnerLayerInterface(), self.relativeRelationship:getX(), self.relativeRelationship:getY(), 0, (minAngle + increment), otherAngle, weaponProperties, scoreableInterface)
            allbinaryLayerManager:append(weaponLayer)
            next = next + (increment)
        end
end

return ArcedMultiBeamWeaponPart

