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
-- package org.allbinary.graphics

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PointFactory = {}
PointFactory.__index = PointFactory
PointFactory.className = "PointFactory"

function PointFactory:_init_fields()
    self.ZERO_ZERO = self:createXYZ(0, 0, 0)
end


function PointFactory.getInstance()
        return PointFactory.instance
end


function PointFactory:init()
end


function PointFactory.new()
    local self = setmetatable({}, PointFactory)
    self:_init_fields()
    return self
end


function PointFactory:createXY(x, y)
        return GPoint.new(x, y, 0)
end


function PointFactory:createXYZ(x, y, z)
        return GPoint.new(x, y, z)
end

PointFactory.instance = PointFactory.new()

return PointFactory

