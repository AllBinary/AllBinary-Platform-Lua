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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local PartInterface = require("org.allbinary.game.part.PartInterface")
local NoScoreable = require("org.allbinary.game.score.NoScoreable")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local SalvoInterface = require("org.allbinary.game.part.weapon.SalvoInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local BasicWeaponPart = {}
BasicWeaponPart.__index = BasicWeaponPart
BasicWeaponPart.className = "BasicWeaponPart"

function BasicWeaponPart:_init_fields()
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
    self.ownerLayerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
    self.weaponProperties = WeaponProperties.NULL_WEAPON_PROPERTIES
    self.scoreableInterface = NoScoreable.getInstance()
    self.relativeRelationship = RelativeRelationship.NULL_RELATIVE_RELATIONSHIP
end


function BasicWeaponPart.createBasicWeaponPart(animationInterface)
        return BasicWeaponPart.new(animationInterface, AllBinaryLayer.NULL_ALLBINARY_LAYER, WeaponProperties.NULL_WEAPON_PROPERTIES, NoScoreable.getInstance(), RelativeRelationship.NULL_RELATIVE_RELATIONSHIP)
end


function BasicWeaponPart.new(animationInterface, sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship)
    local self = setmetatable({}, BasicWeaponPart)
    self:_init_fields()
        self:init(sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship)
        self:setAnimationInterface(animationInterface)
    return self
end


function BasicWeaponPart:init(sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship)
        self:setOwnerLayerInterface(sourceLayerInterface)
        self:setWeaponProperties(weaponProperties)
        self.scoreableInterface = scoreableInterface
        self.relativeRelationship = relativeRelationship
end


-- throws Exception
function BasicWeaponPart:process(allbinaryLayerManager, angle, otherAngle)
        self:processScore(allbinaryLayerManager, angle, otherAngle, self:getWeaponProperties(), self.scoreableInterface)
end


-- throws Exception
function BasicWeaponPart:processScore(allbinaryLayerManager, angle, otherAngle, weaponProperties, scoreableInterface)
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end


function BasicWeaponPart:getOwnerLayerInterface()
        return self.ownerLayerInterface
end


function BasicWeaponPart:setOwnerLayerInterface(ownerLayerInterface)
        self.ownerLayerInterface = ownerLayerInterface
end


function BasicWeaponPart:getAnimationInterface()
        return self.animationInterface
end


function BasicWeaponPart:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end


function BasicWeaponPart:paint(graphics)
        local viewPosition = self:getOwnerLayerInterface():getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self.animationInterface:paintXY(graphics, viewX, viewY)
end


function BasicWeaponPart:paintThreed(graphics)
end


function BasicWeaponPart:getWeaponProperties()
        return self.weaponProperties
end


function BasicWeaponPart:setWeaponProperties(weaponProperties)
        self.weaponProperties = weaponProperties
end

BasicWeaponPart.NULL_BASIC_WEAPON_PART = BasicWeaponPart.createBasicWeaponPart(NullAnimationFactory.getFactoryInstance():getInstance(0))

return BasicWeaponPart

