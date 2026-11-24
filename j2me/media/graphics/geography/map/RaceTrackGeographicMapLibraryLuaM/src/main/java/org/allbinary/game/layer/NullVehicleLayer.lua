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

local NullVehicleLayer = {}
package.loaded["org.allbinary.game.layer.NullVehicleLayer"] = NullVehicleLayer

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RotationAnimation = java_lazy("org.allbinary.animation.RotationAnimation")
local Group = java_lazy("org.allbinary.game.identification.Group")
local BasicDecimal = java_lazy("org.allbinary.logic.math.BasicDecimal")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPositionTracking = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local VehicleLayerInterface = require("org.allbinary.game.layer.VehicleLayerInterface")
local VehicleProperties = java_lazy("org.allbinary.game.layer.VehicleProperties")

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

-- class table NullVehicleLayer is declared before the requires
NullVehicleLayer.__index = NullVehicleLayer
NullVehicleLayer.className = "NullVehicleLayer"
NullVehicleLayer.javaClassName = "org.allbinary.game.layer.NullVehicleLayer"
NullVehicleLayer.java_implements = " VehicleLayerInterface "
NullVehicleLayer.java_interfaces = function() return {VehicleLayerInterface} end

function NullVehicleLayer._jinit(self)
    return self
end

function NullVehicleLayer.new()
    return NullVehicleLayer._jinit(setmetatable({}, NullVehicleLayer))
end


function NullVehicleLayer:getName()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getGroupInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:setPosition(x, y, z)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getHeight()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getWidth()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getHalfHeight()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getHalfWidth()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getXP()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getYP()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getZP()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getX2()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getY2()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getZ2()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:isVisible()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:moveDXYZ(dx, dy, dz)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:setVisible(visible)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:implmentsTickableInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:implmentsCollidableInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:implmentsGameInputInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:implmentsArtificialIntelligenceCompositeInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getType()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getVehicleProperties()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getGameKeyEventList()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getSpeedBasicDecimal()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:isReadyForExplosion()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getRotationAnimationInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:setRotationAnimationInterface(animationInterface)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:isDestroyed()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:isFinish()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getFinalPosition()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullVehicleLayer:handleFinish()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getGeographicMapCellPositionTracking()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:getGeographicMapCellHistoryArray()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:setGeographicMapCellHistoryArray(geographicMapCellHistory)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullVehicleLayer:paint(graphics)
end


function NullVehicleLayer:paintThreed(graphics)
end

NullVehicleLayer.NULL_VEHICLE_LAYER = NullVehicleLayer.new()

return NullVehicleLayer

