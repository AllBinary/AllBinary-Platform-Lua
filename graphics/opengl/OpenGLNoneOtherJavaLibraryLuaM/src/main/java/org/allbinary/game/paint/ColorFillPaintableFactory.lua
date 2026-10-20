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
-- package org.allbinary.game.paint

local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorFillPaintableFactory = {}
ColorFillPaintableFactory.__index = ColorFillPaintableFactory
ColorFillPaintableFactory.className = "ColorFillPaintableFactory"

function ColorFillPaintableFactory.new()
    local self = setmetatable({}, ColorFillPaintableFactory)
    return self
end


function ColorFillPaintableFactory.getInstance()
        return ColorFillPaintableFactory.instance
end


-- Java overloaded method: Lua keeps the last definition
function ColorFillPaintableFactory:getInstance(basicColor, forThreedCanvas)
        local operatingSystem = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
        if operatingSystem:isOverScan() then
            return OverScanColorFillPaintable.new(basicColor)
        else
            return ColorFillPaintable.new(basicColor)
        end
end

ColorFillPaintableFactory.instance = ColorFillPaintableFactory.new()

return ColorFillPaintableFactory

