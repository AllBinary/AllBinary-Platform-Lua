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

local RTSLayerUtil = {}
package.loaded["org.allbinary.game.layer.RTSLayerUtil"] = RTSLayerUtil

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

local GroupCommonFactory = java_lazy("org.allbinary.game.identification.GroupCommonFactory")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local WeaponProperties = java_lazy("org.allbinary.game.combat.weapon.WeaponProperties")
local BasicGroupFactory = java_lazy("org.allbinary.game.identification.BasicGroupFactory")
local PartInterface = java_lazy("org.allbinary.game.part.PartInterface")
local BasicWeaponPart = java_lazy("org.allbinary.game.part.weapon.BasicWeaponPart")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BaseRaceTrackGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local FakeLayerManager = java_lazy("org.allbinary.game.layer.FakeLayerManager")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table RTSLayerUtil is declared before the requires
RTSLayerUtil.__index = RTSLayerUtil
RTSLayerUtil.className = "RTSLayerUtil"
RTSLayerUtil.javaClassName = "org.allbinary.game.layer.RTSLayerUtil"

function RTSLayerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.groupCommonFactory = GroupCommonFactory.getInstance()
    self.MAX_RELOAD_TIME = java_idiv(java_int(require("java.lang.Integer").MAX_VALUE), 100000)
end

function RTSLayerUtil._jinit(self)
    RTSLayerUtil._init_fields(self)
    return self
end

function RTSLayerUtil.new()
    return RTSLayerUtil._jinit(setmetatable({}, RTSLayerUtil))
end


function RTSLayerUtil.getInstance()
        return RTSLayerUtil.instance_f
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

RTSLayerUtil.instance_f = RTSLayerUtil.new()

return RTSLayerUtil

