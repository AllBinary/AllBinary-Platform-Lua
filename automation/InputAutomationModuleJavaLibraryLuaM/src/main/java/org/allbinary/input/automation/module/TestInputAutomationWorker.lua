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
-- package org.allbinary.input.automation.module

local ScreenCaptureImagesWorker = require("org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker")
local ImageComparisonWorker = require("org.allbinary.media.image.comparison.ImageComparisonWorker")
local SaveImageComparisonWorker = require("org.allbinary.media.image.comparison.SaveImageComparisonWorker")
local MotionRectanglesWorker = require("org.allbinary.media.image.comparison.motion.MotionRectanglesWorker")
local SaveMotionRectanglesResultsWorker = require("org.allbinary.media.image.comparison.motion.SaveMotionRectanglesResultsWorker")
local TestInputForMotionRectanglesResultsWorker = require("org.allbinary.media.image.comparison.motion.TestInputForMotionRectanglesResultsWorker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TestInputAutomationWorker = {}
TestInputAutomationWorker.__index = TestInputAutomationWorker
TestInputAutomationWorker.className = "TestInputAutomationWorker"

function TestInputAutomationWorker:_init_fields()
    self.captureWorker = nil
    self.imageComparisonWorker = nil
    self.motionRectanglesWorker = nil
    self.changedPixelsImageComparisonResultsWorker = nil
    self.saveMotionRectanglesAsImagesWorker = nil
    self.moveMouseToFirstMotionRectanglesResultsWorker = nil
end


function TestInputAutomationWorker.new()
    local self = setmetatable({}, TestInputAutomationWorker)
    self:_init_fields()
        self.captureWorker = ScreenCaptureImagesWorker.new()
        self.changedPixelsImageComparisonResultsWorker = SaveImageComparisonWorker.new()
        self.saveMotionRectanglesAsImagesWorker = SaveMotionRectanglesResultsWorker.new()
        self.moveMouseToFirstMotionRectanglesResultsWorker = TestInputForMotionRectanglesResultsWorker.new()
        self.motionRectanglesWorker:addListenerInterface(self.saveMotionRectanglesAsImagesWorker)
        self.motionRectanglesWorker:addListenerInterface(self.moveMouseToFirstMotionRectanglesResultsWorker)
        self.imageComparisonWorker:addListenerInterface(self.changedPixelsImageComparisonResultsWorker)
        self.imageComparisonWorker:addListenerInterface(self.motionRectanglesWorker)
        self.captureWorker:addListenerInterface(self.imageComparisonWorker)
    return self
end

return TestInputAutomationWorker

