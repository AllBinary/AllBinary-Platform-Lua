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
-- package org.allbinary.math

local GPoint = require("org.allbinary.graphics.GPoint")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local MathUtil = require("org.allbinary.logic.math.MathUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerDistanceUtil = {}
LayerDistanceUtil.__index = LayerDistanceUtil
LayerDistanceUtil.className = "LayerDistanceUtil"

function LayerDistanceUtil:_init_fields()
    self.mathUtil = MathUtil.getInstance()
end

function LayerDistanceUtil.new()
    local self = setmetatable({}, LayerDistanceUtil)
    self:_init_fields()
    return self
end


function LayerDistanceUtil.getInstance()
        return LayerDistanceUtil.instance
end


function LayerDistanceUtil:getDistance(layerInterface, layerInterface2)
        local dx = (layerInterface:getXP() + layerInterface:getHalfWidth()) - (layerInterface2:getXP() + layerInterface2:getHalfWidth())
        local dy = (layerInterface:getYP() + layerInterface:getHalfHeight()) - (layerInterface2:getYP() + layerInterface2:getHalfHeight())
        return java_int(self.mathUtil:sqrt((dx * dx) + (dy * dy)))
end


function LayerDistanceUtil:getDistance3D(layerInterface, layerInterface2)
        local dx = (layerInterface:getXP() + layerInterface:getHalfWidth()) - (layerInterface2:getXP() + layerInterface2:getHalfWidth())
        local dy = (layerInterface:getYP() + layerInterface:getHalfHeight()) - (layerInterface2:getYP() + layerInterface2:getHalfHeight())
        local dz = (layerInterface:getZP() + layerInterface:getHalfDepth()) - (layerInterface2:getZP() + layerInterface2:getHalfDepth())
        return java_int(self.mathUtil:sqrt((dx * dx) + (dy * dy) + (dz * dz)))
end


function LayerDistanceUtil:getDistanceAt(layerInterface, point)
        local dx = layerInterface:getXP() - point:getX()
        local dy = layerInterface:getYP() - point:getY()
        return java_int(self.mathUtil:sqrt((dx * dx) + (dy * dy)))
end

LayerDistanceUtil.instance = LayerDistanceUtil.new()

return LayerDistanceUtil

