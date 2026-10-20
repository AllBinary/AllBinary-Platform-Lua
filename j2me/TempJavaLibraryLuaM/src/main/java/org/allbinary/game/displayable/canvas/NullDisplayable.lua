-- Generated Code Do Not Modify
-- package org.allbinary.game.displayable.canvas

-- local Canvas = require("javax.microedition.lcdui.Canvas")
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

--Temp should not be in any build
local NullDisplayable = {}
NullDisplayable.__index = NullDisplayable
NullDisplayable.className = "NullDisplayable"
setmetatable(NullDisplayable, {__index = Canvas})


function NullDisplayable.getInstance()
        return NullDisplayable.SINGLETON
end


function NullDisplayable.new()
    local self = setmetatable(Canvas.new(), NullDisplayable)
    return self
end


function NullDisplayable:paint(graphics)
end

NullDisplayable.SINGLETON = NullDisplayable.new()

return NullDisplayable

