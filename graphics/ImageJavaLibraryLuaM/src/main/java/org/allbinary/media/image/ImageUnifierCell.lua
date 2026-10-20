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

local ImageUnifierCell = {}
ImageUnifierCell.__index = ImageUnifierCell
ImageUnifierCell.className = "ImageUnifierCell"

function ImageUnifierCell:_init_fields()
    self.width = nil
    self.height = nil
end


function ImageUnifierCell.new(width, height)
    local self = setmetatable({}, ImageUnifierCell)
    self:_init_fields()
        self:setWidth(width)
        self:setHeight(height)
    return self
end


function ImageUnifierCell:getWidth()
        return self.width
end


function ImageUnifierCell:setWidth(width)
        self.width = width
end


function ImageUnifierCell:getHeight()
        return self.height
end


function ImageUnifierCell:setHeight(height)
        self.height = height
end

return ImageUnifierCell

