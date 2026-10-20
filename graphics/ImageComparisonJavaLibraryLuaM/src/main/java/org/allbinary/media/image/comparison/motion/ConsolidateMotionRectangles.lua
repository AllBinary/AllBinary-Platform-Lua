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
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local MotionRectangles = require("org.allbinary.media.image.comparison.motion.MotionRectangles")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ConsolidateMotionRectangles = {}
ConsolidateMotionRectangles.__index = ConsolidateMotionRectangles
ConsolidateMotionRectangles.className = "ConsolidateMotionRectangles"
setmetatable(ConsolidateMotionRectangles, {__index = MotionRectangles})

function ConsolidateMotionRectangles:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ConsolidateMotionRectangles.new(motionRectangles)
    local self = setmetatable(MotionRectangles.new(ConsolidateMotionRectangles.NAME, motionRectangles:getImageComparisonResult()), ConsolidateMotionRectangles)
    self:_init_fields()
        -- super(...) made self above
        local vector = motionRectangles:getVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local motionRectangle = vector:get(index)
            vector:add(motionRectangle:clone())
        end
        self:consolidateMotionRectangles()
    return self
end


function ConsolidateMotionRectangles:consolidateMotionRectangles()
        local vector = self:getVector()
        self.logUtil:putF("Start - Size Before: " .. tostring(vector:size()), self, "consolidateMotionRectangleConstraints")
        local removeVector = BasicArrayListD.new()
        local size = vector:size()
        for index = 0, size - 1 do
            local motionRectangle = vector:get(index)
            for i = index + 1, vector:size() - 1 do
                local motionRectangle2 = vector:get(i)
                local rectangle = motionRectangle:getRectangle()
                local rectangle2 = motionRectangle2:getRectangle()
                local x2 = rectangle.x + rectangle.width
                local y2 = rectangle.y + rectangle.height
                local rightX = rectangle2.x + rectangle2.width
                local bottomY = rectangle2.y + rectangle2.height
                if rectangle.x <= rectangle2.x and rectangle.y <= rectangle2.y and x2 >= rightX and y2 >= bottomY then
                    removeVector:add(motionRectangle2)
                end
            end
        end
        self:remove(removeVector)
end


function ConsolidateMotionRectangles:remove(removeVector)
        local vector = self:getVector()
        local size = removeVector:size()
        for index = 0, size - 1 do
            vector:remove(removeVector:get(index))
        end
end

ConsolidateMotionRectangles.NAME = "consolidatedMotionRectangles_"

return ConsolidateMotionRectangles

