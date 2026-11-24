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

local AngleIncrementInfo = {}
package.loaded["org.allbinary.math.AngleIncrementInfo"] = AngleIncrementInfo

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
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
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

-- class table AngleIncrementInfo is declared before the requires
AngleIncrementInfo.__index = AngleIncrementInfo
AngleIncrementInfo.className = "AngleIncrementInfo"
AngleIncrementInfo.javaClassName = "org.allbinary.math.AngleIncrementInfo"

function AngleIncrementInfo:_init_fields()
    if self.angleIncrement == nil then self.angleIncrement = nil end
    if self.DOWN_FRAME == nil then self.DOWN_FRAME = nil end
    if self.UP_FRAME == nil then self.UP_FRAME = nil end
    if self.LEFT_FRAME == nil then self.LEFT_FRAME = nil end
    if self.RIGHT_FRAME == nil then self.RIGHT_FRAME = nil end
    self.frameUtil = FrameUtil.getInstance()
end


function AngleIncrementInfo._jinit(self, angleIncrement)
    AngleIncrementInfo._init_fields(self)
        self.angleIncrement = angleIncrement
        local angleFactory = AngleFactory.getInstance()
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        self.DOWN_FRAME = smallIntegerSingletonFactory:getAt(angleFactory.DOWN:getValue() / self.angleIncrement)
        self.UP_FRAME = smallIntegerSingletonFactory:getAt(java_int(angleFactory.UP:getValue()))
        self.LEFT_FRAME = smallIntegerSingletonFactory:getAt(angleFactory.LEFT:getValue() / self.angleIncrement)
        self.RIGHT_FRAME = smallIntegerSingletonFactory:getAt(angleFactory.RIGHT:getValue() / self.angleIncrement)
    return self
end

function AngleIncrementInfo.new(...)
    local self = setmetatable({}, AngleIncrementInfo)
    AngleIncrementInfo._jinit(self, ...)
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

