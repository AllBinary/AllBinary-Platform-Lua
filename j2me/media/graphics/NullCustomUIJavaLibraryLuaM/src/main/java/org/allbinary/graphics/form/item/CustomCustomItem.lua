-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
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

local CustomCustomItem = {}
CustomCustomItem.__index = CustomCustomItem
CustomCustomItem.className = "CustomCustomItem"
setmetatable(CustomCustomItem, {__index = ABCustomItem})

function CustomCustomItem:_init_fields()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
end


function CustomCustomItem.new(label, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ABCustomItem.new(label, backgroundBasicColor, foregroundBasicColor), CustomCustomItem)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CustomCustomItem:updateMeasurement(graphics)
end

return CustomCustomItem

