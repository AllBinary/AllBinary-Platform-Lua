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
-- package org.allbinary.game.input

local AssignWaypointsUtil = require("org.allbinary.game.input.form.AssignWaypointsUtil")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local BuildingLayer = require("org.allbinary.game.layer.building.BuildingLayer")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local UnitLayer = require("org.allbinary.game.layer.unit.UnitLayer")
local NullUtil = require("org.allbinary.logic.NullUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SelectAdvancedRTSLayerVisitor = {}
SelectAdvancedRTSLayerVisitor.__index = SelectAdvancedRTSLayerVisitor
SelectAdvancedRTSLayerVisitor.className = "SelectAdvancedRTSLayerVisitor"
setmetatable(SelectAdvancedRTSLayerVisitor, {__index = Visitor})

function SelectAdvancedRTSLayerVisitor:_init_fields()
    self.selectedRTSLayersPlayerGameInput = nil
end


function SelectAdvancedRTSLayerVisitor.new(selectedRTSLayersPlayerGameInput)
    local self = setmetatable(Visitor.new(), SelectAdvancedRTSLayerVisitor)
    self:_init_fields()
        self.selectedRTSLayersPlayerGameInput = selectedRTSLayersPlayerGameInput
    return self
end


function SelectAdvancedRTSLayerVisitor:visit(anyType)
        local selectedLayer = anyType
        if selectedLayer ~= CollidableDestroyableDamageableLayer.getNullInstance() and selectedLayer:getType() == BuildingLayer.getStaticType() then
            local rtsGameLayer = selectedLayer
            local assignWaypointsUtil = AssignWaypointsUtil.getInstance()
            local list = self.selectedRTSLayersPlayerGameInput:getSelectedBasicArrayList()
            local currentRTSLayer = nil
            local unitLayer = nil
            for index = list:size() - 1, 0, -1 do
                currentRTSLayer = list:get(index)
                if currentRTSLayer:getType() == UnitLayer.getStaticType() then
                    unitLayer = currentRTSLayer
                    unitLayer:setParentLayer(rtsGameLayer)
                    assignWaypointsUtil:set(unitLayer, rtsGameLayer)
                end
            end
        end
        return NullUtil.getInstance().NULL_OBJECT
end

return SelectAdvancedRTSLayerVisitor

