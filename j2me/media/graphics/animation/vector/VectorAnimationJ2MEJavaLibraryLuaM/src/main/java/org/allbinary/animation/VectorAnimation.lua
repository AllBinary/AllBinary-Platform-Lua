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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local VectorAnimationInterface = require("org.allbinary.animation.VectorAnimationInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorAnimation = {}
VectorAnimation.__index = VectorAnimation
VectorAnimation.className = "VectorAnimation"
setmetatable(VectorAnimation, {__index = IndexedAnimation})

function VectorAnimation:_init_fields()
    self.currentPoints = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
    self.circularIndexUtil = CircularIndexUtil.createInstance(0)
end


function VectorAnimation.createVectorAnimation(currentPoints2, basicColor, animationBehavior)
        local currentPoints = java_new_array(0, 1, (currentPoints2.n or #currentPoints2), 2)
        local size = (currentPoints2.n or #currentPoints2)
        for index = 0, size - 1 do
            currentPoints[1][index + 1][1] = currentPoints2[index + 1][1]
            currentPoints[1][index + 1][2] = currentPoints2[index + 1][2]
        end
        return VectorAnimation.new(currentPoints, basicColor, animationBehavior)
end


function VectorAnimation.new(currentPoints, basicColor, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), VectorAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:setPoints(currentPoints)
        self:setBasicColorP(basicColor)
    return self
end


function VectorAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        IndexedAnimation.setBasicColorP(self, basicColor)
        if changed then
            self:updateModifiers()
        end
end


function VectorAnimation:changeBasicColor(basicColor)
        local changed = false
        if self:getChangeBasicColor() == nil or math.tointeger(self:getChangeBasicColor() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        IndexedAnimation.changeBasicColor(self, basicColor)
        if changed then
            self:updateModifiers()
        end
end


function VectorAnimation:setAlpha(alpha)
        local changed = false
        if self.alphaP ~= alpha then
            changed = true
        end
        IndexedAnimation.setAlpha(self, alpha)
        if changed then
            self:updateModifiers()
        end
end


function VectorAnimation:setScale(scaleX, scaleY)
end


function VectorAnimation:setMaxScale(maxScaleX, maxScaleY)
end


function VectorAnimation:updateModifiers()
end


-- throws Exception
function VectorAnimation:getAnimationSize()
        return self:getSize()
end


function VectorAnimation:getSize()
        return (self.currentPoints.n or #self.currentPoints)
end


function VectorAnimation:setSequence(sequence)
end


function VectorAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function VectorAnimation:nextFrame()
        self.circularIndexUtil:next()
end


function VectorAnimation:previousFrame()
        self.circularIndexUtil:previous()
end


function VectorAnimation:paintVectors(graphics, x, y)
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


function VectorAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP(graphics, self.basicColor)
        self:paintVectors(graphics, x, y)
end


function VectorAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end


function VectorAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
end


function VectorAnimation:getPoints(frame)
        return self.currentPoints[frame + 1]
end


function VectorAnimation:setPoints(currentPoints)
        self.currentPoints = currentPoints
        self.circularIndexUtil = CircularIndexUtil.createInstance((currentPoints.n or #currentPoints))
end

return VectorAnimation

