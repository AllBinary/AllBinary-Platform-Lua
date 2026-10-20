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
-- package org.allbinary.animation

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local VectorAnimationInterface = require("org.allbinary.animation.VectorAnimationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorBaseRotationAnimation = {}
VectorBaseRotationAnimation.__index = VectorBaseRotationAnimation
VectorBaseRotationAnimation.className = "VectorBaseRotationAnimation"
setmetatable(VectorBaseRotationAnimation, {__index = RotationAnimation})

function VectorBaseRotationAnimation:_init_fields()
    self.currentPoints = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
end


function VectorBaseRotationAnimation.new(angleInfo, currentPoints, basicColor, animationBehavior)
    local self = setmetatable(RotationAnimation.new(angleInfo, CircularIndexUtil.createInstance(360 / angleInfo:getAngleIncrementInfo():getAngleIncrement()), animationBehavior), VectorBaseRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:setPoints(currentPoints)
        self:setBasicColorP(basicColor)
    return self
end


-- throws Exception
function VectorBaseRotationAnimation:getAnimationSize()
        return self:getSize()
end


function VectorBaseRotationAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end


function VectorBaseRotationAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
end


function VectorBaseRotationAnimation:nextFrame()
        self.circularIndexUtil:next()
end


function VectorBaseRotationAnimation:previousFrame()
        self.circularIndexUtil:previous()
end


function VectorBaseRotationAnimation:getSize()
        return (self.currentPoints.n or #self.currentPoints)
end


function VectorBaseRotationAnimation:setSequence(sequence)
end


function VectorBaseRotationAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function VectorBaseRotationAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP(graphics, self.basicColor)
        local try_ok, try_error = pcall(function()
            local nextPointX = 0
            local nextPointY = 0
            local nextPoint = nil
            local point = nil
            local currentPointsFrame = self.currentPoints[self.circularIndexUtil:getIndex() + 1]
            local size = (currentPointsFrame.n or #currentPointsFrame)
            local index = size - 2
            while (function() index = index - 1 return index end)() >= 0 do
                nextPoint = currentPointsFrame[index + 1]
                point = currentPointsFrame[index + 1 + 1]
                nextPointX = nextPoint[1]
                nextPointY = nextPoint[2]
                if nextPointX ~= 1000 then
                    graphics:drawLine(point[1] + x, point[2] + y, nextPointX + x, nextPointY + y)
                else
                    index = index - 1
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "paintVectors", e)
        end
end


function VectorBaseRotationAnimation:getPoints(frame)
        return self.currentPoints[frame + 1]
end


function VectorBaseRotationAnimation:setPoints(currentPoints)
        self.currentPoints = currentPoints
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.currentPoints.n or #self.currentPoints))
end

return VectorBaseRotationAnimation

