-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

local GroupCommonFactory = require("org.allbinary.game.identification.GroupCommonFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local GameInfo = require("org.allbinary.game.GameInfo")
local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local PartInterface = require("org.allbinary.game.part.PartInterface")
local BasicWeaponPart = require("org.allbinary.game.part.weapon.BasicWeaponPart")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BaseRaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local RTSLayerUtil = {}
RTSLayerUtil.__index = RTSLayerUtil
RTSLayerUtil.className = "RTSLayerUtil"

function RTSLayerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.groupCommonFactory = GroupCommonFactory.getInstance()
    self.MAX_RELOAD_TIME = java_idiv(java_int(Integer.MAX_VALUE), 100000)
end

function RTSLayerUtil.new()
    local self = setmetatable({}, RTSLayerUtil)
    self:_init_fields()
    return self
end


function RTSLayerUtil.getInstance()
        return RTSLayerUtil.instance
end


function RTSLayerUtil:createWeaponProperties(weaponProperties, currentLevel, lastLevel)
        local reloadTime = weaponProperties:getReloadTime()
        if lastLevel > currentLevel then
            reloadTime = reloadTime + 50
        elseif lastLevel < currentLevel then
            reloadTime = reloadTime - 50
        end
        local newWeaponProperties = WeaponProperties.new(reloadTime, weaponProperties:getTargetingTime(), weaponProperties:getSpeed():getUnscaled(), weaponProperties:getDamage() / lastLevel * currentLevel, weaponProperties:getDissipation())
        return newWeaponProperties
end


function RTSLayerUtil:downgrade(rtsLayer)
        rtsLayer:setLevel(rtsLayer:getLevel() - 1)
        local partInterfaceArray = rtsLayer:getPartInterfaceArray()
        local size = (partInterfaceArray.n or #partInterfaceArray)
        local partInterface = nil
        do
            local index = size
            while (function() index = index - 1 return index end)() >= 0 do
            partInterface = partInterfaceArray[index + 1]
            partInterface:setWeaponProperties(self:createWeaponProperties(partInterface:getWeaponProperties(), rtsLayer:getLevel(), rtsLayer:getLevel() + 1))
            end
        end
        rtsLayer:select()
end


function RTSLayerUtil:upgrade(rtsLayer)
        rtsLayer:setLevel(rtsLayer:getLevel() + 1)
        local partInterfaceArray = rtsLayer:getPartInterfaceArray()
        local size = (partInterfaceArray.n or #partInterfaceArray)
        local partInterface = nil
        do
            local index = size
            while (function() index = index - 1 return index end)() >= 0 do
            partInterface = partInterfaceArray[index + 1]
            partInterface:setWeaponProperties(self:createWeaponProperties(partInterface:getWeaponProperties(), rtsLayer:getLevel(), rtsLayer:getLevel() - 1))
            end
        end
        rtsLayer:select()
end


function RTSLayerUtil:getCostExponential(cost)
        return (java_idiv((cost * cost * cost), (cost * 1000)))
end


function RTSLayerUtil:getWeaponPropertiesCost(weaponProperties)
        local cost = (weaponProperties:getDamage() + weaponProperties:getRange() + ((((self.MAX_RELOAD_TIME / weaponProperties:getReloadTime())) // (1 << (1)))))
        cost = self:getCostExponential(cost)
        return cost
end


function RTSLayerUtil:getCost(rtsLayer)
        local total = 0
        local partInterfaceArray = rtsLayer:getPartInterfaceArray()
        local size = (partInterfaceArray.n or #partInterfaceArray)
        local partInterface = nil
        local weaponProperties = nil
        for index = size - 1, 0, -1 do
            partInterface = partInterfaceArray[index + 1]
            weaponProperties = partInterface:getWeaponProperties()
            total = total + (self:getWeaponPropertiesCost(weaponProperties))
        end
        return total
end


function RTSLayerUtil:getDowngradeCost(rtsLayer)
        local partInterfaceArray = rtsLayer:getPartInterfaceArray()
        local size = (partInterfaceArray.n or #partInterfaceArray)
        local downgradeCost = 0
        local partInterface = nil
        local weaponProperties = nil
        local downgradeWeaponCost = 0
        local currentWeaponCost = 0
        for index = size - 1, 0, -1 do
            partInterface = partInterfaceArray[index + 1]
            weaponProperties = partInterface:getWeaponProperties()
            downgradeWeaponCost = self:getWeaponPropertiesCost(self:createWeaponProperties(weaponProperties, rtsLayer:getLevel() - 1, rtsLayer:getLevel()))
            currentWeaponCost = self:getWeaponPropertiesCost(weaponProperties)
            downgradeCost = downgradeCost + ((currentWeaponCost - downgradeWeaponCost))
        end
        downgradeCost = java_idiv(downgradeCost * 9, 10)
        self.logUtil:putF(tostring(StringMaker.new():append("Total Cost: "):appendint(downgradeCost)), self, "getDowngradeCost")
        return downgradeCost
end


function RTSLayerUtil:getUpgradeCost(rtsLayer)
        local upgradeCost = 0
        local partInterfaceArray = rtsLayer:getPartInterfaceArray()
        local size = (partInterfaceArray.n or #partInterfaceArray)
        local partInterface = nil
        local weaponProperties = nil
        local upgradedWeaponCost = 0
        local currentWeaponCost = 0
        for index = size - 1, 0, -1 do
            partInterface = partInterfaceArray[index + 1]
            weaponProperties = partInterface:getWeaponProperties()
            upgradedWeaponCost = self:getWeaponPropertiesCost(self:createWeaponProperties(weaponProperties, rtsLayer:getLevel() + 1, rtsLayer:getLevel()))
            currentWeaponCost = self:getWeaponPropertiesCost(weaponProperties)
            upgradeCost = upgradeCost + ((upgradedWeaponCost - currentWeaponCost))
        end
        self.logUtil:putF(tostring(StringMaker.new():append("Total Cost: "):appendint(upgradeCost)), self, "getUpgradeCost")
        return upgradeCost
end


-- throws Exception
function RTSLayerUtil:destroyAndClear(list)
        local rtsLayer = nil
        for index = list:size() - 1, 0, -1 do
            rtsLayer = list:get(index)
            rtsLayer:setDestroyed(true)
        end
        list:clear()
end


function RTSLayerUtil:createFakeRTSLayerHashtable(baseRaceTrackGeographicMap)
        local hashtable = StdUtil.getInstance():createHashtable()
        local layerManager = FakeLayerManager.new(GameInfo.NONE)
        layerManager:setGeographicMapInterface({baseRaceTrackGeographicMap})
        hashtable:put(AllBinaryGameLayerManager.ID, layerManager)
        hashtable:put(DirectionFactory.getInstance().NAME, DirectionFactory.getInstance().LEFT)
        hashtable:put(self.groupCommonFactory.ID, BasicGroupFactory.getInstance().NONE_ARRAY)
        return hashtable
end

RTSLayerUtil.instance = RTSLayerUtil.new()

return RTSLayerUtil

