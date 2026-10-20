-- Generated Code Do Not Modify
-- package org.allbinary.game.layer.weapon

local Animation = require("org.allbinary.animation.Animation")
local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local Movement = require("org.allbinary.physics.movement.Movement")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local SimpleWeaponLayer = require("org.allbinary.game.layer.weapon.SimpleWeaponLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TempExplosionWeaponLayer = {}
TempExplosionWeaponLayer.__index = TempExplosionWeaponLayer
TempExplosionWeaponLayer.className = "TempExplosionWeaponLayer"
setmetatable(TempExplosionWeaponLayer, {__index = SimpleWeaponLayer})

function TempExplosionWeaponLayer:_init_fields()
    self.weaponProperties = WeaponProperties.new(-1, -1, 0, 1000, 0)
    self.timeDelayHelper = TimeDelayHelper.new(0)
end


function TempExplosionWeaponLayer.new(name, movement, animationInterface, rectangle, viewPosition, timeDelay)
    local self = setmetatable(SimpleWeaponLayer.new(name, RemoteInfo.REMOTE_INFO, -1, movement, animationInterface, SimpleWeaponLayer.createDestroyed(), rectangle, viewPosition), TempExplosionWeaponLayer)
    self:_init_fields()
        -- super(...) made self above
        self.timeDelayHelper.delay = timeDelay
    return self
end


-- throws Exception
function TempExplosionWeaponLayer:processTick(allBinaryLayerManager)
        if self.timeDelayHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            self:getCollidableInferface():collide(self, self)
            self.totalDamage = self:getInitDamage() + 1
        end
        SimpleWeaponLayer.processTick(self, allBinaryLayerManager)
end

return TempExplosionWeaponLayer

