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

local TestInputAutomationWorker = {}
package.loaded["org.allbinary.input.automation.module.TestInputAutomationWorker"] = TestInputAutomationWorker

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local ScreenCaptureImagesWorker = java_lazy("org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker")
local ImageComparisonWorker = java_lazy("org.allbinary.media.image.comparison.ImageComparisonWorker")
local SaveImageComparisonWorker = java_lazy("org.allbinary.media.image.comparison.SaveImageComparisonWorker")
local MotionRectanglesWorker = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesWorker")
local SaveMotionRectanglesResultsWorker = java_lazy("org.allbinary.media.image.comparison.motion.SaveMotionRectanglesResultsWorker")
local TestInputForMotionRectanglesResultsWorker = java_lazy("org.allbinary.media.image.comparison.motion.TestInputForMotionRectanglesResultsWorker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table TestInputAutomationWorker is declared before the requires
TestInputAutomationWorker.__index = TestInputAutomationWorker
TestInputAutomationWorker.className = "TestInputAutomationWorker"
TestInputAutomationWorker.javaClassName = "org.allbinary.input.automation.module.TestInputAutomationWorker"

function TestInputAutomationWorker:_init_fields()
    if self.captureWorker == nil then self.captureWorker = nil end
    if self.imageComparisonWorker == nil then self.imageComparisonWorker = nil end
    if self.motionRectanglesWorker == nil then self.motionRectanglesWorker = nil end
    if self.changedPixelsImageComparisonResultsWorker == nil then self.changedPixelsImageComparisonResultsWorker = nil end
    if self.saveMotionRectanglesAsImagesWorker == nil then self.saveMotionRectanglesAsImagesWorker = nil end
    if self.moveMouseToFirstMotionRectanglesResultsWorker == nil then self.moveMouseToFirstMotionRectanglesResultsWorker = nil end
end


function TestInputAutomationWorker._jinit(self)
    TestInputAutomationWorker._init_fields(self)
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

function TestInputAutomationWorker.new(...)
    local self = setmetatable({}, TestInputAutomationWorker)
    TestInputAutomationWorker._jinit(self, ...)
    return self
end

return TestInputAutomationWorker

