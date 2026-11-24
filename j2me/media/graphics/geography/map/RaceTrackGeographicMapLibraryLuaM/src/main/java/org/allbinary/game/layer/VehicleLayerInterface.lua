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
-- package org.allbinary.game.layer

local VehicleLayerInterface = {}
package.loaded["org.allbinary.game.layer.VehicleLayerInterface"] = VehicleLayerInterface

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local RotationAnimation = java_lazy("org.allbinary.animation.RotationAnimation")
local LayerInterface = require("org.allbinary.layer.LayerInterface")
local BasicDecimal = java_lazy("org.allbinary.logic.math.BasicDecimal")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPositionTracking = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking")
local VehiclePropertiesCompositeInterface = require("org.allbinary.game.layer.VehiclePropertiesCompositeInterface")

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

-- Java interface
-- class table VehicleLayerInterface is declared before the requires
VehicleLayerInterface.__index = VehicleLayerInterface
VehicleLayerInterface.className = "VehicleLayerInterface"
VehicleLayerInterface.javaClassName = "org.allbinary.game.layer.VehicleLayerInterface"
setmetatable(VehicleLayerInterface, {__index = LayerInterface})
VehicleLayerInterface.java_interfaces = function() return {LayerInterface, VehiclePropertiesCompositeInterface} end


function VehicleLayerInterface:getGameKeyEventList()
    error("abstract method getGameKeyEventList")
end


function VehicleLayerInterface:getSpeedBasicDecimal()
    error("abstract method getSpeedBasicDecimal")
end


function VehicleLayerInterface:isReadyForExplosion()
    error("abstract method isReadyForExplosion")
end


function VehicleLayerInterface:getRotationAnimationInterface()
    error("abstract method getRotationAnimationInterface")
end


function VehicleLayerInterface:setRotationAnimationInterface(animationInterface)
    error("abstract method setRotationAnimationInterface")
end


function VehicleLayerInterface:isDestroyed()
    error("abstract method isDestroyed")
end


function VehicleLayerInterface:isFinish()
    error("abstract method isFinish")
end


function VehicleLayerInterface:getFinalPosition()
    error("abstract method getFinalPosition")
end


-- throws Exception
function VehicleLayerInterface:handleFinish()
    error("abstract method handleFinish")
end


function VehicleLayerInterface:getGeographicMapCellPositionTracking()
    error("abstract method getGeographicMapCellPositionTracking")
end


function VehicleLayerInterface:getGeographicMapCellHistoryArray()
    error("abstract method getGeographicMapCellHistoryArray")
end


function VehicleLayerInterface:setGeographicMapCellHistoryArray(geographicMapCellHistory)
    error("abstract method setGeographicMapCellHistoryArray")
end

return VehicleLayerInterface

