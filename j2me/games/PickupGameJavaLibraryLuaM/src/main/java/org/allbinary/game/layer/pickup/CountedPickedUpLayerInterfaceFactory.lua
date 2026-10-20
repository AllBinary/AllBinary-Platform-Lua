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
-- package org.allbinary.game.layer.pickup

local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local PickedUpLayerInterfaceFactory = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactory")
local CountedPickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryInterface")

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

local CountedPickedUpLayerInterfaceFactory = {}
CountedPickedUpLayerInterfaceFactory.__index = CountedPickedUpLayerInterfaceFactory
CountedPickedUpLayerInterfaceFactory.className = "CountedPickedUpLayerInterfaceFactory"
setmetatable(CountedPickedUpLayerInterfaceFactory, {__index = PickedUpLayerInterfaceFactory})

function CountedPickedUpLayerInterfaceFactory:_init_fields()
    self.id = nil
end


function CountedPickedUpLayerInterfaceFactory.new(pickeUpLayerType, iconLayer, animationInterface)
    local self = setmetatable(PickedUpLayerInterfaceFactory.new(pickeUpLayerType, iconLayer, animationInterface), CountedPickedUpLayerInterfaceFactory)
    self:_init_fields()
        -- super(...) made self above
        local list = CountedPickedUpLayerInterfaceFactoryPool.getInstance():getList()
        self.id = list:size()
        list:add(self)
    return self
end


-- throws Exception
function CountedPickedUpLayerInterfaceFactory:getNextInstance(hashtable, x, y, z)
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end


function CountedPickedUpLayerInterfaceFactory:getTotal()
        return -1
end


function CountedPickedUpLayerInterfaceFactory:getId()
        return self.id
end

CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY = CountedPickedUpLayerInterfaceFactory.new(PickedUpLayerTypeFactory.getInstance().NONE, IconLayer.NULL_ICON_LAYER, NullAnimationFactory.getFactoryInstance():getInstance(0))

return CountedPickedUpLayerInterfaceFactory

