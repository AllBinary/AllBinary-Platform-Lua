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
-- package org.allbinary.game.input.form

local GroupCommonFactory = require("org.allbinary.game.identification.GroupCommonFactory")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local LayerInterfaceFactoryImageItem = require("org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local Group = require("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LayerInterfaceFactoryInterface = require("org.allbinary.layer.LayerInterfaceFactoryInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
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

local RTSFormInput = {}
RTSFormInput.__index = RTSFormInput
RTSFormInput.className = "RTSFormInput"

function RTSFormInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.groupCommonFactory = GroupCommonFactory.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.newUnconstructedRTSLayerInterfaceArray = java_new_array(nil, 7)
    self.groupInterfaceArray = nil
    self.selectedGeographicCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.stickyItemSelected = false
    self.selectedStickyItemIndex = 0
    self.selectedStickyItem = ABCustomItem.getNullInstance()
end


function RTSFormInput.new(groupInterfaceArray)
    local self = setmetatable({}, RTSFormInput)
    self:_init_fields()
        local size = (self.newUnconstructedRTSLayerInterfaceArray.n or #self.newUnconstructedRTSLayerInterfaceArray)
        for index = 0, size - 1 do
            self.newUnconstructedRTSLayerInterfaceArray[index + 1] = CollidableDestroyableDamageableLayer.getNullInstance()
        end
        self.groupInterfaceArray = groupInterfaceArray
        self.hashtable:put(DirectionFactory.getInstance().NAME, DirectionFactory.getInstance().DOWN)
        if groupInterfaceArray ~= nil then
            self.hashtable:put(self.groupCommonFactory.ID, groupInterfaceArray)
        end
    return self
end


-- throws Exception
function RTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
end


-- throws Exception
function RTSFormInput:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        local index = self:getIndexAt(rtsPlayerLayerInterface, point)
        if index < 0 then
            return
        end
        local scrollSelectionForm = rtsPlayerLayerInterface:getCurrentScrollSelectionForm()
        local item = scrollSelectionForm:get(index)
        if item == nil then
            return
        end
        self:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
end


-- throws Exception
function RTSFormInput:process(layerManager)
        self:setAllBinaryGameLayerManager(layerManager)
end


-- throws Exception
function RTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
end


-- throws Exception
function RTSFormInput:processSticky(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        local index = self:getIndexAt(rtsPlayerLayerInterface, point)
        if index < 0 then
            return false
        end
        local scrollSelectionForm = rtsPlayerLayerInterface:getCurrentScrollSelectionForm()
        local item = scrollSelectionForm:get(index)
        if item == nil then
            return false
        end
        self:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        return true
end


-- throws Exception
function RTSFormInput:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
end


-- throws Exception
function RTSFormInput:getItemAt(rtsPlayerLayerInterface, point)
        self.logUtil:putF(tostring(StringMaker.new():append("Point: "):append(StringUtil.getInstance():toString(point))), self, "getItemAt")
        local scrollSelectionForm = rtsPlayerLayerInterface:getCurrentScrollSelectionForm()
        return scrollSelectionForm:getSelectedItem(point)
end


-- throws Exception
function RTSFormInput:getIndexAt(rtsPlayerLayerInterface, point)
        self.logUtil:putF(tostring(StringMaker.new():append("Point: "):append(StringUtil.getInstance():toString(point))), self, "getItemAt")
        local scrollSelectionForm = rtsPlayerLayerInterface:getCurrentScrollSelectionForm()
        return scrollSelectionForm:getSelectedIndexForPoint(point)
end


-- throws Exception
function RTSFormInput:getInstance(layerManager, aItem, geographicMapCellPosition)
        local item = aItem
        local layerInterfaceFactoryInterface = item:getLayerInterfaceFactoryInterface()
        local cellPoint = geographicMapCellPosition:getPoint()
        if layerInterfaceFactoryInterface ~= nil then
            self.hashtable:put(AllBinaryGameLayerManager.ID, layerManager)
            return layerInterfaceFactoryInterface:getNextInstance(self:getHashtable(), cellPoint:getX(), cellPoint:getY(), cellPoint:getZ())
        end
        return CollidableDestroyableDamageableLayer.getNullInstance()
end


function RTSFormInput:getSelectedGeographicCellPosition()
        return self.selectedGeographicCellPosition
end


function RTSFormInput:setSelectedGeographicCellPosition(selectedGeographicCellPosition)
        self.logUtil:putF(tostring(StringMaker.new():append("Selected GeographicMapCellPosition: "):append(tostring(selectedGeographicCellPosition))), self, "setSelectedGeographicCellPosition")
        self.selectedGeographicCellPosition = selectedGeographicCellPosition
end


function RTSFormInput:isStickyItemSelected()
        return self.stickyItemSelected
end


function RTSFormInput:setStickyItemSelected(stickyItemSelected)
        self.stickyItemSelected = stickyItemSelected
end


function RTSFormInput:getSelectedStickyItem()
        return self.selectedStickyItem
end


function RTSFormInput:setSelectedStickyItem(selectedStickyItem)
        self.selectedStickyItem = selectedStickyItem
end


function RTSFormInput:getSelectedStickyItemIndex()
        return self.selectedStickyItemIndex
end


function RTSFormInput:setSelectedStickyItemIndex(selectedStickyItemIndex)
        self.selectedStickyItemIndex = selectedStickyItemIndex
end


function RTSFormInput:getHashtable()
        return self.hashtable
end

return RTSFormInput

