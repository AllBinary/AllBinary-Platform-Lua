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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorTemperatureUtil = {}
ColorTemperatureUtil.__index = ColorTemperatureUtil
ColorTemperatureUtil.className = "ColorTemperatureUtil"

function ColorTemperatureUtil:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
end

function ColorTemperatureUtil.new()
    local self = setmetatable({}, ColorTemperatureUtil)
    self:_init_fields()
    return self
end


function ColorTemperatureUtil.getInstance()
        return ColorTemperatureUtil.instance
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

ColorTemperatureUtil.instance = ColorTemperatureUtil.new()

return ColorTemperatureUtil

