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
-- package org.allbinary.input.motion.button

local Animation = require("org.allbinary.animation.Animation")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local TouchButton = require("org.allbinary.input.motion.button.TouchButton")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FullTouchButton = {}
FullTouchButton.__index = FullTouchButton
FullTouchButton.className = "FullTouchButton"
setmetatable(FullTouchButton, {__index = TouchButton})


-- throws Exception
function FullTouchButton.createButton(touchButtonInput, touchButtonResource, rawRectangle, cellPosition, xBorder, yBorder)
        return FullTouchButton.new(touchButtonInput, FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(touchButtonResource.RESOURCE):getInstance(0), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(touchButtonResource.HINT):getInstance(0), rawRectangle, cellPosition, xBorder, yBorder)
end


function FullTouchButton.new(touchButtonInput, animationInterface, hintAnimationInterface, rawRectangle, cellPosition, xBorder, yBorder)
    local self = setmetatable(TouchButton.new(touchButtonInput, animationInterface, hintAnimationInterface, rawRectangle, cellPosition, xBorder, yBorder), FullTouchButton)
        -- super(...) made self above
    return self
end


function FullTouchButton:updateRectangle()
        local try_ok, try_error = pcall(function()
            local pointFactory = PointFactory.getInstance()
            local x = self.rawRectangle:getWidth() * self.cellPositionP:getColumn()
            local y = self.rawRectangle:getHeight() * self.cellPositionP:getRow()
            self.rectangleP = Rectangle.new(pointFactory:createXY(x, y), self.rawRectangle:getWidth() + (2 * self.xBorder), self.rawRectangle:getHeight() + (2 * self.yBorder))
            local point = self.rectangleP:getPoint()
            self.animationX = point:getX() + self.xBorder
            self.animationY = point:getY() + self.yBorder
            self.hintAnimationY = ((self.animationY - self.rectangleP:getHeight()) // (1 << (1)))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateRectangle", e)
        end
end

return FullTouchButton

