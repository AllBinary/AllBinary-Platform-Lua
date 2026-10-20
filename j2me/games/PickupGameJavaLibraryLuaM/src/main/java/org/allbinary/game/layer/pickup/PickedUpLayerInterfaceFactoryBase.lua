-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.layer.pickup

local Animation = require("org.allbinary.animation.Animation")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local PickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")

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

local PickedUpLayerInterfaceFactoryBase = {}
PickedUpLayerInterfaceFactoryBase.__index = PickedUpLayerInterfaceFactoryBase
PickedUpLayerInterfaceFactoryBase.className = "PickedUpLayerInterfaceFactoryBase"

function PickedUpLayerInterfaceFactoryBase.new()
    local self = setmetatable({}, PickedUpLayerInterfaceFactoryBase)
    return self
end


function PickedUpLayerInterfaceFactoryBase:getIconLayer()
        error(java_exception("RuntimeException"), 0)
end


function PickedUpLayerInterfaceFactoryBase:getAnimationInterface()
        error(java_exception("RuntimeException"), 0)
end


function PickedUpLayerInterfaceFactoryBase:getPickedUpLayerType()
        error(java_exception("RuntimeException"), 0)
end

PickedUpLayerInterfaceFactoryBase.NULL_PICKED_UP_LAYER_FACTORY_BASE = PickedUpLayerInterfaceFactoryBase.new()

return PickedUpLayerInterfaceFactoryBase

