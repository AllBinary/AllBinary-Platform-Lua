-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local ABCustomGaugeItem = {}
ABCustomGaugeItem.__index = ABCustomGaugeItem
ABCustomGaugeItem.className = "ABCustomGaugeItem"
setmetatable(ABCustomGaugeItem, {__index = ABCustomItem})


function ABCustomGaugeItem.new(label, maxValue, initialValue, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ABCustomItem.new(label, backgroundBasicColor, foregroundBasicColor), ABCustomGaugeItem)
        -- super(...) made self above
    return self
end

ABCustomGaugeItem.NULL_GAUGE_ITEM = ABCustomGaugeItem.new(StringUtil.getInstance().EMPTY_STRING, 1, 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)

return ABCustomGaugeItem

