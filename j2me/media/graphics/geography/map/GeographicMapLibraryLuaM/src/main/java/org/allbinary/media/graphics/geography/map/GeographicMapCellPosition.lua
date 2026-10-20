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
-- package org.allbinary.media.graphics.geography.map

local CellPosition = require("org.allbinary.graphics.CellPosition")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPosition = {}
GeographicMapCellPosition.__index = GeographicMapCellPosition
GeographicMapCellPosition.className = "GeographicMapCellPosition"
setmetatable(GeographicMapCellPosition, {__index = CellPosition})

function GeographicMapCellPosition:_init_fields()
    self.point = nil
    self.midPoint = nil
end


function GeographicMapCellPosition.new(column, row, columns, rows, width, height)
    local self = setmetatable(CellPosition.new(column, row, columns, rows), GeographicMapCellPosition)
    self:_init_fields()
        -- super(...) made self above
        local x = self:getColumn() * width
        local y = self:getRow() * height
        local pointFactory = PointFactory.getInstance()
        self.point = pointFactory:createXY(x, y)
        self.midPoint = pointFactory:createXY(x + (((width) // (1 << (1)))), y + (((height) // (1 << (1)))))
    return self
end


function GeographicMapCellPosition:getPoint()
        return self.point
end


function GeographicMapCellPosition:getMidPoint()
        return self.midPoint
end


function GeographicMapCellPosition:setMidPoint(midPoint)
        self.midPoint = midPoint
end

return GeographicMapCellPosition

