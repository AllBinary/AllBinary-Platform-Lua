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
-- package org.allbinary.logic.control.contraints.size

local Node = require("org.w3c.dom.Node")
local TwoDimensionalConstraintInterface = require("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TwoDimensionalConstraint = {}
TwoDimensionalConstraint.__index = TwoDimensionalConstraint
TwoDimensionalConstraint.className = "TwoDimensionalConstraint"

function TwoDimensionalConstraint:_init_fields()
    self.widthSizeConstraintInterface = nil
    self.heightSizeConstraintInterface = nil
end


function TwoDimensionalConstraint.new(node)
    local self = setmetatable({}, TwoDimensionalConstraint)
    self:_init_fields()
    return self
end


function TwoDimensionalConstraint:getHeight()
        return self.heightSizeConstraintInterface
end


function TwoDimensionalConstraint:getWidth()
        return self.widthSizeConstraintInterface
end


function TwoDimensionalConstraint:setHeight(heightSizeConstraintInterface)
        self.heightSizeConstraintInterface = heightSizeConstraintInterface
end


function TwoDimensionalConstraint:setWidth(widthSizeConstraintInterface)
        self.widthSizeConstraintInterface = widthSizeConstraintInterface
end

return TwoDimensionalConstraint

