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

local MotionRectangleConstraintsInterface = {}
package.loaded["org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface"] = MotionRectangleConstraintsInterface

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

-- Java interface
-- class table MotionRectangleConstraintsInterface is declared before the requires
MotionRectangleConstraintsInterface.__index = MotionRectangleConstraintsInterface
MotionRectangleConstraintsInterface.className = "MotionRectangleConstraintsInterface"
MotionRectangleConstraintsInterface.javaClassName = "org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface"


function MotionRectangleConstraintsInterface:getMaxMotionRectangles()
    error("abstract method getMaxMotionRectangles")
end


function MotionRectangleConstraintsInterface:getMinDimension()
    error("abstract method getMinDimension")
end


function MotionRectangleConstraintsInterface:getMinArea()
    error("abstract method getMinArea")
end


function MotionRectangleConstraintsInterface:getMaxDimension()
    error("abstract method getMaxDimension")
end


function MotionRectangleConstraintsInterface:isTooSmall(rectangle)
    error("abstract method isTooSmall")
end


function MotionRectangleConstraintsInterface:isAreaTooSmall(rectangle)
    error("abstract method isAreaTooSmall")
end


function MotionRectangleConstraintsInterface:isTooBig(rectangle)
    error("abstract method isTooBig")
end


-- throws Exception
function MotionRectangleConstraintsInterface:isValid(frame, bufferedImage, rectangle)
    error("abstract method isValid")
end

return MotionRectangleConstraintsInterface

