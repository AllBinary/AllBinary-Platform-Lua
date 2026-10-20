-- Generated Code Do Not Modify
-- package org.allbinary.animation.vector

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local RectangleFilledAnimation = require("org.allbinary.animation.vector.RectangleFilledAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ARectangleFilledAnimation = {}
ARectangleFilledAnimation.__index = ARectangleFilledAnimation
ARectangleFilledAnimation.className = "ARectangleFilledAnimation"
setmetatable(ARectangleFilledAnimation, {__index = RectangleFilledAnimation})

function ARectangleFilledAnimation:_init_fields()
    self.x = 0
    self.y = 0
end


function ARectangleFilledAnimation.new()
    local self = setmetatable(RectangleFilledAnimation.new(0, 0, BasicColorFactory.getInstance().BLACK), ARectangleFilledAnimation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ARectangleFilledAnimation:nextFrame()
end


function ARectangleFilledAnimation:paintXY(graphics, unusedX, unusedY)
        RectangleFilledAnimation.paintXY(self, graphics, self.x, self.y)
end

return ARectangleFilledAnimation

