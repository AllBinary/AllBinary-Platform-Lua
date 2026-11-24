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
-- package org.allbinary.graphics.color

local ColorTemperatureUtil = {}
package.loaded["org.allbinary.graphics.color.ColorTemperatureUtil"] = ColorTemperatureUtil

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

local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")

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

-- class table ColorTemperatureUtil is declared before the requires
ColorTemperatureUtil.__index = ColorTemperatureUtil
ColorTemperatureUtil.className = "ColorTemperatureUtil"
ColorTemperatureUtil.javaClassName = "org.allbinary.graphics.color.ColorTemperatureUtil"

function ColorTemperatureUtil:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
end

function ColorTemperatureUtil._jinit(self)
    ColorTemperatureUtil._init_fields(self)
    return self
end

function ColorTemperatureUtil.new()
    return ColorTemperatureUtil._jinit(setmetatable({}, ColorTemperatureUtil))
end


function ColorTemperatureUtil.getInstance()
        return ColorTemperatureUtil.instance_f
end


function ColorTemperatureUtil:getBasicColor(thirdTemp)
        local basicColor = self.basicColorFactory.RED
        if thirdTemp > 3700 then
            basicColor = self.basicColorFactory.PURPLE
        elseif thirdTemp > 3200 then
            basicColor = self.basicColorFactory.BLUE
        elseif thirdTemp > 2700 then
            basicColor = self.basicColorFactory.PUCE
        elseif thirdTemp > 2200 then
            basicColor = self.basicColorFactory.WHITE
        elseif thirdTemp > 1700 then
            basicColor = self.basicColorFactory.GREEN
        elseif thirdTemp > 1200 then
            basicColor = self.basicColorFactory.YELLOW
        elseif thirdTemp > 700 then
            basicColor = self.basicColorFactory.ORANGE
        end
        return basicColor
end

ColorTemperatureUtil.instance_f = ColorTemperatureUtil.new()

return ColorTemperatureUtil

