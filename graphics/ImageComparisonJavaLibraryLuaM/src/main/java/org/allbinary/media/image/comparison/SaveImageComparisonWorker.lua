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
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ImageComparisonResultsListener = require("org.allbinary.media.image.comparison.ImageComparisonResultsListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SaveImageComparisonWorker = {}
SaveImageComparisonWorker.__index = SaveImageComparisonWorker
SaveImageComparisonWorker.className = "SaveImageComparisonWorker"

function SaveImageComparisonWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.running = false
    self.imageComparisonInfoVector = BasicArrayListD.new()
end


function SaveImageComparisonWorker.new()
    local self = setmetatable({}, SaveImageComparisonWorker)
    self:_init_fields()
    return self
end


function SaveImageComparisonWorker:onImageComparisonResultsEvent(imageComparisonResultsEvent)
        self.imageComparisonInfoVector:add(imageComparisonResultsEvent)
        self:run()
end


function SaveImageComparisonWorker:onEvent(allBinaryEventObject)
        self:onImageComparisonResultsEvent(allBinaryEventObject)
end


function SaveImageComparisonWorker:isRunning()
        return self.running
end


function SaveImageComparisonWorker:setRunning(running)
        self.running = running
end


function SaveImageComparisonWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local imageComparisonResultsEvent = self.imageComparisonInfoVector:get(0)
            local imageComparisonInfo = imageComparisonResultsEvent:getImageComparisonResult()
            self.logUtil:putF(tostring(imageComparisonInfo), self, self.commonStrings.RUN)
            ComparisonImageInputOutput.new():save(imageComparisonInfo, imageComparisonInfo:getFrameTwo())
            self.imageComparisonInfoVector:remove(imageComparisonInfo)
            self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return SaveImageComparisonWorker

