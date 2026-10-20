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

local DamageFloaters = require("org.allbinary.game.combat.damage.DamageFloaters")
local PtsDamageFloaters = require("org.allbinary.game.combat.damage.PtsDamageFloaters")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local HealthBar = require("org.allbinary.game.health.HealthBar")
local HealthBarTwodAnimation = require("org.allbinary.game.health.HealthBarTwodAnimation")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BuildingPropertiesFactory = {}
BuildingPropertiesFactory.__index = BuildingPropertiesFactory
BuildingPropertiesFactory.className = "BuildingPropertiesFactory"

function BuildingPropertiesFactory:_init_fields()
    self.damageFloatersPaintableInterface = NullPaintable.getInstance()
end

function BuildingPropertiesFactory.new()
    local self = setmetatable({}, BuildingPropertiesFactory)
    self:_init_fields()
    return self
end


function BuildingPropertiesFactory.getInstance()
        return BuildingPropertiesFactory.instance
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

BuildingPropertiesFactory.instance = BuildingPropertiesFactory.new()

return BuildingPropertiesFactory

