-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Font = require("javax.microedition.lcdui.Font")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
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

local ABTextFieldItem = {}
ABTextFieldItem.__index = ABTextFieldItem
ABTextFieldItem.className = "ABTextFieldItem"
setmetatable(ABTextFieldItem, {__index = ABTextItem})

function ABTextFieldItem:_init_fields()
    self.font = nil
end


function ABTextFieldItem.new(canvas, visitor, label, value, maxSize, layout, altText, font, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ABTextItem.new(label, layout, altText, backgroundBasicColor, foregroundBasicColor), ABTextFieldItem)
    self:_init_fields()
        -- super(...) made self above
        self.font = font
    return self
end


function ABTextFieldItem:getLabel()
        return StringUtil.getInstance().EMPTY_STRING
end


function ABTextFieldItem:setLabel(label)
end


function ABTextFieldItem:getString()
        return StringUtil.getInstance().EMPTY_STRING
end


function ABTextFieldItem:setString(string)
end


function ABTextFieldItem:setFocus(state)
end


function ABTextFieldItem:getFontHeight()
        return self.font:getHeight()
end


function ABTextFieldItem:setBackgroundBasicColorP(basicColor)
end


function ABTextFieldItem:setForegroundBasicColorP(basicColor)
end

return ABTextFieldItem

