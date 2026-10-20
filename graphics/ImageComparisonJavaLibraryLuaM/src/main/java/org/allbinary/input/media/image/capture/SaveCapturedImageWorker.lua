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
-- package org.allbinary.input.media.image.capture

-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local CapturedImageWorkerResultsListener = require("org.allbinary.input.media.image.capture.CapturedImageWorkerResultsListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SaveCapturedImageWorker = {}
SaveCapturedImageWorker.__index = SaveCapturedImageWorker
SaveCapturedImageWorker.className = "SaveCapturedImageWorker"
setmetatable(SaveCapturedImageWorker, {__index = BasicEventHandler})

function SaveCapturedImageWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.running = false
    self.capturedImageWorkerResultsEventVector = BasicArrayListD.new()
end


function SaveCapturedImageWorker.new()
    local self = setmetatable(BasicEventHandler.new(), SaveCapturedImageWorker)
    self:_init_fields()
    return self
end


function SaveCapturedImageWorker:isRunning()
        return self.running
end


function SaveCapturedImageWorker:setRunning(running)
        self.running = running
end


function SaveCapturedImageWorker:onCaptureEvent(capturedImageEvent)
        self.capturedImageWorkerResultsEventVector:add(capturedImageEvent)
        self:run()
end


function SaveCapturedImageWorker:onEvent(allBinaryEventObject)
        self:onCaptureEvent(allBinaryEventObject)
end


function SaveCapturedImageWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local capturedImageWorkerResultsEvent = (self.capturedImageWorkerResultsEventVector:get(0))
            local screenBufferedImage = capturedImageWorkerResultsEvent:getBufferedImage()
            CapturedImageInputOutput.new():save(screenBufferedImage, capturedImageWorkerResultsEvent:getFrame())
            self.capturedImageWorkerResultsEventVector:remove(capturedImageWorkerResultsEvent)
            self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
            self:setRunning(false)
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return SaveCapturedImageWorker

