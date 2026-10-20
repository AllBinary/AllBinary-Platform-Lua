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

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FrameUtil = {}
FrameUtil.__index = FrameUtil
FrameUtil.className = "FrameUtil"


function FrameUtil.getInstance()
        return FrameUtil.instance
end


function FrameUtil.new()
    local self = setmetatable({}, FrameUtil)
    return self
end


function FrameUtil:getFrameForAngle(angle, angleIncrement)
        return java_idiv(self:adjustAngleToFrameAngle(angle), angleIncrement)
end


function FrameUtil:getFrameAngle(frame, angleIncrement)
        local frameAngle = angleIncrement * frame - 90
        return self:adjustAngleToFrameAngle(frameAngle)
end


function FrameUtil:adjustAngleToFrameAngle(currentAngle)
        local angleFactory = AngleFactory.getInstance()
        if currentAngle > 359 then
            currentAngle = (currentAngle - angleFactory.TOTAL_ANGLE)
            while currentAngle > 359 do
                currentAngle = (currentAngle - angleFactory.TOTAL_ANGLE)
            end
        end
        if currentAngle < 0 then
            currentAngle = (currentAngle + angleFactory.TOTAL_ANGLE)
            while currentAngle < 0 do
                currentAngle = (currentAngle + angleFactory.TOTAL_ANGLE)
            end
        end
        return currentAngle
end

FrameUtil.instance = FrameUtil.new()

return FrameUtil

