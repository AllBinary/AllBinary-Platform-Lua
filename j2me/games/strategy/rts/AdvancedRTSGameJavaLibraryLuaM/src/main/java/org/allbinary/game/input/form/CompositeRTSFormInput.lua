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
-- package org.allbinary.game.input.form

local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Group = require("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")

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

local CompositeRTSFormInput = {}
CompositeRTSFormInput.__index = CompositeRTSFormInput
CompositeRTSFormInput.className = "CompositeRTSFormInput"
setmetatable(CompositeRTSFormInput, {__index = RTSFormInput})

function CompositeRTSFormInput:_init_fields()
    self.rtsFormInputArray = nil
    self.itemIndex = nil
    self.isPrimaryWaypointCreator = nil
end


function CompositeRTSFormInput.new(groupInterface, isPrimaryWaypointCreator, itemIndex)
    local self = setmetatable(RTSFormInput.new(groupInterface), CompositeRTSFormInput)
    self:_init_fields()
        -- super(...) made self above
        self.itemIndex = itemIndex
        self.isPrimaryWaypointCreator = isPrimaryWaypointCreator
        self.rtsFormInputArray = java_new_array(nil, 2)
        self.rtsFormInputArray[1] = WaypointRTSFormInput.new(self.groupInterfaceArray, isPrimaryWaypointCreator)
        self.rtsFormInputArray[2] = UnitRTSFormInput.new(self.groupInterfaceArray)
    return self
end


-- throws Exception
function CompositeRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        RTSFormInput.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local size = (self.rtsFormInputArray.n or #self.rtsFormInputArray)
        for index = 0, size - 1 do
            self.rtsFormInputArray[index + 1]:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        end
end


-- throws Exception
function CompositeRTSFormInput:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        local scrollSelectionForm = rtsPlayerLayerInterface:getCurrentScrollSelectionForm()
        local index = scrollSelectionForm:getSelectedIndexForPoint(point)
        if self:isStickyItemSelected() and associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance() then
            if self:getSelectedStickyItemIndex() <= self.itemIndex[1] then
                self.rtsFormInputArray[1]:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
            end
        elseif index > self.itemIndex[1] then
            self.rtsFormInputArray[2]:processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        end
end


-- throws Exception
function CompositeRTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(CommonLabels.getInstance().INDEX_LABEL + index) .. " > " .. tostring(self.itemIndex[1]), self, commonStrings.PROCESS)
        if self:isStickyItemSelected() and associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance() then
            if self:getSelectedStickyItemIndex() <= self.itemIndex[1] then
                self.rtsFormInputArray[1]:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
            end
        elseif index > self.itemIndex[1] then
            self.rtsFormInputArray[2]:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        end
end


-- throws Exception
function CompositeRTSFormInput:processSticky(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
        return self.rtsFormInputArray[1]:processSticky(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point)
end


-- throws Exception
function CompositeRTSFormInput:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
        self.rtsFormInputArray[1]:processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index)
end


function CompositeRTSFormInput:getSelectedStickyItemIndex()
        return self.rtsFormInputArray[1]:getSelectedStickyItemIndex()
end


function CompositeRTSFormInput:isStickyItemSelected()
        return self.rtsFormInputArray[1]:isStickyItemSelected()
end


function CompositeRTSFormInput:setStickyItemSelected(stickyItemSelected)
        self.rtsFormInputArray[1]:setStickyItemSelected(stickyItemSelected)
end


function CompositeRTSFormInput:getSelectedStickyItem()
        return self.rtsFormInputArray[1]:getSelectedStickyItem()
end


function CompositeRTSFormInput:setSelectedStickyItem(selectedStickyItem)
        self.rtsFormInputArray[1]:setSelectedStickyItem(selectedStickyItem)
end

return CompositeRTSFormInput

