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

local ColorAverage = {}
package.loaded["org.allbinary.media.image.analysis.ColorAverage"] = ColorAverage

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table ColorAverage is declared before the requires
ColorAverage.__index = ColorAverage
ColorAverage.className = "ColorAverage"
ColorAverage.javaClassName = "org.allbinary.media.image.analysis.ColorAverage"

function ColorAverage:_init_fields()
    if self.avgRed == nil then self.avgRed = 0.0 end
    if self.avgGreen == nil then self.avgGreen = 0.0 end
    if self.avgBlue == nil then self.avgBlue = 0.0 end
end


function ColorAverage._jinit(self)
    ColorAverage._init_fields(self)
        self:setAvgRed(0)
        self:setAvgGreen(0)
        self:setAvgBlue(0)
    return self
end

function ColorAverage.new(...)
    local self = setmetatable({}, ColorAverage)
    ColorAverage._jinit(self, ...)
    return self
end


function ColorAverage:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("getAvgRed(): ")
        stringBuffer:appendfloat(self:getAvgRed())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getAvgRed(): ")
        stringBuffer:appendfloat(self:getAvgRed())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getAvgGreen(): ")
        stringBuffer:appendfloat(self:getAvgGreen())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        return tostring(stringBuffer)
end
ColorAverage.__tostring = function(self) return self:toString() end


function ColorAverage:getAvgRed()
        return self.avgRed
end


function ColorAverage:setAvgRed(avgRed)
        self.avgRed = avgRed
end


function ColorAverage:getAvgGreen()
        return self.avgGreen
end


function ColorAverage:setAvgGreen(avgGreen)
        self.avgGreen = avgGreen
end


function ColorAverage:getAvgBlue()
        return self.avgBlue
end


function ColorAverage:setAvgBlue(avgBlue)
        self.avgBlue = avgBlue
end

return ColorAverage

