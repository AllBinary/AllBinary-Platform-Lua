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
-- package org.allbinary.graphics.paint

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local LocationPaintable = require("org.allbinary.graphics.paint.LocationPaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StringLocationPaintable = {}
StringLocationPaintable.__index = StringLocationPaintable
StringLocationPaintable.className = "StringLocationPaintable"
setmetatable(StringLocationPaintable, {__index = LocationPaintable})

function StringLocationPaintable:_init_fields()
    self.value = nil
end


function StringLocationPaintable.new(value)
    local self = setmetatable(LocationPaintable.new(), StringLocationPaintable)
    self:_init_fields()
        self.value = value
    return self
end


function StringLocationPaintable:paintXY(graphics, x, y)
        graphics:drawString(self.value, x, y, 0)
end

return StringLocationPaintable

