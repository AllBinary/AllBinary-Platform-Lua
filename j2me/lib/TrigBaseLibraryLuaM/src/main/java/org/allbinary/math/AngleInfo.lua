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

local AngleInfo = {}
package.loaded["org.allbinary.math.AngleInfo"] = AngleInfo

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
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local AngleIncrementInfo = java_lazy("org.allbinary.math.AngleIncrementInfo")
local AngleIncrementInfoFactory = java_lazy("org.allbinary.math.AngleIncrementInfoFactory")
local FrameUtil = java_lazy("org.allbinary.math.FrameUtil")

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

-- class table AngleInfo is declared before the requires
AngleInfo.__index = AngleInfo
AngleInfo.className = "AngleInfo"
AngleInfo.javaClassName = "org.allbinary.math.AngleInfo"

function AngleInfo:_init_fields()
    if self.angleIncrementInfo == nil then self.angleIncrementInfo = nil end
    self.angle = 0
    self.frameUtil = FrameUtil.getInstance()
end


function AngleInfo.getInstance(angleIncrement)
        return AngleInfo.new(AngleIncrementInfoFactory.getInstance():getAt(angleIncrement))
end


function AngleInfo._jinit(self, angleIncrementInfo)
    AngleInfo._init_fields(self)
        self.angleIncrementInfo = angleIncrementInfo
    return self
end

function AngleInfo.new(...)
    local self = setmetatable({}, AngleInfo)
    AngleInfo._jinit(self, ...)
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

