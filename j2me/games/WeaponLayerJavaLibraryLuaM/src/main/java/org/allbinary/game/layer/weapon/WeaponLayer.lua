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

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local CollidableBaseBehavior = require("org.allbinary.game.collision.CollidableBaseBehavior")
local DestroyedLayerProcessor = require("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local GameConfigurationUtil = require("org.allbinary.game.configuration.GameConfigurationUtil")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local MultiPlayerGameLayer = require("org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local NoScoreable = require("org.allbinary.game.score.NoScoreable")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local Movement = require("org.allbinary.physics.movement.Movement")
local ViewPosition = require("org.allbinary.view.ViewPosition")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeaponLayer = {}
WeaponLayer.__index = WeaponLayer
WeaponLayer.className = "WeaponLayer"
setmetatable(WeaponLayer, {__index = MultiPlayerGameLayer})

function WeaponLayer:_init_fields()
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
    self.initAnimationInterface = nil
    self.destroyedAnimationInterface = nil
    self.sourceLayerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
    self.totalDamage = 0
    self.initDamage = 0
    self.destroyed = true
    self.scoreableInterface = NoScoreable.getInstance()
    self.movement = nil
    self.weaponProperties = WeaponProperties.NULL_WEAPON_PROPERTIES
    self.multiPlayerType = nil
    self.collidableWeaponBehavior = CollidableWeaponBehavior.getNullInstance()
end


function WeaponLayer.new(name, remoteInfo, multiPlayerType, movement, animationInterface, destroyedAnimationInterface, rectangle, viewPosition)
    local self = setmetatable(MultiPlayerGameLayer.new(remoteInfo, BasicGroupFactory.getInstance().NONE_ARRAY, name, rectangle, viewPosition), WeaponLayer)
    self:_init_fields()
        -- super(...) made self above
        self.initAnimationInterface = animationInterface
        self:setAnimationInterface(animationInterface)
        self.destroyedAnimationInterface = destroyedAnimationInterface
        self.movement = movement
        self.multiPlayerType = multiPlayerType
    return self
end


function WeaponLayer:setCollidableInferface(collidableInferface)
        MultiPlayerGameLayer.setCollidableInferface(self, collidableInferface)
        self.collidableWeaponBehavior = self:getCollidableInferface()
end


-- throws Exception
function WeaponLayer:initXYZ(x, y, z)
        self.x = x
        self.y = y
        self.z = z
end


-- throws Exception
function WeaponLayer:init(sourceLayerInterface, angle, otherAngle, weaponProperties, scoreable)
        self:setWeaponPropertiesP(weaponProperties)
        self:setReadyForExplosion(false)
        self:setAnimationInterface(self:getInitAnimationInterfaceP())
        self:setOwnerLayerInterface(sourceLayerInterface)
        self.collidableWeaponBehavior:init(sourceLayerInterface)
        self:setGroupInterfaces()
        if scoreable ~= nil then
            self.scoreableInterface = scoreable
        end
        self.totalDamage = 0
        self.initDamage = weaponProperties:getDamage()
        self:setDestroyed(false)
        self.movement:init(weaponProperties:getSpeed(), angle, otherAngle)
end


function WeaponLayer:setGroupInterfaces()
        local basicGroupFactory = BasicGroupFactory.getInstance()
        if self.sourceLayerInterface:getGroupInterface()[1] == basicGroupFactory.ENEMY then
            self:setGroupInterface(basicGroupFactory.ENEMY_ARRAY)
        else
            self:setGroupInterface(self.sourceLayerInterface:getGroupInterface())
        end
end


-- throws Exception
function WeaponLayer:processTick(allBinaryLayerManager)
        if self:isExhausted() and not self:isDestroyed() then
            if self:isReadyForExplosion() then
                local indexedAnimationInterface = self:getAnimationInterface()
                local currentFrame = indexedAnimationInterface:getFrame()
                if currentFrame < indexedAnimationInterface:getAnimationSize() - 1 then
                    indexedAnimationInterface:nextFrame()
                else
                    self:setDestroyed(true)
                end
            else
                local collidableWeaponBehavior = self:getCollidableInferface()
                if collidableWeaponBehavior:isCollided() then
                    self:setAnimationInterface(self.destroyedAnimationInterface)
                    self:getMovement():stop()
                    self:setReadyForExplosion(true)
                else
                    self:setDestroyed(true)
                end
            end
        end
        self.movement:process(self)
        self.totalDamage = self.totalDamage + (self.weaponProperties:getDissipation())
end


function WeaponLayer:isDestroyed()
        return self.destroyed
end


function WeaponLayer:damage(damage, damageType)
        self.totalDamage = self.totalDamage + (damage * damage)
end


function WeaponLayer:givePoints(total)
        self.scoreableInterface:addPoints(GameConfigurationUtil.getInstance():getCompetitionValue() * total)
end


function WeaponLayer:isExhausted()
        if self.totalDamage > self:getInitDamage() or self.totalDamage < 0 then
            return true
        else
            return false
        end
end


function WeaponLayer:getDamage(damageType)
        if not self:isExhausted() then
            local total = self:getInitDamage() - self.totalDamage
            self:givePoints(total)
            return total
        end
        return 0
end


function WeaponLayer:setDestroyed(destroyed)
        self.destroyed = destroyed
        if self:isDestroyed() then
            self.scoreableInterface = NoScoreable.getInstance()
            DestroyedLayerProcessor.getInstance():add(self)
        end
end


function WeaponLayer:getInitDamage()
        return self.initDamage
end


function WeaponLayer:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end


function WeaponLayer:getAnimationInterface()
        return self.animationInterface
end


function WeaponLayer:getInitAnimationInterfaceP()
        return self.initAnimationInterface
end


function WeaponLayer:setInitAnimationInterfaceP(initAnimationInterface)
        self.initAnimationInterface = initAnimationInterface
end


function WeaponLayer:getDestroyedAnimationInterface()
        return self.destroyedAnimationInterface
end


function WeaponLayer:getOwnerLayerInterface()
        return self.sourceLayerInterface
end


function WeaponLayer:setOwnerLayerInterface(sourceLayerInterface)
        self.sourceLayerInterface = sourceLayerInterface
end


function WeaponLayer:paint(graphics)
        local viewPosition = self:getViewPosition()
        self.animationInterface:paintXY(graphics, viewPosition:getX() - self:getHalfWidth(), viewPosition:getY() - self:getHalfHeight())
end


function WeaponLayer:paintThreed(graphics)
        local viewPosition = self:getViewPosition()
        self.animationInterface:paintThreedXYZ(graphics, viewPosition:getX() - self:getHalfWidth(), viewPosition:getY() - self:getHalfHeight(), viewPosition:getZ() - self:getHalfDepth())
end


function WeaponLayer:getMovement()
        return self.movement
end


function WeaponLayer:setMovement(movement)
        self.movement = movement
end


function WeaponLayer:getType()
        return WeaponLayer.getStaticType()
end


function WeaponLayer.getStaticType()
        return 0
end


function WeaponLayer:getMultiPlayerType()
        return self.multiPlayerType
end


function WeaponLayer:setWeaponPropertiesP(weaponProperties)
        self.weaponProperties = weaponProperties
end


function WeaponLayer:getWeaponPropertiesP()
        return self.weaponProperties
end


function WeaponLayer:implmentsTickableInterface()
        return true
end


-- throws Exception
function WeaponLayer:set(gl)
        self.initAnimationInterface:set(gl)
end

return WeaponLayer

