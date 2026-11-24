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

local LayerProcessor = {}
package.loaded["org.allbinary.layer.LayerProcessor"] = LayerProcessor

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LayerProcessorInterface = require("org.allbinary.layer.LayerProcessorInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local LayerManager = java_lazy("org.allbinary.layer.LayerManager")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table LayerProcessor is declared before the requires
LayerProcessor.__index = LayerProcessor
LayerProcessor.className = "LayerProcessor"
LayerProcessor.javaClassName = "org.allbinary.layer.LayerProcessor"
LayerProcessor.java_implements = " LayerProcessorInterface "
LayerProcessor.java_interfaces = function() return {LayerProcessorInterface} end

function LayerProcessor:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    if self.layerManager == nil then self.layerManager = nil end
end


function LayerProcessor._jinit(self, layerManager)
    LayerProcessor._init_fields(self)
        self.layerManager = layerManager
    return self
end

function LayerProcessor.new(...)
    local self = setmetatable({}, LayerProcessor)
    LayerProcessor._jinit(self, ...)
    return self
end


-- throws Exception
function LayerProcessor:processAt(allBinaryLayerManager, layerInterface, index)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function LayerProcessor:isProcessorLayer(layerInterface)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
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

