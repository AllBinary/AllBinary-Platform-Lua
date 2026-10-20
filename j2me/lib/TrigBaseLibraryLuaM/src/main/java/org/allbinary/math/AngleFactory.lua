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
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local JsProperty = require("jsinterop.annotations.JsProperty")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AngleFactory = {}
AngleFactory.__index = AngleFactory
AngleFactory.className = "AngleFactory"

function AngleFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.TOTAL_ANGLE = 360
    self.QUARTER_TOTAL_ANGLE = 90
    self.angleArray = java_new_array(nil, self.TOTAL_ANGLE)
    self.NEGATIVE_ONE = -1
    self.NOT_ANGLE = NamedAngle.new(self.NEGATIVE_ONE, CommonStrings.getInstance().EMPTY)
    self.DOWN = nil
    self.UP = nil
    self.LEFT = nil
    self.RIGHT = nil
    self.frameUtil = FrameUtil.getInstance()
end


function AngleFactory.getInstance()
        return AngleFactory.instance
end


function AngleFactory.new()
    local self = setmetatable({}, AngleFactory)
    self:_init_fields()
        local commonPhoneStrings = CommonPhoneStrings.getInstance()
        local total = (self.angleArray.n or #self.angleArray)
        self.UP = NamedAngle.new(0, commonPhoneStrings.UP)
        self.angleArray[1] = self.UP
        for index = 1, 90 - 1 do
            self.angleArray[index + 1] = Angle.new(index)
        end
        self.RIGHT = NamedAngle.new(90, commonPhoneStrings.RIGHT)
        self.angleArray[91] = self.RIGHT
        for index = 91, 180 - 1 do
            self.angleArray[index + 1] = Angle.new(index)
        end
        self.DOWN = NamedAngle.new(180, commonPhoneStrings.DOWN)
        self.angleArray[181] = self.DOWN
        for index = 181, 270 - 1 do
            self.angleArray[index + 1] = Angle.new(index)
        end
        self.LEFT = NamedAngle.new(270, commonPhoneStrings.LEFT)
        self.angleArray[271] = self.LEFT
        for index = 271, total - 1 do
            self.angleArray[index + 1] = Angle.new(index)
        end
    return self
end


function AngleFactory:getAt(index)
        local adjustedIndex = java_int(self.frameUtil:adjustAngleToFrameAngle(index))
        return self.angleArray[adjustedIndex + 1]
end


function AngleFactory:getClosestDirection(angle)
        if (angle >= 315 and angle < 360) or (angle >= 0 and angle < 45) then
            return self.UP
        elseif angle >= 45 and angle < 135 then
            return self.RIGHT
        elseif angle >= 135 and angle < 225 then
            return self.DOWN
        elseif angle >= 225 and angle < 315 then
            return self.LEFT
        end
        error(java_exception("RuntimeException"), 0)
end


function AngleFactory:getGeneralDirection()
        return self.NOT_ANGLE
end


function AngleFactory.main(args)
        local stringMaker = StringMaker.new()
        local angleFactory = AngleFactory.getInstance()
        for index = 0, 360 - 1 do
            stringMaker:appendint(index):append(CommonSeps.getInstance().FORWARD_SLASH):appendshort(java_int(angleFactory:getClosestDirection(index):getValue())):append(CommonSeps.getInstance().NEW_LINE)
        end
        LogUtil.getInstance():putF(tostring(stringMaker), "main", "main")
end

AngleFactory.instance = AngleFactory.new()

return AngleFactory

