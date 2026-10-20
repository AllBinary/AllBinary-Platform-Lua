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

local CommonStrings = require("org.allbinary.string.CommonStrings")
local LayerProcessorInterface = require("org.allbinary.layer.LayerProcessorInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local LayerProcessor = {}
LayerProcessor.__index = LayerProcessor
LayerProcessor.className = "LayerProcessor"

function LayerProcessor:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.layerManager = nil
end


function LayerProcessor.new(layerManager)
    local self = setmetatable({}, LayerProcessor)
    self:_init_fields()
        self.layerManager = layerManager
    return self
end


-- throws Exception
function LayerProcessor:processAt(allBinaryLayerManager, layerInterface, index)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function LayerProcessor:isProcessorLayer(layerInterface)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function LayerProcessor:getLayerManager()
        return self.layerManager
end


-- throws Exception
function LayerProcessor:process(allBinaryLayerManager)
        local layerManager = self:getLayerManager()
        local size = layerManager:getSize()
        for index = 0, size - 1 do
            self:processAt(allBinaryLayerManager, layerManager:getLayerAt(index), index)
        end
end

return LayerProcessor

