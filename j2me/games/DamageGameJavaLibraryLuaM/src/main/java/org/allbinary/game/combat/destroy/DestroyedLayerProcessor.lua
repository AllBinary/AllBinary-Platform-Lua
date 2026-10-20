--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.game.combat.destroy

local DestroyEventCircularStaticPool = require("org.allbinary.game.combat.destroy.event.DestroyEventCircularStaticPool")
local DestroyedEvent = require("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local DestroyedEventHandler = require("org.allbinary.game.combat.destroy.event.DestroyedEventHandler")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicLayerProcessor = require("org.allbinary.layer.BasicLayerProcessor")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DestroyedLayerProcessor = {}
DestroyedLayerProcessor.__index = DestroyedLayerProcessor
DestroyedLayerProcessor.className = "DestroyedLayerProcessor"
setmetatable(DestroyedLayerProcessor, {__index = BasicLayerProcessor})


function DestroyedLayerProcessor.new()
    local self = setmetatable(BasicLayerProcessor.new(), DestroyedLayerProcessor)
    return self
end


function DestroyedLayerProcessor.init()
        DestroyedLayerProcessor.DESTROYED_LAYER_PROCESSOR = DestroyedLayerProcessor.new()
end


function DestroyedLayerProcessor.getInstance()
        return DestroyedLayerProcessor.DESTROYED_LAYER_PROCESSOR
end


-- throws Exception
function DestroyedLayerProcessor:process(allBinaryLayerManager)
        local list = self:getList()
        local size = list:size()
        local destroyedEventHandler = DestroyedEventHandler.getInstance()
        local destroyEventCircularStaticPool = DestroyEventCircularStaticPool.getInstance()
        local destroyedEvent = nil
        local layerInterface = nil
        for index = 0, size - 1 do
            local layerInterfaceCanBeNull = list.objectArray[index + 1]
            if layerInterfaceCanBeNull ~= nil then
                layerInterface = layerInterfaceCanBeNull
                allBinaryLayerManager:remove(layerInterface)
                destroyedEvent = destroyEventCircularStaticPool:getInstanceForLayer(layerInterface)
                destroyedEventHandler:fireEvent(destroyedEvent)
            else
                local commonStrings = CommonStrings.getInstance()
            end
        end
        list:clear()
end

DestroyedLayerProcessor.DESTROYED_LAYER_PROCESSOR = BasicLayerProcessor.NULL_LAYER_PROCESSOR

return DestroyedLayerProcessor

