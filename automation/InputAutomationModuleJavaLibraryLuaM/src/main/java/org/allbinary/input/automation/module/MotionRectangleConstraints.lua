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
-- package org.allbinary.input.automation.module

local MotionRectangleConstraints = {}
package.loaded["org.allbinary.input.automation.module.MotionRectangleConstraints"] = MotionRectangleConstraints

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

-- local Dimension = require("java.awt.Dimension")
-- local Rectangle = require("java.awt.Rectangle")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local MotionRectangleConstraintsInterface = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface")

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

-- class table MotionRectangleConstraints is declared before the requires
MotionRectangleConstraints.__index = MotionRectangleConstraints
MotionRectangleConstraints.className = "MotionRectangleConstraints"
MotionRectangleConstraints.javaClassName = "org.allbinary.input.automation.module.MotionRectangleConstraints"
MotionRectangleConstraints.java_implements = " MotionRectangleConstraintsInterface "
MotionRectangleConstraints.java_interfaces = function() return {MotionRectangleConstraintsInterface} end

function MotionRectangleConstraints:_init_fields()
    if self.minDimension == nil then self.minDimension = nil end
    if self.maxDimension == nil then self.maxDimension = nil end
    if self.maxMotionRectangles == nil then self.maxMotionRectangles = 0 end
    if self.minArea == nil then self.minArea = 0 end
end


function MotionRectangleConstraints._jinit(self)
    MotionRectangleConstraints._init_fields(self)
    return self
end

function MotionRectangleConstraints.new(...)
    local self = setmetatable({}, MotionRectangleConstraints)
    MotionRectangleConstraints._jinit(self, ...)
    return self
end


function MotionRectangleConstraints:getMinDimension()
        return self.minDimension
end


function MotionRectangleConstraints:getMaxDimension()
        return self.maxDimension
end


function MotionRectangleConstraints:isTooSmall(rectangle)
        if rectangle.width < self:getMinDimension().width or rectangle.height < self:getMinDimension().height then
            return true
        else
            return false
        end
end


function MotionRectangleConstraints:isAreaTooSmall(rectangle)
        if rectangle.width * rectangle.height < self:getMinArea() then
            return true
        else
            return false
        end
end


function MotionRectangleConstraints:isTooBig(rectangle)
        if rectangle.width > self:getMaxDimension().width or rectangle.height > self:getMaxDimension().height then
            return true
        else
            return false
        end
end


-- throws Exception
function MotionRectangleConstraints:isValid(frame, bufferedImage, rectangle)
        error(require("java.lang.RuntimeException").new(), 0)
end


function MotionRectangleConstraints:setMinDimension(minDimension)
        self.minDimension = minDimension
end


function MotionRectangleConstraints:setMaxDimension(maxDimension)
        self.maxDimension = maxDimension
end


function MotionRectangleConstraints:getMaxMotionRectangles()
        return self.maxMotionRectangles
end


function MotionRectangleConstraints:setMaxMotionRectangles(maxMotionRectangles)
        self.maxMotionRectangles = maxMotionRectangles
end


function MotionRectangleConstraints:getMinArea()
        return self.minArea
end


function MotionRectangleConstraints:setMinArea(minArea)
        self.minArea = minArea
end

return MotionRectangleConstraints

