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
-- package org.allbinary.canvas

local View = require("android.view.View")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AndroidGameStatistics = require("org.allbinary.canvas.AndroidGameStatistics")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProfilingRefreshHelper = {}
ProfilingRefreshHelper.__index = ProfilingRefreshHelper
ProfilingRefreshHelper.className = "ProfilingRefreshHelper"
setmetatable(ProfilingRefreshHelper, {__index = AndroidGameStatistics})

function ProfilingRefreshHelper:_init_fields()
    self.firstTime = true
    self.bestFrameProcessingTime = 0
    self.worstFrameProcessingTime = 0
    self.frameProcessingTimeElapsed = 0
end


function ProfilingRefreshHelper.getInstance()
        return ProfilingRefreshHelper.instance
end


function ProfilingRefreshHelper.new()
    local self = setmetatable(AndroidGameStatistics.new(), ProfilingRefreshHelper)
    self:_init_fields()
    return self
end


function ProfilingRefreshHelper:initView(view)
        AndroidGameStatistics.initView(self, view)
        self.frameProcessingTimeElapsed = self:getTimeDelayHelper():getStartTime()
        self.bestFrameProcessingTime = Integer.MAX_VALUE
        self.worstFrameProcessingTime = 0
end


function ProfilingRefreshHelper:nextFrame()
        self.frameProcessingTimeElapsed = math.floor(os.time() * 1000) - self.frameProcessingTimeElapsed
        if self.firstTime ~= true then
            if self.frameProcessingTimeElapsed > self.worstFrameProcessingTime then
                self.worstFrameProcessingTime = self.frameProcessingTimeElapsed
            end
            if self.frameProcessingTimeElapsed < self.bestFrameProcessingTime then
                self.bestFrameProcessingTime = self.frameProcessingTimeElapsed
            end
        else
            self.firstTime = false
        end
        AndroidGameStatistics.nextFrame(self)
end


function ProfilingRefreshHelper:toString()
        return tostring(StringMaker.new():append(tostring(AndroidGameStatistics)):append(" Worst: "):appendint(self.worstFrameProcessingTime):append(" Best: "):appendint(self.bestFrameProcessingTime))
end
ProfilingRefreshHelper.__tostring = function(self) return self:toString() end

ProfilingRefreshHelper.instance = ProfilingRefreshHelper.new()

return ProfilingRefreshHelper

