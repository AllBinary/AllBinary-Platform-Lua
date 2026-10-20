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
-- package org.allbinary.input.automation

-- local awt = require("java.awt")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PointHelper = {}
PointHelper.__index = PointHelper
PointHelper.className = "PointHelper"


function PointHelper.new()
    local self = setmetatable({}, PointHelper)
    return self
end


function PointHelper.getCenterPoint(rectangle)
        local x = rectangle:getX() + rectangle:getWidth() / PointHelper.two
        local y = rectangle:getY() + rectangle:getHeight() / PointHelper.two
        return PointFactory.getInstance(java_int(x), java_int(y))
end

PointHelper.two = 2.0

return PointHelper

