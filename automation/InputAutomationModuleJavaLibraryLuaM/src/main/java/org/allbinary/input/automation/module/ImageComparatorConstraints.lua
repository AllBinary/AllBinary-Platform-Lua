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
-- package org.allbinary.input.automation.module

-- local Color = require("java.awt.Color")
-- local Rectangle = require("java.awt.Rectangle")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local RectangleCollisionUtil = require("org.allbinary.collision.RectangleCollisionUtil")
local GPoint = require("org.allbinary.graphics.GPoint")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ImageComparatorConstraintsInterface = require("org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local ImageComparatorConstraints = {}
ImageComparatorConstraints.__index = ImageComparatorConstraints
ImageComparatorConstraints.className = "ImageComparatorConstraints"

function ImageComparatorConstraints:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.avoidVector = nil
    self.maxNonMatchingPixelDeltas = 0
    self.doImageComparisonEveryNthFrame = nil
end


function ImageComparatorConstraints.new(doImageComparisonEveryNthFrame)
    local self = setmetatable({}, ImageComparatorConstraints)
    self:_init_fields()
        self.doImageComparisonEveryNthFrame = doImageComparisonEveryNthFrame
        self:setAvoidVector(BasicArrayListD.new())
    return self
end


function ImageComparatorConstraints:getAvoidVector()
        return self.avoidVector
end


function ImageComparatorConstraints:isColorAllowed(frame, point, color)
        error(java_exception("RuntimeException"), 0)
end


function ImageComparatorConstraints:isCollisionWithAvoidRectangles(rectangle)
        local isCollsionWithAvoidRectangles = false
        local avoidVector = self:getAvoidVector()
        local size = avoidVector:size()
        for index = 0, size - 1 do
            local avoidRectangle = avoidVector:get(index)
            if RectangleCollisionUtil.isCollision(avoidRectangle, rectangle) then
                isCollsionWithAvoidRectangles = true
            end
        end
        return isCollsionWithAvoidRectangles
end


-- Java overloaded method: Lua keeps the last definition
function ImageComparatorConstraints:isCollisionWithAvoidRectangles(point)
        local isCollsionWithAvoidRectangles = false
        local avoidVector = self:getAvoidVector()
        local size = avoidVector:size()
        for index = 0, size - 1 do
            local avoidRectangle = avoidVector:get(index)
            if RectangleCollisionUtil.isCollision(avoidRectangle, point) then
                isCollsionWithAvoidRectangles = true
                break
            end
        end
        return isCollsionWithAvoidRectangles
end


function ImageComparatorConstraints:setAvoidVector(avoidVector)
        self.avoidVector = avoidVector
end


function ImageComparatorConstraints:getMaxNonMatchingPixelDeltas()
        return self.maxNonMatchingPixelDeltas
end


function ImageComparatorConstraints:setMaxNonMatchingPixelDeltas(maxNonMatchingPixelDeltas)
        self.maxNonMatchingPixelDeltas = maxNonMatchingPixelDeltas
end


function ImageComparatorConstraints:isFrameAllowed(frame)
        local remainder = (math.fmod((frame + 1), self.doImageComparisonEveryNthFrame))
        self.logUtil:putF(" Frame: " .. tostring(frame) .. " remainder: " .. tostring(remainder) .. " this.doImageComparisonEveryNthFrame: " .. tostring(self.doImageComparisonEveryNthFrame), self, "isCollisionWithAvoidRectangles")
        if remainder == 0 then
            return true
        else
            return false
        end
end


-- throws Exception
function ImageComparatorConstraints:isImageValid(bufferedImage)
        error(java_exception("RuntimeException"), 0)
end


function ImageComparatorConstraints:log()
        local avoidVector = self:getAvoidVector()
        local size = avoidVector:size()
        for index = 0, size - 1 do
            local avoidRectangle = avoidVector:get(index)
            self.logUtil:putF("Avoid Rectangle: " .. tostring(avoidRectangle), self, "log")
        end
end

return ImageComparatorConstraints

