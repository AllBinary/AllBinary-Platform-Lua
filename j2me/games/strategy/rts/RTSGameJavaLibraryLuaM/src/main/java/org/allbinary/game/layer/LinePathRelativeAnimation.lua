-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GPoint = require("org.allbinary.graphics.GPoint")
local Layer = require("org.allbinary.layer.Layer")
local LinePathAnimation = require("org.allbinary.game.layer.LinePathAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LinePathRelativeAnimation = {}
LinePathRelativeAnimation.__index = LinePathRelativeAnimation
LinePathRelativeAnimation.className = "LinePathRelativeAnimation"
setmetatable(LinePathRelativeAnimation, {__index = LinePathAnimation})

function LinePathRelativeAnimation.new()
    local self = setmetatable(LinePathAnimation.new(), LinePathRelativeAnimation)
    return self
end


function LinePathRelativeAnimation.getInstance()
        return LinePathRelativeAnimation.instanceC
end


function LinePathRelativeAnimation:paint(graphics, point, nextPoint, tiledLayer)
        graphics:drawLine(nextPoint:getX() - tiledLayer:getXP(), nextPoint:getY() - tiledLayer:getYP(), point:getX() - tiledLayer:getXP(), point:getY() - tiledLayer:getYP())
end

LinePathRelativeAnimation.instanceC = LinePathRelativeAnimation.new()

return LinePathRelativeAnimation

