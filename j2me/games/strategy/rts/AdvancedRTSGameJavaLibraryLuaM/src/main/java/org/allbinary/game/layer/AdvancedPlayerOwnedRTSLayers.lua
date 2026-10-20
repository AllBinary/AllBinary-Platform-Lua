-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PlayerOwnedRTSLayers = require("org.allbinary.game.layer.PlayerOwnedRTSLayers")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvancedPlayerOwnedRTSLayers = {}
AdvancedPlayerOwnedRTSLayers.__index = AdvancedPlayerOwnedRTSLayers
AdvancedPlayerOwnedRTSLayers.className = "AdvancedPlayerOwnedRTSLayers"
setmetatable(AdvancedPlayerOwnedRTSLayers, {__index = PlayerOwnedRTSLayers})

function AdvancedPlayerOwnedRTSLayers:_init_fields()
    self.unitsList = BasicArrayListD.new()
    self.waypointsList = BasicArrayListD.new()
    self.buildingList = BasicArrayListD.new()
    self.baseList = BasicArrayListD.new()
    self.garrisonList = BasicArrayListD.new()
    self.houseList = BasicArrayListD.new()
    self.labList = BasicArrayListD.new()
    self.factoryList = BasicArrayListD.new()
end

function AdvancedPlayerOwnedRTSLayers.new()
    local self = setmetatable(PlayerOwnedRTSLayers.new(), AdvancedPlayerOwnedRTSLayers)
    self:_init_fields()
    return self
end


function AdvancedPlayerOwnedRTSLayers:addUnit(rtsLayer)
        self.unitsList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end


function AdvancedPlayerOwnedRTSLayers:addWaypoint(rtsLayer)
        self.waypointsList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end


function AdvancedPlayerOwnedRTSLayers:addBase(rtsLayer)
        self.baseList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end


function AdvancedPlayerOwnedRTSLayers:addGarrison(rtsLayer)
        self.garrisonList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end


function AdvancedPlayerOwnedRTSLayers:addHouse(rtsLayer)
        self.houseList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end


function AdvancedPlayerOwnedRTSLayers:addLab(rtsLayer)
        self.labList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end


function AdvancedPlayerOwnedRTSLayers:addFactory(rtsLayer)
        self.factoryList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end


function AdvancedPlayerOwnedRTSLayers:removeUnit(gameLayer)
        self.unitsList:remove(gameLayer)
        self.rtsLayerList:remove(gameLayer)
end


function AdvancedPlayerOwnedRTSLayers:removeWaypoint(gameLayer)
        self.waypointsList:remove(gameLayer)
        self.rtsLayerList:remove(gameLayer)
end


function AdvancedPlayerOwnedRTSLayers:getUnitsList()
        return self.unitsList
end


function AdvancedPlayerOwnedRTSLayers:getWaypointsList()
        return self.waypointsList
end


function AdvancedPlayerOwnedRTSLayers:getBaseList()
        return self.baseList
end


function AdvancedPlayerOwnedRTSLayers:getGarrisonList()
        return self.garrisonList
end


function AdvancedPlayerOwnedRTSLayers:getHouseList()
        return self.houseList
end


function AdvancedPlayerOwnedRTSLayers:getLabList()
        return self.labList
end


function AdvancedPlayerOwnedRTSLayers:getFactoryList()
        return self.factoryList
end


function AdvancedPlayerOwnedRTSLayers:getTotalBuildings()
        return self.baseList:size() + self.garrisonList:size() + self.houseList:size() + self.labList:size() + self.factoryList:size()
end


function AdvancedPlayerOwnedRTSLayers:removeBuilding(layerInterface)
        self.buildingList:add(layerInterface)
        if self:getBaseList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getFactoryList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getGarrisonList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getLabList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getHouseList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        end
end


function AdvancedPlayerOwnedRTSLayers:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(PlayerOwnedRTSLayers))
        stringBuffer:append(" Bases: ")
        stringBuffer:appendint(self:getBaseList():size())
        stringBuffer:append(" Factory: ")
        stringBuffer:appendint(self:getFactoryList():size())
        stringBuffer:append(" Garrison: ")
        stringBuffer:appendint(self:getGarrisonList():size())
        stringBuffer:append(" Labs: ")
        stringBuffer:appendint(self:getLabList():size())
        stringBuffer:append(" Houses: ")
        stringBuffer:appendint(self:getHouseList():size())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:appendint(self:getWaypointsList():size())
        stringBuffer:append(" Units: ")
        stringBuffer:appendint(self:getUnitsList():size())
        return tostring(stringBuffer)
end
AdvancedPlayerOwnedRTSLayers.__tostring = function(self) return self:toString() end


function AdvancedPlayerOwnedRTSLayers:getBuildingList()
        return self.buildingList
end

return AdvancedPlayerOwnedRTSLayers

