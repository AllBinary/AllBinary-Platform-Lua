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
-- package org.allbinary.game.layer.building

local BuildingPropertiesFactory = {}
package.loaded["org.allbinary.game.layer.building.BuildingPropertiesFactory"] = BuildingPropertiesFactory

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

local DamageFloaters = java_lazy("org.allbinary.game.combat.damage.DamageFloaters")
local PtsDamageFloaters = java_lazy("org.allbinary.game.combat.damage.PtsDamageFloaters")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local BasicHudFactory = java_lazy("org.allbinary.game.graphics.hud.BasicHudFactory")
local HealthBar = java_lazy("org.allbinary.game.health.HealthBar")
local HealthBarTwodAnimation = java_lazy("org.allbinary.game.health.HealthBarTwodAnimation")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BuildingLayer = java_lazy("org.allbinary.game.layer.building.BuildingLayer")

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

-- class table BuildingPropertiesFactory is declared before the requires
BuildingPropertiesFactory.__index = BuildingPropertiesFactory
BuildingPropertiesFactory.className = "BuildingPropertiesFactory"
BuildingPropertiesFactory.javaClassName = "org.allbinary.game.layer.building.BuildingPropertiesFactory"

function BuildingPropertiesFactory:_init_fields()
    self.damageFloatersPaintableInterface = NullPaintable.getInstance()
end

function BuildingPropertiesFactory._jinit(self)
    BuildingPropertiesFactory._init_fields(self)
    return self
end

function BuildingPropertiesFactory.new()
    return BuildingPropertiesFactory._jinit(setmetatable({}, BuildingPropertiesFactory))
end


function BuildingPropertiesFactory.getInstance()
        return BuildingPropertiesFactory.instance_f
end


function BuildingPropertiesFactory:getEfficiencyPerLevel(buildingLayer)
        return 10000 / buildingLayer:getMaxLevel() + 10000 % buildingLayer:getMaxLevel()
end


function BuildingPropertiesFactory:getDamageFloaters(buildingLayer)
        local damageFloaters = DamageFloaters.getInstance()
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().DAMAGE_FLOATERS) then
            damageFloaters = PtsDamageFloaters.new(buildingLayer)
            self.damageFloatersPaintableInterface = damageFloaters
        else
            damageFloaters = DamageFloaters.new()
        end
        return damageFloaters
end


-- throws Exception
function BuildingPropertiesFactory:getHealthBar(buildingLayer)
        local healthBar = NullPaintable.getInstance()
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().HEALTH_BARS) then
            healthBar = HealthBar.new(buildingLayer, buildingLayer:getHealthInterface(), HealthBarTwodAnimation.new(buildingLayer, BasicHudFactory.getInstance().BOTTOMLEFT), -1)
        end
        return healthBar
end


function BuildingPropertiesFactory:getHashtable()
        return StdUtil.getInstance():createHashtable()
end


function BuildingPropertiesFactory:getTrackingEvent(buildingLayer)
        return TrackingEvent.new(buildingLayer)
end

BuildingPropertiesFactory.instance_f = BuildingPropertiesFactory.new()

return BuildingPropertiesFactory

