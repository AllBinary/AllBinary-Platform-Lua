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
-- package org.allbinary.media.image.analysis

local ColorRangeInterface = {}
package.loaded["org.allbinary.media.image.analysis.ColorRangeInterface"] = ColorRangeInterface

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

-- local Color = require("java.awt.Color")

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
-- class table ColorRangeInterface is declared before the requires
ColorRangeInterface.__index = ColorRangeInterface
ColorRangeInterface.className = "ColorRangeInterface"
ColorRangeInterface.javaClassName = "org.allbinary.media.image.analysis.ColorRangeInterface"


function ColorRangeInterface:getMinRed()
    error("abstract method getMinRed")
end


function ColorRangeInterface:setMinRed(minRed)
    error("abstract method setMinRed")
end


function ColorRangeInterface:getMaxRed()
    error("abstract method getMaxRed")
end


function ColorRangeInterface:setMaxRed(maxRed)
    error("abstract method setMaxRed")
end


function ColorRangeInterface:getMinGreen()
    error("abstract method getMinGreen")
end


function ColorRangeInterface:setMinGreen(minGreen)
    error("abstract method setMinGreen")
end


function ColorRangeInterface:getMaxGreen()
    error("abstract method getMaxGreen")
end


function ColorRangeInterface:setMaxGreen(maxGreen)
    error("abstract method setMaxGreen")
end


function ColorRangeInterface:getMinBlue()
    error("abstract method getMinBlue")
end


function ColorRangeInterface:setMinBlue(minBlue)
    error("abstract method setMinBlue")
end


function ColorRangeInterface:getMaxBlue()
    error("abstract method getMaxBlue")
end


function ColorRangeInterface:setMaxBlue(maxBlue)
    error("abstract method setMaxBlue")
end


function ColorRangeInterface:isInRange(color)
    error("abstract method isInRange")
end

return ColorRangeInterface

