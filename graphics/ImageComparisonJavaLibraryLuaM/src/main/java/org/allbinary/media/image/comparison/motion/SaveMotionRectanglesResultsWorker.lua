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

local SaveMotionRectanglesResultsWorker = {}
package.loaded["org.allbinary.media.image.comparison.motion.SaveMotionRectanglesResultsWorker"] = SaveMotionRectanglesResultsWorker

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local MotionRectanglesResultsListener = require("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsListener")
local MotionRectangles = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangles")
local MotionRectanglesImageInputOutput = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesImageInputOutput")
local MotionRectanglesResultsEvent = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsEvent")

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

-- class table SaveMotionRectanglesResultsWorker is declared before the requires
SaveMotionRectanglesResultsWorker.__index = SaveMotionRectanglesResultsWorker
SaveMotionRectanglesResultsWorker.className = "SaveMotionRectanglesResultsWorker"
SaveMotionRectanglesResultsWorker.javaClassName = "org.allbinary.media.image.comparison.motion.SaveMotionRectanglesResultsWorker"
SaveMotionRectanglesResultsWorker.java_implements = " MotionRectanglesResultsListener "
SaveMotionRectanglesResultsWorker.java_interfaces = function() return {MotionRectanglesResultsListener} end

function SaveMotionRectanglesResultsWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.running == nil then self.running = false end
    if self.motionRectanglesVector == nil then self.motionRectanglesVector = nil end
end


function SaveMotionRectanglesResultsWorker._jinit(self)
    SaveMotionRectanglesResultsWorker._init_fields(self)
        self.motionRectanglesVector = BasicArrayListD.new()
    return self
end

function SaveMotionRectanglesResultsWorker.new(...)
    local self = setmetatable({}, SaveMotionRectanglesResultsWorker)
    SaveMotionRectanglesResultsWorker._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return SaveMotionRectanglesResultsWorker

