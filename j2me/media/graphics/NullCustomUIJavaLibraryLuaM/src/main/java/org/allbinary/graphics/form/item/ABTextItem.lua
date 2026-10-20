-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CustomCustomItem = require("org.allbinary.graphics.form.item.CustomCustomItem")
local ABCustomItemInterface = require("org.allbinary.graphics.form.item.ABCustomItemInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABTextItem = {}
ABTextItem.__index = ABTextItem
ABTextItem.className = "ABTextItem"
setmetatable(ABTextItem, {__index = CustomCustomItem})


function ABTextItem.new(label, layout, altText, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(CustomCustomItem.new(label, backgroundBasicColor, foregroundBasicColor), ABTextItem)
        -- super(...) made self above
    return self
end


function ABTextItem:keyPressed(keyCode)
end


function ABTextItem:paintUnselected(graphics, x, y)
end


function ABTextItem:getLabelStringComponent()
        return ABStringComponent.NULL_STRING_COMPONENT
end

return ABTextItem

