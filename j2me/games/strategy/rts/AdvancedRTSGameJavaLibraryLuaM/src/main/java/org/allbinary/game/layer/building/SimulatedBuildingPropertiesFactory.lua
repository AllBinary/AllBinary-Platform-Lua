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
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = require("org.allbinary.game.tracking.TrackingEventHandler")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BuildingPropertiesFactory = require("org.allbinary.game.layer.building.BuildingPropertiesFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SimulatedBuildingPropertiesFactory = {}
SimulatedBuildingPropertiesFactory.__index = SimulatedBuildingPropertiesFactory
SimulatedBuildingPropertiesFactory.className = "SimulatedBuildingPropertiesFactory"
setmetatable(SimulatedBuildingPropertiesFactory, {__index = BuildingPropertiesFactory})

function SimulatedBuildingPropertiesFactory.new()
    local self = setmetatable(BuildingPropertiesFactory.new(), SimulatedBuildingPropertiesFactory)
    return self
end


function SimulatedBuildingPropertiesFactory.getInstance()
        return SimulatedBuildingPropertiesFactory.instanceC
end


function SimulatedBuildingPropertiesFactory:getEfficiencyPerLevel(buildingLayer)
        return 0
end


function SimulatedBuildingPropertiesFactory:getDamageFloaters(buildingLayer)
        local damageFloaters = DamageFloaters.getInstance()
        self.damageFloatersPaintableInterface = damageFloaters
        return damageFloaters
end


-- throws Exception
function SimulatedBuildingPropertiesFactory:getHealthBar(buildingLayer)
        return NullPaintable.getInstance()
end


function SimulatedBuildingPropertiesFactory:getHashtable()
        return StdUtil.getInstance().NULL_TABLE
end


function SimulatedBuildingPropertiesFactory:getTrackingEvent(buildingLayer)
        return TrackingEvent.new(TrackingEventHandler.getInstance())
end

SimulatedBuildingPropertiesFactory.instanceC = SimulatedBuildingPropertiesFactory.new()

return SimulatedBuildingPropertiesFactory

