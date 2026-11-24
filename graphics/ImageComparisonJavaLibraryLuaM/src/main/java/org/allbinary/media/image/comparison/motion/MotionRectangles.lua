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

local MotionRectangles = {}
package.loaded["org.allbinary.media.image.comparison.motion.MotionRectangles"] = MotionRectangles

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")

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

-- class table MotionRectangles is declared before the requires
MotionRectangles.__index = MotionRectangles
MotionRectangles.className = "MotionRectangles"
MotionRectangles.javaClassName = "org.allbinary.media.image.comparison.motion.MotionRectangles"

function MotionRectangles:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.rectangleVector == nil then self.rectangleVector = nil end
    if self.imageComparisonResult == nil then self.imageComparisonResult = nil end
    self.MAX_PIXEL_DISTANCE_THRESHOLD = 2
end


function MotionRectangles._jinit(self, name, imageComparisonResult)
    MotionRectangles._init_fields(self)
        self.name_f = name
        self:setImageComparisonResult(imageComparisonResult)
        self:setVector(BasicArrayListD.new())
    return self
end

function MotionRectangles.new(...)
    local self = setmetatable({}, MotionRectangles)
    MotionRectangles._jinit(self, ...)
    return self
end


function MotionRectangles:getVector()
        return self.rectangleVector
end


function MotionRectangles:setVector(rectangleVector)
        self.rectangleVector = rectangleVector
end


function MotionRectangles:getName()
        return self.name_f
end


function MotionRectangles:getImageComparisonResult()
        return self.imageComparisonResult
end


function MotionRectangles:setImageComparisonResult(imageComparisonResult)
        self.imageComparisonResult = imageComparisonResult
end

return MotionRectangles

