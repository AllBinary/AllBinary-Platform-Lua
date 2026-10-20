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
-- package org.allbinary.input.automation.module.generic

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local File = require("java.io.File")
-- local ImageIO = require("javax.imageio.ImageIO")
local SavedCaptureGenericProfileDataWorkerType = require("org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType")
local CaptureWorkerInterface = require("org.allbinary.input.media.image.capture.CaptureWorkerInterface")
local CapturedBufferedImagesCacheSingleton = require("org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton")
local CapturedImageWorkerResultsEvent = require("org.allbinary.input.media.image.capture.CapturedImageWorkerResultsEvent")
local ProcessingFrameIndexFactory = require("org.allbinary.input.media.image.capture.ProcessingFrameIndexFactory")
local ScreenScavangerRobot = require("org.allbinary.input.media.image.capture.ScreenScavangerRobot")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LongUtil = require("org.allbinary.logic.java.number.LongUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local MediaDataFactory = require("org.allbinary.logic.visual.media.MediaDataFactory")
local BufferedImageFrameCacheable = require("org.allbinary.media.image.cache.BufferedImageFrameCacheable")
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

local SavedCaptureImagesWorker = {}
SavedCaptureImagesWorker.__index = SavedCaptureImagesWorker
SavedCaptureImagesWorker.className = "SavedCaptureImagesWorker"
setmetatable(SavedCaptureImagesWorker, {__index = BasicEventHandler})

function SavedCaptureImagesWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.running = false
    self.screenScavangerRobot = nil
    self.savedCaptureGenericProfileDataWorkerType = nil
end


function SavedCaptureImagesWorker.new(savedCaptureGenericProfileDataWorkerType)
    local self = setmetatable(BasicEventHandler.new(), SavedCaptureImagesWorker)
    self:_init_fields()
        self.savedCaptureGenericProfileDataWorkerType = savedCaptureGenericProfileDataWorkerType
        self.screenScavangerRobot = ScreenScavangerRobot.new()
        SavedCaptureImagesWorker.index = ProcessingFrameIndexFactory.next()
    return self
end


-- throws Exception
function SavedCaptureImagesWorker:setThread(thread)
end


function SavedCaptureImagesWorker:isRunning()
        return self.running
end


function SavedCaptureImagesWorker:setRunning(running)
        self.running = running
end


function SavedCaptureImagesWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            while self:isRunning() do
                timeHelper:setStartTimeTNT()
                local frame = SavedCaptureImagesWorker.index
                local filePathStringBuffer = StringMaker.new()
                filePathStringBuffer:append(self.savedCaptureGenericProfileDataWorkerType:getPath())
                filePathStringBuffer:append(LongUtil.fillIn(tostring(frame)))
                filePathStringBuffer:append(MediaDataFactory.getInstance().JPG:getExtension())
                local filePath = tostring(filePathStringBuffer)
                self.logUtil:putF("Loading Image File Path: " .. filePath, self, self.commonStrings.RUN)
                local file = File.new(filePath)
                if file:isFile() then
                    local bufferedImage = ImageIO.read(file)
                    SavedCaptureImagesWorker.index = SavedCaptureImagesWorker.index + 1
                    CapturedBufferedImagesCacheSingleton.getInstance():add(BufferedImageFrameCacheable.new(bufferedImage, frame))
                    local capturedImageEvent = CapturedImageWorkerResultsEvent.new(self, frame, bufferedImage)
                    self:fireEvent(capturedImageEvent)
                else
                    self.logUtil:putF("Could Not Load File: " .. filePath, self, self.commonStrings.RUN)
                end
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

SavedCaptureImagesWorker.index = nil

return SavedCaptureImagesWorker

