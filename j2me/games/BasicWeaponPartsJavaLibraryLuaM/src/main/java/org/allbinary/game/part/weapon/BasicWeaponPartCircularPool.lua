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

local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicWeaponPartCircularPool = {}
BasicWeaponPartCircularPool.__index = BasicWeaponPartCircularPool
BasicWeaponPartCircularPool.className = "BasicWeaponPartCircularPool"

function BasicWeaponPartCircularPool:_init_fields()
    self.basicWeaponPart = BasicWeaponPart.NULL_BASIC_WEAPON_PART
end

function BasicWeaponPartCircularPool.new()
    local self = setmetatable({}, BasicWeaponPartCircularPool)
    self:_init_fields()
    return self
end


-- throws Exception
function BasicWeaponPartCircularPool:init(basicWeaponPartFactoryInterface)
        self.basicWeaponPart = basicWeaponPartFactoryInterface:getInstance()
end


-- throws Exception
function BasicWeaponPartCircularPool:getInstance(sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship)
        self.basicWeaponPart:init(sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship)
        return self.basicWeaponPart
end

BasicWeaponPartCircularPool.NULL_BASIC_WEAPON_PART_CIRCULAR_POOL = BasicWeaponPartCircularPool.new()

return BasicWeaponPartCircularPool

