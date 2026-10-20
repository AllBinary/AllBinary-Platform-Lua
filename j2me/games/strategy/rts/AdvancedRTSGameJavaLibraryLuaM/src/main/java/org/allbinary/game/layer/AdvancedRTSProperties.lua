-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.layer

local NoShakeAnimationListener = require("org.allbinary.animation.transition.shake.NoShakeAnimationListener")
local ShakeAnimationListener = require("org.allbinary.animation.transition.shake.ShakeAnimationListener")
local ShakeAnimationListenerFactory = require("org.allbinary.animation.transition.shake.ShakeAnimationListenerFactory")
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")
local AllBinaryNoVibration = require("org.allbinary.media.AllBinaryNoVibration")
local AllBinaryVibration = require("org.allbinary.media.AllBinaryVibration")
local AllBinaryVibrationME = require("org.allbinary.media.AllBinaryVibrationME")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvancedRTSProperties = {}
AdvancedRTSProperties.__index = AdvancedRTSProperties
AdvancedRTSProperties.className = "AdvancedRTSProperties"

function AdvancedRTSProperties:_init_fields()
    self.shakeListener = nil
    self.vibration = nil
    self.duration = nil
    self.waypointBehaviorBase = nil
end


function AdvancedRTSProperties.createPropertiesSimulated()
        return AdvancedRTSProperties.new(NoShakeAnimationListener.NO_SHAKE_ANIMATION_LISTENER, AllBinaryNoVibration.NO_VIBRATION, 0, WaypointBehaviorBase.new())
end


function AdvancedRTSProperties.createProperties()
        return AdvancedRTSProperties.new(ShakeAnimationListenerFactory.getInstance(), AllBinaryVibration.getInstance(), math.tointeger(GameConfigurationCentral.getInstance().VIBRATION:getValue() // 1) * 100, WaypointBehaviorBase.new())
end


function AdvancedRTSProperties.new(shakeListener, vibration, duration, waypointBehaviorBase)
    local self = setmetatable({}, AdvancedRTSProperties)
    self:_init_fields()
        self.shakeListener = shakeListener
        self.vibration = vibration
        self.duration = duration
        self.waypointBehaviorBase = waypointBehaviorBase
    return self
end

return AdvancedRTSProperties

