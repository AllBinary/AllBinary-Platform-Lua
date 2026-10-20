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
-- package org.allbinary.media.image.search

-- local BufferedImage = require("java.awt.image.BufferedImage")
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

local ImageComparisonSearchWorker = {}
ImageComparisonSearchWorker.__index = ImageComparisonSearchWorker
ImageComparisonSearchWorker.className = "ImageComparisonSearchWorker"
setmetatable(ImageComparisonSearchWorker, {__index = BasicEventHandler})

function ImageComparisonSearchWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageComparisonInfoVector = nil
    self.index = 0
    self.running = false
    self.imageSearchConstraintsInterface = nil
end


function ImageComparisonSearchWorker.new(imageSearchConstraintsInterface)
    local self = setmetatable(BasicEventHandler.new(), ImageComparisonSearchWorker)
    self:_init_fields()
        self.imageComparisonInfoVector = BasicArrayListD.new()
        self.imageSearchConstraintsInterface = imageSearchConstraintsInterface
    return self
end


function ImageComparisonSearchWorker:onImageComparisonResultsEvent(imageComparisonResultsEvent)
        self.imageComparisonInfoVector:add(imageComparisonResultsEvent:getImageComparisonResult())
        self:run()
end


function ImageComparisonSearchWorker:onEvent(allBinaryEventObject)
        self:onImageComparisonResultsEvent(allBinaryEventObject)
end


function ImageComparisonSearchWorker:isRunning()
        return self.running
end


function ImageComparisonSearchWorker:setRunning(running)
        self.running = running
end


function ImageComparisonSearchWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local imageComparisonInfo = self.imageComparisonInfoVector:get(0)
            self.logUtil:putF(tostring(imageComparisonInfo), self, self.commonStrings.RUN)
            local latestBufferedImage = imageComparisonInfo:getBufferedImages()[2]
            self.imageComparisonInfoVector:remove(imageComparisonInfo)
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

return ImageComparisonSearchWorker

