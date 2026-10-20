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
-- package org.allbinary.media.image


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageUnifierProperties = {}
ImageUnifierProperties.__index = ImageUnifierProperties
ImageUnifierProperties.className = "ImageUnifierProperties"

function ImageUnifierProperties:_init_fields()
    self.rows = nil
    self.columns = nil
    self.imageUnifierCell = nil
end


function ImageUnifierProperties.new()
    local self = setmetatable({}, ImageUnifierProperties)
    self:_init_fields()
    return self
end


function ImageUnifierProperties:getWidth()
        return math.tointeger(self:getColumns() // 1) * math.tointeger(self:getImageUnifierCell():getWidth() // 1)
end


function ImageUnifierProperties:getHeight()
        return math.tointeger(self:getRows() // 1) * math.tointeger(self:getImageUnifierCell():getHeight() // 1)
end


function ImageUnifierProperties:getRows()
        return self.rows
end


function ImageUnifierProperties:setRows(rows)
        self.rows = rows
end


function ImageUnifierProperties:getColumns()
        return self.columns
end


function ImageUnifierProperties:setColumns(columns)
        self.columns = columns
end


function ImageUnifierProperties:getImageUnifierCell()
        return self.imageUnifierCell
end


function ImageUnifierProperties:setImageUnifierCell(imageUnifierCell)
        self.imageUnifierCell = imageUnifierCell
end

return ImageUnifierProperties

