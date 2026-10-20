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
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local JsProperty = require("jsinterop.annotations.JsProperty")
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

local AngleIncrementInfo = {}
AngleIncrementInfo.__index = AngleIncrementInfo
AngleIncrementInfo.className = "AngleIncrementInfo"

function AngleIncrementInfo:_init_fields()
    self.angleIncrement = nil
    self.DOWN_FRAME = nil
    self.UP_FRAME = nil
    self.LEFT_FRAME = nil
    self.RIGHT_FRAME = nil
    self.frameUtil = FrameUtil.getInstance()
end


function AngleIncrementInfo.new(angleIncrement)
    local self = setmetatable({}, AngleIncrementInfo)
    self:_init_fields()
        self.angleIncrement = angleIncrement
        local angleFactory = AngleFactory.getInstance()
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        self.DOWN_FRAME = smallIntegerSingletonFactory:getAt(angleFactory.DOWN:getValue() / self.angleIncrement)
        self.UP_FRAME = smallIntegerSingletonFactory:getAt(java_int(angleFactory.UP:getValue()))
        self.LEFT_FRAME = smallIntegerSingletonFactory:getAt(angleFactory.LEFT:getValue() / self.angleIncrement)
        self.RIGHT_FRAME = smallIntegerSingletonFactory:getAt(angleFactory.RIGHT:getValue() / self.angleIncrement)
    return self
end


function AngleIncrementInfo:getFrameAngle(frame)
        return self.frameUtil:getFrameAngle(frame, self.angleIncrement)
end


function AngleIncrementInfo:getAngleIncrement()
        return self.angleIncrement
end


function AngleIncrementInfo:toString()
        return tostring(StringMaker.new():append(AngleIncrementInfo.INCREMENT):appendshort(self.angleIncrement))
end
AngleIncrementInfo.__tostring = function(self) return self:toString() end


function AngleIncrementInfo:getClosestGeneralDirection(angle)
        local closestDirection = SmallIntegerSingletonFactory.getInstance():getAt(360)
        if math.tointeger(self.UP_FRAME // 1) - angle < math.tointeger(closestDirection // 1) - angle then
            closestDirection = self.UP_FRAME
        end
        if math.tointeger(self.DOWN_FRAME // 1) - angle < math.tointeger(closestDirection // 1) - angle then
            closestDirection = self.DOWN_FRAME
        end
        if math.tointeger(self.LEFT_FRAME // 1) - angle < math.tointeger(closestDirection // 1) - angle then
            closestDirection = self.LEFT_FRAME
        end
        if math.tointeger(self.RIGHT_FRAME // 1) - angle < math.tointeger(closestDirection // 1) - angle then
            closestDirection = self.RIGHT_FRAME
        end
        return math.tointeger(closestDirection // 1)
end

AngleIncrementInfo.INCREMENT = "Inc: "

return AngleIncrementInfo

