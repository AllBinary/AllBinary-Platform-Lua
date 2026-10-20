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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local ImageComparisonResult = require("org.allbinary.media.image.comparison.ImageComparisonResult")
local ImageComparisonResultsEvent = require("org.allbinary.media.image.comparison.ImageComparisonResultsEvent")
local ImageComparisonResultsListener = require("org.allbinary.media.image.comparison.ImageComparisonResultsListener")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionRectanglesWorker = {}
MotionRectanglesWorker.__index = MotionRectanglesWorker
MotionRectanglesWorker.className = "MotionRectanglesWorker"
setmetatable(MotionRectanglesWorker, {__index = BasicEventHandler})

function MotionRectanglesWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageComparisonInfoVector = BasicArrayListD.new()
    self.motionRectangleConstraintsInterface = nil
    self.index = 0
    self.running = false
end


function MotionRectanglesWorker.new(motionRectangleConstraintsInterface)
    local self = setmetatable(BasicEventHandler.new(), MotionRectanglesWorker)
    self:_init_fields()
        self.motionRectangleConstraintsInterface = motionRectangleConstraintsInterface
    return self
end


function MotionRectanglesWorker:onImageComparisonResultsEvent(imageComparisonResultsEvent)
        self.imageComparisonInfoVector:add(imageComparisonResultsEvent)
        self:run()
end


function MotionRectanglesWorker:onEvent(allBinaryEventObject)
        self:onImageComparisonResultsEvent(allBinaryEventObject)
end


function MotionRectanglesWorker:isRunning()
        return self.running
end


function MotionRectanglesWorker:setRunning(running)
        self.running = running
end


function MotionRectanglesWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local imageComparisonResultsEvent = self.imageComparisonInfoVector:get(0)
            local imageComparisonInfo = imageComparisonResultsEvent:getImageComparisonResult()
            self.logUtil:putF(tostring(imageComparisonInfo), self, self.commonStrings.RUN)
            local allMotionRectangles = AllMotionRectangles.new(imageComparisonInfo)
            AllMotionRectanglesResultsCacheSingleton.getInstance():add(MotionRectanglesResultsFrameCacheable.new(allMotionRectangles, imageComparisonInfo:getFrameTwo()))
            local consolidatedMotionRectangles = ConsolidateMotionRectangles.new(allMotionRectangles)
            ConsolidatedMotionRectanglesResultsCacheSingleton.getInstance():add(MotionRectanglesResultsFrameCacheable.new(consolidatedMotionRectangles, imageComparisonInfo:getFrameTwo()))
            local constrainedMotionRectangles = ConstrainedMotionRectangles.new(self.motionRectangleConstraintsInterface, consolidatedMotionRectangles)
            constrainedMotionRectangles:applyMotionRectangleConstraints(consolidatedMotionRectangles)
            ConstrainedMotionRectanglesResultsCacheSingleton.getInstance():add(MotionRectanglesResultsFrameCacheable.new(constrainedMotionRectangles, imageComparisonInfo:getFrameTwo()))
            self:fireEvent(MotionRectanglesResultsEvent.new(self, imageComparisonInfo:getFrameTwo(), constrainedMotionRectangles))
            self.imageComparisonInfoVector:remove(imageComparisonResultsEvent)
            self.index = self.index + 1
            self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
            self:setRunning(false)
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return MotionRectanglesWorker

