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

local PrimitiveLongSingleton = require("org.allbinary.logic.math.PrimitiveLongSingleton")
local ScaleFactorFactory = require("org.allbinary.logic.math.ScaleFactorFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
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

local BaseGameStatistics = {}
BaseGameStatistics.__index = BaseGameStatistics
BaseGameStatistics.className = "BaseGameStatistics"

function BaseGameStatistics:_init_fields()
    self.timeDelayHelper = TimeDelayHelper.new(Integer.MAX_VALUE)
    self.updateDelayHelper = TimeDelayHelper.new(2000)
    self.totalRefreshes = 0
    self.totalFrames = 0
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.DEFAULT_SCALE_FACTOR = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR
    self.NOT = "Not enough Time to Calculate"
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.STRING_ARRAY = {" Total Time: ", self.EMPTY_STRING, " Total Frames: ", self.EMPTY_STRING, " Frames/10 Sec: ", self.EMPTY_STRING, " Total Paints: ", self.EMPTY_STRING, " Paints/10 Sec: ", self.EMPTY_STRING}
    self.SPACE_CHAR = " "
    self.PLUS_CHAR = "+"
    self.X_CHAR = "X"
    self.CHAR_ARRAY = {{"F", "r", "a", "m", "e", "s", "/", "1", "0", " ", "S", "e", "c", ":"}, {"X", "X"}, {"P", "a", "i", "n", "t", "s", "/", "1", "0", " ", "S", "e", "c", ":"}, {"X", "X"}}
    self.primitiveLongSingleton = PrimitiveLongSingleton.getInstance()
end


function BaseGameStatistics.new()
    local self = setmetatable({}, BaseGameStatistics)
    self:_init_fields()
    return self
end


function BaseGameStatistics:init()
        self.timeDelayHelper:setStartTimeTNT()
        self.totalRefreshes = 0
        self.totalFrames = 0
end


function BaseGameStatistics:add(string)
end


function BaseGameStatistics:process()
end


function BaseGameStatistics:nextFrame()
        self.totalFrames = self.totalFrames + 1
end


function BaseGameStatistics:nextRefresh()
        self.totalRefreshes = self.totalRefreshes + 1
end


function BaseGameStatistics:getRefreshRate()
        local elapsed = self.timeDelayHelper:getElapsed(self.gameTickTimeDelayHelper.startTime)
        if elapsed > 1 then
            local time = (java_idiv(self.totalRefreshes, (((elapsed) // (1 << (self.DEFAULT_SCALE_FACTOR))))))
            return time
        else
            return 0
        end
end


function BaseGameStatistics:getTimeDelayHelper()
        return self.timeDelayHelper
end


function BaseGameStatistics:to2DCharArray()
        local totalTime = self.timeDelayHelper:getElapsed(self.gameTickTimeDelayHelper.startTime)
        totalTime = (((totalTime) // (1 << (self.DEFAULT_SCALE_FACTOR))))
        if totalTime > 0 and self.updateDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            local framesPerSec = (java_idiv(self.totalFrames, totalTime))
            if framesPerSec < 10 then
                self.CHAR_ARRAY[2][1] = self.SPACE_CHAR
                self.CHAR_ARRAY[2][2] = self.primitiveLongSingleton.NUMBER_CHAR_ARRAY[framesPerSec + 1]
            elseif framesPerSec < 100 then
                local tens = java_idiv(framesPerSec, 10)
                local removeTens = tens * 10
                self.CHAR_ARRAY[2][1] = self.primitiveLongSingleton.NUMBER_CHAR_ARRAY[tens + 1]
                self.CHAR_ARRAY[2][2] = self.primitiveLongSingleton.NUMBER_CHAR_ARRAY[framesPerSec - removeTens + 1]
            else
                self.CHAR_ARRAY[2][1] = self.PLUS_CHAR
                self.CHAR_ARRAY[2][2] = self.PLUS_CHAR
            end
            local refreshesPerSec = (java_idiv(self.totalRefreshes, totalTime))
            if refreshesPerSec < 10 then
                self.CHAR_ARRAY[4][1] = self.X_CHAR
                self.CHAR_ARRAY[4][2] = self.primitiveLongSingleton.NUMBER_CHAR_ARRAY[refreshesPerSec + 1]
            elseif refreshesPerSec < 100 then
                local tens = java_idiv(refreshesPerSec, 10)
                local removeTens = tens * 10
                self.CHAR_ARRAY[4][1] = self.primitiveLongSingleton.NUMBER_CHAR_ARRAY[java_idiv(refreshesPerSec, 10) + 1]
                self.CHAR_ARRAY[4][2] = self.primitiveLongSingleton.NUMBER_CHAR_ARRAY[refreshesPerSec - removeTens + 1]
            else
                self.CHAR_ARRAY[4][1] = self.PLUS_CHAR
                self.CHAR_ARRAY[4][2] = self.PLUS_CHAR
            end
        end
        return self.CHAR_ARRAY
end


function BaseGameStatistics:toStringArray()
        local totalTime = self.timeDelayHelper:getElapsed(self.gameTickTimeDelayHelper.startTime)
        totalTime = (java_idiv(totalTime, 10000))
        if totalTime > 0 then
            self.STRING_ARRAY[2] = tostring(totalTime)
            self.STRING_ARRAY[4] = tostring(self.totalFrames)
            self.STRING_ARRAY[6] = tostring(java_idiv(self.totalFrames, totalTime))
            self.STRING_ARRAY[8] = tostring(self.totalRefreshes)
            self.STRING_ARRAY[10] = tostring(java_idiv(self.totalRefreshes, totalTime))
        else
            local string = self.EMPTY_STRING
            self.STRING_ARRAY[2] = string
            self.STRING_ARRAY[4] = string
            self.STRING_ARRAY[6] = string
            self.STRING_ARRAY[8] = string
            self.STRING_ARRAY[10] = string
        end
        return self.STRING_ARRAY
end


function BaseGameStatistics:toStringAt(totalTime)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.STRING_ARRAY[1])
        stringBuffer:appendlong(totalTime)
        stringBuffer:append(self.STRING_ARRAY[3])
        stringBuffer:appendlong(self.totalFrames)
        stringBuffer:append(self.STRING_ARRAY[5])
        stringBuffer:appendlong(java_idiv(self.totalFrames, totalTime))
        if self.totalRefreshes > 0 then
            stringBuffer:append(self.STRING_ARRAY[7])
            stringBuffer:appendlong(self.totalRefreshes)
            stringBuffer:append(self.STRING_ARRAY[9])
            stringBuffer:appendlong(java_idiv(self.totalRefreshes, totalTime))
            stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        end
        return tostring(stringBuffer)
end


function BaseGameStatistics:toString()
        local totalTime = self.timeDelayHelper:getElapsed(self.gameTickTimeDelayHelper.startTime)
        totalTime = (java_idiv(totalTime, 1000))
        if totalTime > 0 then
            return self:toStringAt(totalTime)
        else
            return self.NOT
        end
end
BaseGameStatistics.__tostring = function(self) return self:toString() end

return BaseGameStatistics

