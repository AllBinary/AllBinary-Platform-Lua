-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.graphics.form

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ItemIndexPaintable = {}
ItemIndexPaintable.__index = ItemIndexPaintable
ItemIndexPaintable.className = "ItemIndexPaintable"

function ItemIndexPaintable.new()
    local self = setmetatable({}, ItemIndexPaintable)
    return self
end


function ItemIndexPaintable.getInstance()
        return ItemIndexPaintable.instance
end


-- throws Exception
function ItemIndexPaintable:paint(graphics, index, item, dx, dy)
        return 0
end

ItemIndexPaintable.instance = ItemIndexPaintable.new()

return ItemIndexPaintable

