-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABStringComponent = {}
ABStringComponent.__index = ABStringComponent
ABStringComponent.className = "ABStringComponent"


function ABStringComponent:getBackgroundBasicColor()
        return BasicColorFactory.getInstance().WHITE
end


function ABStringComponent.new(backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable({}, ABStringComponent)
    return self
end


function ABStringComponent:getForegroundBasicColor()
        return BasicColorFactory.getInstance().WHITE
end


function ABStringComponent:setForegroundBasicColor(foregroundBasicColor)
end

ABStringComponent.NULL_STRING_COMPONENT = ABStringComponent.new(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)

return ABStringComponent

