-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

-- local Graphics = require("javax.microedition.lcdui.Graphics")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ABCustomItemInterface = {}
ABCustomItemInterface.__index = ABCustomItemInterface
ABCustomItemInterface.className = "ABCustomItemInterface"


function ABCustomItemInterface:getMinimumWidth()
    error("abstract method getMinimumWidth")
end


function ABCustomItemInterface:getMinimumHeight()
    error("abstract method getMinimumHeight")
end


function ABCustomItemInterface:getLabel()
    error("abstract method getLabel")
end


function ABCustomItemInterface:paintXY(graphics, x, y)
    error("abstract method paintXY")
end


function ABCustomItemInterface:paintUnselected(graphics, x, y)
    error("abstract method paintUnselected")
end

return ABCustomItemInterface

