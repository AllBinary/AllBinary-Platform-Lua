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

local AdvancedRTSProperties = {}
package.loaded["org.allbinary.game.layer.AdvancedRTSProperties"] = AdvancedRTSProperties

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local NoShakeAnimationListener = java_lazy("org.allbinary.animation.transition.shake.NoShakeAnimationListener")
local ShakeAnimationListener = java_lazy("org.allbinary.animation.transition.shake.ShakeAnimationListener")
local ShakeAnimationListenerFactory = java_lazy("org.allbinary.animation.transition.shake.ShakeAnimationListenerFactory")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local TickableInterface = java_lazy("org.allbinary.game.tick.TickableInterface")
local AllBinaryNoVibration = java_lazy("org.allbinary.media.AllBinaryNoVibration")
local AllBinaryVibration = java_lazy("org.allbinary.media.AllBinaryVibration")
local AllBinaryVibrationME = java_lazy("org.allbinary.media.AllBinaryVibrationME")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AdvancedRTSProperties is declared before the requires
AdvancedRTSProperties.__index = AdvancedRTSProperties
AdvancedRTSProperties.className = "AdvancedRTSProperties"
AdvancedRTSProperties.javaClassName = "org.allbinary.game.layer.AdvancedRTSProperties"

function AdvancedRTSProperties:_init_fields()
    if self.shakeListener == nil then self.shakeListener = nil end
    if self.vibration == nil then self.vibration = nil end
    if self.duration == nil then self.duration = 0 end
    if self.waypointBehaviorBase == nil then self.waypointBehaviorBase = nil end
end


function AdvancedRTSProperties.createPropertiesSimulated()
        return AdvancedRTSProperties.new(NoShakeAnimationListener.NO_SHAKE_ANIMATION_LISTENER, AllBinaryNoVibration.NO_VIBRATION, 0, WaypointBehaviorBase.new())
end


function AdvancedRTSProperties.createProperties()
        return AdvancedRTSProperties.new(ShakeAnimationListenerFactory.getInstance(), AllBinaryVibration.getInstance(), math.tointeger(GameConfigurationCentral.getInstance().VIBRATION:getValue() // 1) * 100, WaypointBehaviorBase.new())
end


function AdvancedRTSProperties._jinit(self, shakeListener, vibration, duration, waypointBehaviorBase)
    AdvancedRTSProperties._init_fields(self)
        self.shakeListener = shakeListener
        self.vibration = vibration
        self.duration = duration
        self.waypointBehaviorBase = waypointBehaviorBase
    return self
end

function AdvancedRTSProperties.new(...)
    local self = setmetatable({}, AdvancedRTSProperties)
    AdvancedRTSProperties._jinit(self, ...)
    return self
end

return AdvancedRTSProperties

