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
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local AngleInfo = {}
AngleInfo.__index = AngleInfo
AngleInfo.className = "AngleInfo"

function AngleInfo:_init_fields()
    self.angleIncrementInfo = nil
    self.angle = 0
    self.frameUtil = FrameUtil.getInstance()
end


function AngleInfo.getInstance(angleIncrement)
        return AngleInfo.new(AngleIncrementInfoFactory.getInstance():getAt(angleIncrement))
end


function AngleInfo.new(angleIncrementInfo)
    local self = setmetatable({}, AngleInfo)
    self:_init_fields()
        self.angleIncrementInfo = angleIncrementInfo
    return self
end


function AngleInfo:adjustAngle(frame)
        local newAngle = self.angleIncrementInfo:getAngleIncrement() * frame - 90
        self:setAngle(java_int(self.frameUtil:adjustAngleToFrameAngle(newAngle)))
end


function AngleInfo:getAngle()
        return self.angle
end


function AngleInfo:setAngle(angle)
        self.angle = angle
end


function AngleInfo:getAngleIncrementInfo()
        return self.angleIncrementInfo
end


function AngleInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(AngleInfo.ANGLE)
        stringBuffer:appendshort(self.angle)
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(StringUtil.getInstance():toString(self:getAngleIncrementInfo()))
        return tostring(stringBuffer)
end
AngleInfo.__tostring = function(self) return self:toString() end

AngleInfo.ANGLE = "Angle: "

return AngleInfo

