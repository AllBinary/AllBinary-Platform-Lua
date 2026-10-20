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
-- package org.allbinary.graphics


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ItemColorFactory = {}
ItemColorFactory.__index = ItemColorFactory
ItemColorFactory.className = "ItemColorFactory"

function ItemColorFactory:_init_fields()
    self.INVERT_PAINT = 0xFF000000
    self.PAINT = 0xFFe07718
    self.TEXT_FIELD_NO_FOCUS = 0x7F7F7F
end

function ItemColorFactory.new()
    local self = setmetatable({}, ItemColorFactory)
    self:_init_fields()
    return self
end


function ItemColorFactory.getInstance()
        return ItemColorFactory.instance
end

ItemColorFactory.instance = ItemColorFactory.new()

return ItemColorFactory

