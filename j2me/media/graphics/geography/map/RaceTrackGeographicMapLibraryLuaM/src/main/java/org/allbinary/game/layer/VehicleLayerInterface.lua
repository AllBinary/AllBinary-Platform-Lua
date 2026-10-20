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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local LayerInterface = require("org.allbinary.layer.LayerInterface")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPositionTracking = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking")
local VehiclePropertiesCompositeInterface = require("org.allbinary.game.layer.VehiclePropertiesCompositeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local VehicleLayerInterface = {}
VehicleLayerInterface.__index = VehicleLayerInterface
VehicleLayerInterface.className = "VehicleLayerInterface"
setmetatable(VehicleLayerInterface, {__index = LayerInterface})


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

