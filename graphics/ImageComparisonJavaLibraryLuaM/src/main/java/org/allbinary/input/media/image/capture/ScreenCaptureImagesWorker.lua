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
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local BufferedImageFrameCacheable = require("org.allbinary.media.image.cache.BufferedImageFrameCacheable")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local CaptureWorkerInterface = require("org.allbinary.input.media.image.capture.CaptureWorkerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScreenCaptureImagesWorker = {}
ScreenCaptureImagesWorker.__index = ScreenCaptureImagesWorker
ScreenCaptureImagesWorker.className = "ScreenCaptureImagesWorker"
setmetatable(ScreenCaptureImagesWorker, {__index = BasicEventHandler})

function ScreenCaptureImagesWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.running = false
    self.screenScavangerRobot = nil
end


function ScreenCaptureImagesWorker.new()
    local self = setmetatable(BasicEventHandler.new(), ScreenCaptureImagesWorker)
    self:_init_fields()
        self.screenScavangerRobot = ScreenScavangerRobot.new()
        ScreenCaptureImagesWorker.index = ProcessingFrameIndexFactory.next()
    return self
end


function ScreenCaptureImagesWorker:isRunning()
        return self.running
end


function ScreenCaptureImagesWorker:setRunning(running)
        self.running = running
end


-- throws Exception
function ScreenCaptureImagesWorker:setThread(thread)
end


function ScreenCaptureImagesWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            while self:isRunning() do
                timeHelper:setStartTimeTNT()
                local bufferedImage = self.screenScavangerRobot:getScreenAsBufferedImages()[1]
                local frame = ScreenCaptureImagesWorker.index
                ScreenCaptureImagesWorker.index = ScreenCaptureImagesWorker.index + 1
                CapturedBufferedImagesCacheSingleton.getInstance():add(BufferedImageFrameCacheable.new(bufferedImage, frame))
                local capturedImageEvent = CapturedImageWorkerResultsEvent.new(self, frame, bufferedImage)
                self:fireEvent(capturedImageEvent)
                self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
                self:setRunning(false)
            end
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

ScreenCaptureImagesWorker.index = nil

return ScreenCaptureImagesWorker

