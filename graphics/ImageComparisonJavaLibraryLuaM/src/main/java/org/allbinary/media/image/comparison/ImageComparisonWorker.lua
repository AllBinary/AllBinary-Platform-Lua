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
-- package org.allbinary.media.image.comparison

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CapturedImageWorkerResultsEvent = require("org.allbinary.input.media.image.capture.CapturedImageWorkerResultsEvent")
local CapturedImageWorkerResultsListener = require("org.allbinary.input.media.image.capture.CapturedImageWorkerResultsListener")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

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

local ImageComparisonWorker = {}
ImageComparisonWorker.__index = ImageComparisonWorker
ImageComparisonWorker.className = "ImageComparisonWorker"
setmetatable(ImageComparisonWorker, {__index = BasicEventHandler})

function ImageComparisonWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.bufferedImageVector = BasicArrayListD.new()
    self.imageComparatorConstraintsInterface = nil
    self.imageComparator = nil
    self.running = false
    self.index2 = 0
end


function ImageComparisonWorker.new(imageComparatorConstraintsInterface)
    local self = setmetatable(BasicEventHandler.new(), ImageComparisonWorker)
    self:_init_fields()
        self.imageComparatorConstraintsInterface = imageComparatorConstraintsInterface
        self.imageComparator = ImageComparator.new(imageComparatorConstraintsInterface)
    return self
end


function ImageComparisonWorker:isRunning()
        return self.running
end


function ImageComparisonWorker:setRunning(running)
        self.running = running
end


function ImageComparisonWorker:onCaptureEvent(capturedImageWorkerResultsEvent)
        self.bufferedImageVector:add(capturedImageWorkerResultsEvent)
        if self.bufferedImageVector:size() > 1 then
            self:run()
        end
end


function ImageComparisonWorker:onEvent(allBinaryEventObject)
        self:onCaptureEvent(allBinaryEventObject)
end


function ImageComparisonWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            if self.imageComparatorConstraintsInterface:isFrameAllowed(self.index2) then
                local capturedImageWorkerResultsEvent = java_new_array(nil, 2)
                capturedImageWorkerResultsEvent[1] = self.bufferedImageVector:get(0)
                capturedImageWorkerResultsEvent[2] = self.bufferedImageVector:get(1)
                if self.imageComparatorConstraintsInterface:isImageValid(capturedImageWorkerResultsEvent[1]:getBufferedImage()) and self.imageComparatorConstraintsInterface:isImageValid(capturedImageWorkerResultsEvent[2]:getBufferedImage()) then
                    local imageComparisonResult = self.imageComparator:compare(capturedImageWorkerResultsEvent[1]:getBufferedImage(), capturedImageWorkerResultsEvent[2]:getBufferedImage(), capturedImageWorkerResultsEvent[1]:getFrame(), capturedImageWorkerResultsEvent[2]:getFrame(), 0)
                    local frame = capturedImageWorkerResultsEvent[2]:getFrame()
                    local imageComparisonResultFrameCacheable = ImageComparisonResultFrameCacheable.new(imageComparisonResult, frame)
                    ImageComparisonResultCacheSingleton.getInstance():add(imageComparisonResultFrameCacheable)
                    self:fireEvent(ImageComparisonResultsEvent.new(self, imageComparisonResult))
                    self.logUtil:putF(tostring(StringMaker.new():append("Image Comparison Result: "):append(tostring(imageComparisonResult)):append(" for frame: "):appendlong(frame)), self, self.commonStrings.RUN)
                else
                    self.logUtil:putF("An Image Was Not Valid: Image Worker Event Processing terminated", self, self.commonStrings.RUN)
                end
            end
            self.bufferedImageVector:remove(0)
            self.index2 = self.index2 + 1
            local message = tostring(StringMaker.new():append("Frame: "):appendint(self.index2):append(CommonLabels.getInstance().ELAPSED):appendlong(java_int(timeHelper:getElapsedTNT())))
            self.logUtil:putF(message, self, self.commonStrings.RUN)
            self:setRunning(false)
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return ImageComparisonWorker

