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
-- package org.allbinary.media.image.comparison.motion

-- local awt = require("java.awt")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ImageComparisonResult = require("org.allbinary.media.image.comparison.ImageComparisonResult")
local PixelDelta = require("org.allbinary.media.image.comparison.pixel.PixelDelta")
local MotionRectangles = require("org.allbinary.media.image.comparison.motion.MotionRectangles")

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

local AllMotionRectangles = {}
AllMotionRectangles.__index = AllMotionRectangles
AllMotionRectangles.className = "AllMotionRectangles"
setmetatable(AllMotionRectangles, {__index = MotionRectangles})


function AllMotionRectangles.new(imageComparisonResult)
    local self = setmetatable(MotionRectangles.new(AllMotionRectangles.NAME, imageComparisonResult), AllMotionRectangles)
        -- super(...) made self above
        self:createMotionRectangles(imageComparisonResult)
    return self
end


-- throws Exception
function AllMotionRectangles:createMotionRectangles(imageComparisonInfo)
        local vector = imageComparisonInfo:getNonMatchingPixelVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local pixelDelta = vector:get(index)
            self:addPixelDeltaToAMotionRectangle(pixelDelta)
        end
end


-- throws Exception
function AllMotionRectangles:addPixelDeltaToExistingMotionRectangle(pixelDelta)
        local vector = self:getVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local motionRectangle = vector:get(index)
            if self:shouldPixelDeltaPartOfMotionRectangle(motionRectangle, pixelDelta) then
                local newWidth = pixelDelta:getPoint():getX() - motionRectangle:getRectangle().x
                local newHeight = pixelDelta:getPoint():getY() - motionRectangle:getRectangle().y
                if newWidth < motionRectangle:getRectangle().width then
                    newWidth = motionRectangle:getRectangle().width
                end
                if newHeight < motionRectangle:getRectangle().height then
                    newHeight = motionRectangle:getRectangle().height
                end
                motionRectangle:getRectangle():setSize(newWidth, newHeight)
                return true
            end
        end
        return false
end


-- throws Exception
function AllMotionRectangles:addPixelDeltaToAMotionRectangle(pixelDelta)
        if not self:addPixelDeltaToExistingMotionRectangle(pixelDelta) then
            local newRectangle = Rectangle.new(pixelDelta:getPoint():getX(), pixelDelta:getPoint():getY(), 1, 1)
            local motionRectangle = MotionRectangle.new(newRectangle)
            motionRectangle:getPixelDeltaVector():add(pixelDelta)
            self:getVector():add(motionRectangle)
        end
end


-- throws Exception
function AllMotionRectangles:shouldPixelDeltaPartOfMotionRectangle(motionRectangle, pixelDelta)
        local isPixelLeftOfTheRectangle = false
        if motionRectangle:getRectangle().y > pixelDelta:getPoint():getY() then
            error(java_exception("Exception", "PixelAboveTheRectangle"), 0)
        end
        if motionRectangle:getRectangle().x > pixelDelta:getPoint():getX() then
            isPixelLeftOfTheRectangle = true
        end
        if not isPixelLeftOfTheRectangle then
            return self:isPixelDeltaLikelyPartOfMotionRectangle(motionRectangle, pixelDelta)
        end
        return false
end


-- throws Exception
function AllMotionRectangles:isPixelDeltaLikelyPartOfMotionRectangle(motionRectangle, pixelDelta)
        local maxX = motionRectangle:getRectangle().x + motionRectangle:getRectangle().width
        local maxY = motionRectangle:getRectangle().y + motionRectangle:getRectangle().height
        local horizontalDistance = pixelDelta:getPoint():getX() - maxX
        local verticalDistance = pixelDelta:getPoint():getY() - maxY
        if horizontalDistance < self.MAX_PIXEL_DISTANCE_THRESHOLD and verticalDistance < self.MAX_PIXEL_DISTANCE_THRESHOLD then
            return true
        end
        return false
end

AllMotionRectangles.NAME = "allMotionRectangles_"

return AllMotionRectangles

