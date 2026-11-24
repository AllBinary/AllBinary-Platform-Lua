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

local AngleFactory = {}
package.loaded["org.allbinary.math.AngleFactory"] = AngleFactory

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local Angle = java_lazy("org.allbinary.math.Angle")
local FrameUtil = java_lazy("org.allbinary.math.FrameUtil")
local NamedAngle = java_lazy("org.allbinary.math.NamedAngle")

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

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table AngleFactory is declared before the requires
AngleFactory.__index = AngleFactory
AngleFactory.className = "AngleFactory"
AngleFactory.javaClassName = "org.allbinary.math.AngleFactory"

function AngleFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.TOTAL_ANGLE = 360
    self.QUARTER_TOTAL_ANGLE = 90
    self.angleArray = java_new_array(nil, self.TOTAL_ANGLE)
    self.NEGATIVE_ONE = -1
    self.NOT_ANGLE = NamedAngle.new(self.NEGATIVE_ONE, CommonStrings.getInstance().EMPTY)
    if self.DOWN == nil then self.DOWN = nil end
    if self.UP == nil then self.UP = nil end
    if self.LEFT == nil then self.LEFT = nil end
    if self.RIGHT == nil then self.RIGHT = nil end
    self.frameUtil = FrameUtil.getInstance()
end


function AngleFactory.getInstance()
        return AngleFactory.instance_f
end


function AngleFactory._jinit(self)
    AngleFactory._init_fields(self)
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

function AngleFactory.new(...)
    local self = setmetatable({}, AngleFactory)
    AngleFactory._jinit(self, ...)
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
        error(require("java.lang.RuntimeException").new(), 0)
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

AngleFactory.instance_f = AngleFactory.new()

return AngleFactory

