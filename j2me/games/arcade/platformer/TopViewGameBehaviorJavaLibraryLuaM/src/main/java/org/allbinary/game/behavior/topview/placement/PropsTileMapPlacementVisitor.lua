-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.behavior.topview.placement

local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TileLayer = require("org.mapeditor.core.TileLayer")
local TiledMap = require("org.mapeditor.core.TiledMap")
local TileMapPlacementVisitor = require("org.allbinary.game.behavior.topview.placement.TileMapPlacementVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PropsTileMapPlacementVisitor = {}
PropsTileMapPlacementVisitor.__index = PropsTileMapPlacementVisitor
PropsTileMapPlacementVisitor.className = "PropsTileMapPlacementVisitor"
setmetatable(PropsTileMapPlacementVisitor, {__index = TileMapPlacementVisitor})

function PropsTileMapPlacementVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.randomFactory = MyRandomFactory.getInstance()
end

function PropsTileMapPlacementVisitor.new()
    local self = setmetatable(TileMapPlacementVisitor.new(), PropsTileMapPlacementVisitor)
    self:_init_fields()
    return self
end


function PropsTileMapPlacementVisitor:visit(lastMap, mapData)
        local layerIndex = 0
        local tileLayer = (lastMap:getLayer(layerIndex))
        local mapArray = tileLayer:getMapArray()
        local size = (mapData.n or #mapData)
        local size2 = (mapData[1].n or #mapData[1])
        for index = 0, size - 1 do
            for index2 = 0, size2 - 1 do
                if mapArray[index + 1][index2 + 1] == 14 then
                else
                    self:visit2(mapArray, mapData, index, index2)
                end
                if math.fmod(index, 7) == 0 then
                    if mapArray[index + 1][index2 + 1] == 19 then
                        local randomInt = self.randomFactory:getAbsoluteNextIntAllowZero(3)
                        if randomInt == 0 then
                            mapData[index + 1][index2 + 1] = 1
                        elseif randomInt == 1 then
                            mapData[index + 1][index2 + 1] = 81
                        elseif randomInt == 2 then
                            mapData[index + 1][index2 + 1] = 97
                        end
                    elseif mapArray[index + 1][index2 + 1] == 17 then
                        local randomInt = self.randomFactory:getAbsoluteNextIntAllowZero(3)
                        if randomInt == 0 then
                            mapData[index + 1][index2 + 1] = 17
                        elseif randomInt == 1 then
                            mapData[index + 1][index2 + 1] = 81
                        elseif randomInt == 2 then
                            mapData[index + 1][index2 + 1] = 97
                        end
                    end
                end
                if math.fmod(index2, 7) == 0 then
                    if mapArray[index + 1][index2 + 1] == 34 then
                        local randomInt = self.randomFactory:getAbsoluteNextIntAllowZero(4)
                        if randomInt == 0 then
                            mapData[index + 1][index2 + 1] = 33
                        elseif randomInt == 1 then
                            mapData[index + 1][index2 + 1] = 65
                        elseif randomInt == 2 then
                            mapData[index + 1][index2 + 1] = 81
                        elseif randomInt == 3 then
                            mapData[index + 1][index2 + 1] = 97
                        end
                    end
                end
            end
        end
end


function PropsTileMapPlacementVisitor:visit2(mapArray, mapData, index, index2)
        local commonStrings = CommonStrings.getInstance()
        local countX = 0
        local countY = 0
        local index3 = index - 1
        for index4 = index2 - 1, 0 + 1, -1 do
            index3 = index3 - 1
            if index3 < 0 or index4 < 0 then
                return
            end
            if mapArray[index3 + 1][index4 + 1] ~= 14 or mapData[index3 + 1][index4 + 1] ~= 0 then
                if countX > 10 and countY > 10 then
                    for index5 = index3 + 1, index - 1 - 1 do
                        for index6 = index4 + 1, index2 - 1 - 1 do
                            if mapArray[index5 + 1][index6 + 1] ~= 14 or mapData[index5 + 1][index6 + 1] ~= 0 then
                                return
                            end
                        end
                    end
                    local x = index - (java_idiv(countX, 2))
                    local y = index2 - (java_idiv(countY, 2))
                    if x >= 0 and y >= 0 and x < (mapData.n or #mapData) and y < (mapData[1].n or #mapData[1]) then
                    end
                end
                return
            end
            countY = countY + 1
            countX = countX + 1
        end
end

return PropsTileMapPlacementVisitor

