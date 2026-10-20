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
-- package org.allbinary.game.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local Group = require("org.allbinary.game.identification.Group")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPositionTracking = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local VehicleLayerInterface = require("org.allbinary.game.layer.VehicleLayerInterface")

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

local NullVehicleLayer = {}
NullVehicleLayer.__index = NullVehicleLayer
NullVehicleLayer.className = "NullVehicleLayer"

function NullVehicleLayer.new()
    local self = setmetatable({}, NullVehicleLayer)
    return self
end


function NullVehicleLayer:getName()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getGroupInterface()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:setPosition(x, y, z)
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getHeight()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getWidth()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getHalfHeight()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getHalfWidth()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getXP()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getYP()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getZP()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getX2()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getY2()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getZ2()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:isVisible()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:moveDXYZ(dx, dy, dz)
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:setVisible(visible)
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:implmentsTickableInterface()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:implmentsCollidableInterface()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:implmentsGameInputInterface()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:implmentsArtificialIntelligenceCompositeInterface()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getType()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getVehicleProperties()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getGameKeyEventList()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getSpeedBasicDecimal()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:isReadyForExplosion()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getRotationAnimationInterface()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:setRotationAnimationInterface(animationInterface)
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:isDestroyed()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:isFinish()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getFinalPosition()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullVehicleLayer:handleFinish()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getGeographicMapCellPositionTracking()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:getGeographicMapCellHistoryArray()
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:setGeographicMapCellHistoryArray(geographicMapCellHistory)
        error(java_exception("RuntimeException"), 0)
end


function NullVehicleLayer:paint(graphics)
end


function NullVehicleLayer:paintThreed(graphics)
end

NullVehicleLayer.NULL_VEHICLE_LAYER = NullVehicleLayer.new()

return NullVehicleLayer

