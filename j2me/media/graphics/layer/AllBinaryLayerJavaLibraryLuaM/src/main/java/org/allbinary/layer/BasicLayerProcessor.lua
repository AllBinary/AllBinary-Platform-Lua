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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local BasicLayerProcessor = {}
BasicLayerProcessor.__index = BasicLayerProcessor
BasicLayerProcessor.className = "BasicLayerProcessor"

function BasicLayerProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListD.new()
end


function BasicLayerProcessor.new()
    local self = setmetatable({}, BasicLayerProcessor)
    self:_init_fields()
    return self
end


function BasicLayerProcessor:add(layerInterface)
        if not self.list:contains(layerInterface) then
            self.list:add(layerInterface)
        end
end


-- throws Exception
function BasicLayerProcessor:process(allBinaryLayerManager)
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end


function BasicLayerProcessor:getList()
        return self.list
end

BasicLayerProcessor.NULL_LAYER_PROCESSOR = BasicLayerProcessor.new()

return BasicLayerProcessor

