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
-- package org.allbinary.graphics.form.item

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ABTextItem = require("org.allbinary.graphics.form.item.ABTextItem")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SelectableTextItem = {}
SelectableTextItem.__index = SelectableTextItem
SelectableTextItem.className = "SelectableTextItem"
setmetatable(SelectableTextItem, {__index = ABTextItem})


function SelectableTextItem.new(label, layout, altText, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ABTextItem.new(label, layout, altText, backgroundBasicColor, foregroundBasicColor), SelectableTextItem)
        -- super(...) made self above
    return self
end


function SelectableTextItem:isFocusable()
        return true
end


function SelectableTextItem:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        local stringComponent = self:getLabelStringComponent()
        if stringComponent ~= nil then
            graphics:setColor(math.tointeger(stringComponent:getForegroundBasicColor() // 1))
        end
        graphics:drawString(self:getLabel(), x + 2, y, 0)
end

return SelectableTextItem

