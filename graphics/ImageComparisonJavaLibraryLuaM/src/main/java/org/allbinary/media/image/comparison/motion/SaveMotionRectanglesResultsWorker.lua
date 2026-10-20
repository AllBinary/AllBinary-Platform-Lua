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
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local MotionRectanglesResultsListener = require("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SaveMotionRectanglesResultsWorker = {}
SaveMotionRectanglesResultsWorker.__index = SaveMotionRectanglesResultsWorker
SaveMotionRectanglesResultsWorker.className = "SaveMotionRectanglesResultsWorker"

function SaveMotionRectanglesResultsWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.running = false
    self.motionRectanglesVector = nil
end


function SaveMotionRectanglesResultsWorker.new()
    local self = setmetatable({}, SaveMotionRectanglesResultsWorker)
    self:_init_fields()
        self.motionRectanglesVector = BasicArrayListD.new()
    return self
end


function SaveMotionRectanglesResultsWorker:getMotionRectanglesVector()
        return self.motionRectanglesVector
end


function SaveMotionRectanglesResultsWorker:onMotionRectanglesImageComparisonResultsEvent(motionRectanglesResultsEvent)
        self:getMotionRectanglesVector():add(motionRectanglesResultsEvent)
        self:run()
end


function SaveMotionRectanglesResultsWorker:onEvent(allBinaryEventObject)
        self:onMotionRectanglesImageComparisonResultsEvent(allBinaryEventObject)
end


function SaveMotionRectanglesResultsWorker:isRunning()
        return self.running
end


function SaveMotionRectanglesResultsWorker:setRunning(running)
        self.running = running
end


function SaveMotionRectanglesResultsWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local motionRectanglesResultsEvent = self:getMotionRectanglesVector():get(0)
            local motionRectangles = motionRectanglesResultsEvent:getMotionRectangles()
            MotionRectanglesImageInputOutput.new():save(motionRectangles, motionRectanglesResultsEvent:getFrame())
            self:getMotionRectanglesVector():remove(motionRectangles)
            self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return SaveMotionRectanglesResultsWorker

