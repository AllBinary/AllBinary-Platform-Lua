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

local GroupInterfaceCompositeInterface = require("org.allbinary.game.identification.GroupInterfaceCompositeInterface")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local NamedInterface = require("org.allbinary.layer.NamedInterface")
local PositionInterface = require("org.allbinary.layer.PositionInterface")

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
local LayerInterface = {}
LayerInterface.__index = LayerInterface
LayerInterface.className = "LayerInterface"
setmetatable(LayerInterface, {__index = NamedInterface})


function LayerInterface:getHeight()
    error("abstract method getHeight")
end


function LayerInterface:getWidth()
    error("abstract method getWidth")
end


function LayerInterface:getHalfHeight()
    error("abstract method getHalfHeight")
end


function LayerInterface:getHalfWidth()
    error("abstract method getHalfWidth")
end


function LayerInterface:getXP()
    error("abstract method getXP")
end


function LayerInterface:getYP()
    error("abstract method getYP")
end


function LayerInterface:getZP()
    error("abstract method getZP")
end


function LayerInterface:getX2()
    error("abstract method getX2")
end


function LayerInterface:getY2()
    error("abstract method getY2")
end


function LayerInterface:getZ2()
    error("abstract method getZ2")
end


function LayerInterface:isVisible()
    error("abstract method isVisible")
end


function LayerInterface:moveDXYZ(dx, dy, dz)
    error("abstract method moveDXYZ")
end


function LayerInterface:setVisible(visible)
    error("abstract method setVisible")
end


function LayerInterface:implmentsTickableInterface()
    error("abstract method implmentsTickableInterface")
end


function LayerInterface:implmentsCollidableInterface()
    error("abstract method implmentsCollidableInterface")
end


function LayerInterface:implmentsGameInputInterface()
    error("abstract method implmentsGameInputInterface")
end


function LayerInterface:implmentsArtificialIntelligenceCompositeInterface()
    error("abstract method implmentsArtificialIntelligenceCompositeInterface")
end


function LayerInterface:getType()
    error("abstract method getType")
end

return LayerInterface

