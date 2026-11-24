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
-- package org.allbinary.media.image.comparison.motion

local MotionRectangle = {}
package.loaded["org.allbinary.media.image.comparison.motion.MotionRectangle"] = MotionRectangle

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

-- local Rectangle = require("java.awt.Rectangle")
local Vector = java_lazy("java.util.Vector")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- java.lang.Cloneable has no Lua module
local Cloneable = {}

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

-- class table MotionRectangle is declared before the requires
MotionRectangle.__index = MotionRectangle
MotionRectangle.className = "MotionRectangle"
MotionRectangle.javaClassName = "org.allbinary.media.image.comparison.motion.MotionRectangle"
MotionRectangle.java_implements = " Cloneable "
MotionRectangle.java_interfaces = function() return {Cloneable} end

function MotionRectangle:_init_fields()
    if self.rectangle == nil then self.rectangle = nil end
    if self.pixelDeltaVector == nil then self.pixelDeltaVector = nil end
end


function MotionRectangle._jinit(self, rectangle)
    MotionRectangle._init_fields(self)
        self:setRectangle(rectangle)
        self:setPixelDeltaVector(BasicArrayListD.new())
    return self
end

function MotionRectangle.new(...)
    local self = setmetatable({}, MotionRectangle)
    MotionRectangle._jinit(self, ...)
    return self
end


function MotionRectangle:getRectangle()
        return self.rectangle
end


function MotionRectangle:setRectangle(rectangle)
        self.rectangle = rectangle
end


function MotionRectangle:getPixelDeltaVector()
        return self.pixelDeltaVector
end


function MotionRectangle:setPixelDeltaVector(pixelDeltaVector)
        self.pixelDeltaVector = pixelDeltaVector
end


function MotionRectangle:clone()
        local motionRectangle = MotionRectangle.new(self:getRectangle():clone())
        motionRectangle:setPixelDeltaVector(self:getPixelDeltaVector():clone())
        return motionRectangle
end

return MotionRectangle

