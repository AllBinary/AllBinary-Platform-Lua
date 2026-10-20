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

-- local awt = require("java.awt")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local ColorRangeInterface = require("org.allbinary.media.image.analysis.ColorRangeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorRange = {}
ColorRange.__index = ColorRange
ColorRange.className = "ColorRange"

function ColorRange:_init_fields()
    self.minRed = nil
    self.maxRed = nil
    self.minGreen = nil
    self.maxGreen = nil
    self.minBlue = nil
    self.maxBlue = nil
end


function ColorRange.new()
    local self = setmetatable({}, ColorRange)
    self:_init_fields()
        self.minRed = 0
        self.maxRed = 0
        self.minGreen = 0
        self.maxGreen = 0
        self.minBlue = 0
        self.maxBlue = 0
    return self
end


function ColorRange:getMinRed()
        return self.minRed
end


function ColorRange:setMinRed(minRed)
        self.minRed = minRed
end


function ColorRange:getMaxRed()
        return self.maxRed
end


function ColorRange:setMaxRed(maxRed)
        self.maxRed = maxRed
end


function ColorRange:getMinGreen()
        return self.minGreen
end


function ColorRange:setMinGreen(minGreen)
        self.minGreen = minGreen
end


function ColorRange:getMaxGreen()
        return self.maxGreen
end


function ColorRange:setMaxGreen(maxGreen)
        self.maxGreen = maxGreen
end


function ColorRange:getMinBlue()
        return self.minBlue
end


function ColorRange:setMinBlue(minBlue)
        self.minBlue = minBlue
end


function ColorRange:getMaxBlue()
        return self.maxBlue
end


function ColorRange:setMaxBlue(maxBlue)
        self.maxBlue = maxBlue
end


function ColorRange:isInRange(color)
        if color:getRed() >= self:getMinRed() and color:getRed() <= self:getMaxRed() and color:getGreen() >= self:getMinGreen() and color:getGreen() <= self:getMaxGreen() and color:getBlue() >= self:getMinBlue() and color:getBlue() <= self:getMaxBlue() then
            return true
        else
            return false
        end
end


function ColorRange:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("getMinRed(): ")
        stringBuffer:appendint(self:getMinRed())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMaxRed(): ")
        stringBuffer:appendint(self:getMaxRed())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMinGreen(): ")
        stringBuffer:appendint(self:getMinGreen())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMaxGreen(): ")
        stringBuffer:appendint(self:getMaxGreen())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMinBlue(): ")
        stringBuffer:appendint(self:getMinGreen())
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("getMaxBlue(): ")
        stringBuffer:appendint(self:getMaxBlue())
        return tostring(stringBuffer)
end
ColorRange.__tostring = function(self) return self:toString() end

return ColorRange

