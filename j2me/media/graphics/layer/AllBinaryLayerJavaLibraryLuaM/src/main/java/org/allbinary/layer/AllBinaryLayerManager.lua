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
-- package org.allbinary.layer

local LayerManagerEvent = require("org.allbinary.layer.event.LayerManagerEvent")
local LayerManagerEventHandler = require("org.allbinary.layer.event.LayerManagerEventHandler")
local LayerManager = require("org.allbinary.layer.LayerManager")

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

local AllBinaryLayerManager = {}
AllBinaryLayerManager.__index = AllBinaryLayerManager
AllBinaryLayerManager.className = "AllBinaryLayerManager"
setmetatable(AllBinaryLayerManager, {__index = LayerManager})

function AllBinaryLayerManager:_init_fields()
    self.layerManagerEventHandler = LayerManagerEventHandler.getInstance()
    self.createLayerManagerEvent = LayerManagerEvent.new(self, self.layerManagerEventHandler.CREATE)
    self.deleteLayerManagerEvent = LayerManagerEvent.new(self, self.layerManagerEventHandler.DELETE)
    self.basicLayerProcessorArray = java_new_array(nil, 0)
end


function AllBinaryLayerManager.new()
    local self = setmetatable(LayerManager.new(LayerManagerNoDebug.getInstance()), AllBinaryLayerManager)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AllBinaryLayerManager:getLayerProcessorArray()
        return self.basicLayerProcessorArray
end


function AllBinaryLayerManager:setLayerProcessorArray(layerProcessorArray)
        self.basicLayerProcessorArray = layerProcessorArray
end


function AllBinaryLayerManager:log()
        local size = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
        for index = 0, size - 1 do
            local layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
        end
end


-- throws Exception
function AllBinaryLayerManager:append(layerInterface)
        if not self:contains(layerInterface) then
            self:appendProcessors(layerInterface)
            LayerManager.append(self, layerInterface)
        end
end


-- throws Exception
function AllBinaryLayerManager:appendAt(layerInterface, index)
        if not self:contains(layerInterface) then
            self:appendProcessors(layerInterface)
            LayerManager.appendAt(self, layerInterface, index)
        end
end


-- throws Exception
function AllBinaryLayerManager:appendProcessors(layerInterface)
        self.createLayerManagerEvent:setLayerInterface(layerInterface)
        self.layerManagerEventHandler:fireEvent(self.createLayerManagerEvent)
        local layerProcessorInterface = nil
        do
            local index = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
            while (function() index = index - 1 return index end)() >= 0 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            if layerProcessorInterface:isProcessorLayer(layerInterface) then
                layerProcessorInterface:getLayerManager():append(layerInterface)
            end
            end
        end
end


-- throws Exception
function AllBinaryLayerManager:remove(layerInterface)
        self.deleteLayerManagerEvent:setLayerInterface(layerInterface)
        self.layerManagerEventHandler:fireDeleteEvent(self.deleteLayerManagerEvent)
        local layerProcessorInterface = nil
        do
            local index = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
            while (function() index = index - 1 return index end)() >= 0 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            layerProcessorInterface:getLayerManager():remove(layerInterface)
            end
        end
        LayerManager.remove(self, layerInterface)
end


-- throws Exception
function AllBinaryLayerManager:process()
        local layerProcessorInterface = nil
        local size = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
        for index = 0, size - 1 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            layerProcessorInterface:process(self)
        end
end


-- throws Exception
function AllBinaryLayerManager:cleanup()
        local layerProcessorInterface = nil
        local size = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
        for index = 0, size - 1 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            layerProcessorInterface:getLayerManager():cleanup()
        end
        LayerManager.cleanup(self)
end

return AllBinaryLayerManager

