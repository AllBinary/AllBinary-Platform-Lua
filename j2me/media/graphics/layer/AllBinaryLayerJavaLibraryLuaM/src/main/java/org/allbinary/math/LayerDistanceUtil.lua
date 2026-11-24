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

local LayerDistanceUtil = {}
package.loaded["org.allbinary.math.LayerDistanceUtil"] = LayerDistanceUtil

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

local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")

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

-- class table LayerDistanceUtil is declared before the requires
LayerDistanceUtil.__index = LayerDistanceUtil
LayerDistanceUtil.className = "LayerDistanceUtil"
LayerDistanceUtil.javaClassName = "org.allbinary.math.LayerDistanceUtil"

function LayerDistanceUtil:_init_fields()
    self.mathUtil = MathUtil.getInstance()
end

function LayerDistanceUtil._jinit(self)
    LayerDistanceUtil._init_fields(self)
    return self
end

function LayerDistanceUtil.new()
    return LayerDistanceUtil._jinit(setmetatable({}, LayerDistanceUtil))
end


function LayerDistanceUtil.getInstance()
        return LayerDistanceUtil.instance_f
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

LayerDistanceUtil.instance_f = LayerDistanceUtil.new()

return LayerDistanceUtil

