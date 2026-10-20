-- Generated Code Do Not Modify
-- package org.allbinary.animation

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FillAnimation = {}
FillAnimation.__index = FillAnimation
FillAnimation.className = "FillAnimation"
setmetatable(FillAnimation, {__index = IndexedAnimation})

function FillAnimation:_init_fields()
    self.pixelBuffer = nil
    self.width = nil
    self.height = nil
end


function FillAnimation.new(pixelBuffer, width, height, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), FillAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.width = 100
        self.height = 100
        self.pixelBuffer = pixelBuffer
    return self
end


function FillAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        IndexedAnimation.setBasicColorP(self, basicColor)
        if changed then
            self:updateModifiers()
        end
end


function FillAnimation:changeBasicColor(basicColor)
        local changed = false
        if self:getChangeBasicColor() == nil or math.tointeger(self:getChangeBasicColor() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        IndexedAnimation.changeBasicColor(self, basicColor)
        if changed then
            self:updateModifiers()
        end
end


function FillAnimation:setAlpha(alpha)
        local changed = false
        if self.alphaP ~= alpha then
            changed = true
        end
        IndexedAnimation.setAlpha(self, alpha)
        if changed then
            self:updateModifiers()
        end
end


function FillAnimation:setScale(scaleX, scaleY)
end


function FillAnimation:setMaxScale(maxScaleX, maxScaleY)
end


function FillAnimation:updateModifiers()
end


function FillAnimation:paint(g)
        g:drawRGB(self.pixelBuffer, 0, self.width, 0, 0, self.width, self.height, true)
end

return FillAnimation

