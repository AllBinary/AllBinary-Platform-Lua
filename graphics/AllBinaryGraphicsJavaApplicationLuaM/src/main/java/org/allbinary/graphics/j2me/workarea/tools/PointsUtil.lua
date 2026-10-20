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
-- package org.allbinary.graphics.j2me.workarea.tools

local VectorRotationGenerator = require("org.allbinary.animation.VectorRotationGenerator")
local GPoint = require("org.allbinary.graphics.GPoint")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PointsUtil = {}
PointsUtil.__index = PointsUtil
PointsUtil.className = "PointsUtil"

function PointsUtil.new()
    local self = setmetatable({}, PointsUtil)
    return self
end


function PointsUtil.getInstance()
        return PointsUtil.instance
end


-- throws Exception
function PointsUtil:doTransforms(pointVector, angle, fulcrumPoint)
        return VectorRotationGenerator.getInstance():getListAtAngle(fulcrumPoint:getX(), fulcrumPoint:getY(), pointVector, AngleFactory.getInstance():getAt(math.tointeger(angle // 1)))
end

PointsUtil.instance = PointsUtil.new()

return PointsUtil

