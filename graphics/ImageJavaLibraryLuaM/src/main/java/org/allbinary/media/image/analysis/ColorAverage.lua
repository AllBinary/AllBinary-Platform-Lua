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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorAverage = {}
ColorAverage.__index = ColorAverage
ColorAverage.className = "ColorAverage"

function ColorAverage:_init_fields()
    self.avgRed = 0.0
    self.avgGreen = 0.0
    self.avgBlue = 0.0
end


function ColorAverage.new()
    local self = setmetatable({}, ColorAverage)
    self:_init_fields()
        self:setAvgRed(0)
        self:setAvgGreen(0)
        self:setAvgBlue(0)
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

