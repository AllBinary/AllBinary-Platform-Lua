--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.game.health

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local HealthBarAnimation = require("org.allbinary.game.health.HealthBarAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealthBarTwodAnimation = {}
HealthBarTwodAnimation.__index = HealthBarTwodAnimation
HealthBarTwodAnimation.className = "HealthBarTwodAnimation"
setmetatable(HealthBarTwodAnimation, {__index = HealthBarAnimation})


function HealthBarTwodAnimation.new(layerInterface, location)
    local self = setmetatable(HealthBarAnimation.new(layerInterface, location), HealthBarTwodAnimation)
        -- super(...) made self above
    return self
end


function HealthBarTwodAnimation:paintXY(graphics, x, y)
        local ax = self.allbinaryLayer:getViewPosition():getX()
        self.basicSetColorUtil:setBasicColorP3(graphics, self.basicColor, self.colorP)
        graphics:fillRect(ax, self:getY() - 1, self.x2, self.thickness)
end

return HealthBarTwodAnimation

