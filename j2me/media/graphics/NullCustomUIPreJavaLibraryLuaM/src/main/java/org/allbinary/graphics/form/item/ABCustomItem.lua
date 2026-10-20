-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Screen = require("javax.microedition.lcdui.Screen")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABCustomItem = {}
ABCustomItem.__index = ABCustomItem
ABCustomItem.className = "ABCustomItem"


function ABCustomItem.getNullInstance()
        if ABCustomItem.NULL_CUSTOM_ITEM == NullUtil.getInstance().NULL_OBJECT then
            ABCustomItem.NULL_CUSTOM_ITEM = ABCustomItem.new(StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ABCustomItem.NULL_CUSTOM_ITEM
end


function ABCustomItem.new(label, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable({}, ABCustomItem)
    return self
end


function ABCustomItem:setOwner(owner)
end


function ABCustomItem:paintXY(graphics, x, y)
end


function ABCustomItem:paintUnselected(graphics, x, y)
end


function ABCustomItem:isFocusable()
        return false
end


function ABCustomItem:getLabel()
        return StringUtil.getInstance().EMPTY_STRING
end


function ABCustomItem:setLabel(label)
end


function ABCustomItem:getHeight()
        return 0
end


function ABCustomItem:setHeight(height)
end


function ABCustomItem:getValue()
        return 0.0
end


function ABCustomItem:setValue(value)
end


function ABCustomItem:getMinimumWidth()
        return 0
end


function ABCustomItem:getMinimumHeight()
        return 0
end


function ABCustomItem:preMeasurement(graphics)
end

ABCustomItem.NULL_CUSTOM_ITEM = NullUtil.getInstance().NULL_OBJECT

return ABCustomItem

