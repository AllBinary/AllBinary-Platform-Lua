-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
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

local ABCustomImageItem = {}
ABCustomImageItem.__index = ABCustomImageItem
ABCustomImageItem.className = "ABCustomImageItem"
setmetatable(ABCustomImageItem, {__index = ABCustomItem})

function ABCustomImageItem:_init_fields()
    self.yOffset = 0
end


function ABCustomImageItem.new(label, image, layout, altText, basicColor, yOffset)
    local self = setmetatable(ABCustomItem.new(label, basicColor, basicColor), ABCustomImageItem)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ABCustomImageItem:getImage()
        return NullImage.NULL_IMAGE
end

return ABCustomImageItem

