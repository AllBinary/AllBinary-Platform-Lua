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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local LayerCoveringCellPositionsUtil = require("org.allbinary.game.layer.geographic.map.LayerCoveringCellPositionsUtil")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local CellPositionsUtil = require("org.allbinary.media.graphics.geography.map.CellPositionsUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local GeographicMapCellPositionAreaBase = require("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPositionArea = {}
GeographicMapCellPositionArea.__index = GeographicMapCellPositionArea
GeographicMapCellPositionArea.className = "GeographicMapCellPositionArea"
setmetatable(GeographicMapCellPositionArea, {__index = GeographicMapCellPositionAreaBase})

function GeographicMapCellPositionArea:_init_fields()
    self.cellPositionsUtil = CellPositionsUtil.getInstance()
    self.layerCoveringCellPositionsUtil = LayerCoveringCellPositionsUtil.getInstance()
    self.reusableOccupyingGeographicMapCellPositionList = BasicArrayListS.new(4)
    self.reusableSurroundingGeographicMapCellPositionList = BasicArrayListS.new(12)
    self.surroundingCircularIndexUtil = CircularIndexUtil.createInstance(0)
    self.layerInterface = nil
    self.LIST = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.occupyingGeographicMapCellPositionList = self.LIST
    self.surroundingGeographicMapCellPositionList = self.LIST
end


function GeographicMapCellPositionArea.new(layerInterface)
    local self = setmetatable(GeographicMapCellPositionAreaBase.new(), GeographicMapCellPositionArea)
    self:_init_fields()
        self.layerInterface = layerInterface
    return self
end


-- throws Exception
function GeographicMapCellPositionArea:update(geographicMapInterface)
        self.occupyingGeographicMapCellPositionList = self.layerCoveringCellPositionsUtil:getAllXY(geographicMapInterface, self.layerInterface, self.layerInterface:getXP(), self.layerInterface:getYP(), self.reusableOccupyingGeographicMapCellPositionList)
        self.surroundingGeographicMapCellPositionList = self.cellPositionsUtil:getAllSurrounding(geographicMapInterface, self.occupyingGeographicMapCellPositionList, self.reusableSurroundingGeographicMapCellPositionList)
        self.surroundingCircularIndexUtil:setSize(self.surroundingGeographicMapCellPositionList:size())
end


function GeographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        return self.occupyingGeographicMapCellPositionList
end


function GeographicMapCellPositionArea:getSurroundingGeographicMapCellPositionList()
        return self.surroundingGeographicMapCellPositionList
end


function GeographicMapCellPositionArea:getNextSurroundingGeographicMapCellPosition()
        local geographicMapCellPosition = self.surroundingGeographicMapCellPositionList:get(self.surroundingCircularIndexUtil:getIndex())
        self.surroundingCircularIndexUtil:next()
        return geographicMapCellPosition
end

return GeographicMapCellPositionArea

