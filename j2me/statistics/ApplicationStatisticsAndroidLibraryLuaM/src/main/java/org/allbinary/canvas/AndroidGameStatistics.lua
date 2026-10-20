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
local BaseViewWrapper = require("org.allbinary.android.view.BaseViewWrapper")
local ViewWrapper = require("org.allbinary.android.view.ViewWrapper")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BaseGameStatistics = require("org.allbinary.canvas.BaseGameStatistics")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidGameStatistics = {}
AndroidGameStatistics.__index = AndroidGameStatistics
AndroidGameStatistics.className = "AndroidGameStatistics"
setmetatable(AndroidGameStatistics, {__index = BaseGameStatistics})

function AndroidGameStatistics:_init_fields()
    self.view = BaseViewWrapper.NULL_VIEW_WRAPPER
    self.totalOnDraws = 0
    self.ANDROID_STRING_ARRAY = java_new_array(nil, 14)
    self.TOTAL_ONDRAWS = " Total onDraws: "
    self.ONDRAWS_RATE = " onDraws(/10) Sec: "
end


function AndroidGameStatistics.new()
    local self = setmetatable(BaseGameStatistics.new(), AndroidGameStatistics)
    self:_init_fields()
        local stringUtil = StringUtil.getInstance()
        for index = 0, (self.ANDROID_STRING_ARRAY.n or #self.ANDROID_STRING_ARRAY) - 1 do
            self.ANDROID_STRING_ARRAY[index + 1] = stringUtil.EMPTY_STRING
        end
    return self
end


function AndroidGameStatistics:initView(view)
        BaseGameStatistics.init(self)
        self.view = ViewWrapper.new(view)
        self.totalOnDraws = 0
end


function AndroidGameStatistics:process()
        self.view:postInvalidate()
end


function AndroidGameStatistics:nextOnDraw()
        self.totalOnDraws = self.totalOnDraws + 1
end


function AndroidGameStatistics:toStringArray()
        local stringArray = BaseGameStatistics.toStringArray(self)
        for index = 0, (stringArray.n or #stringArray) - 1 do
            self.ANDROID_STRING_ARRAY[index + 1] = stringArray[index + 1]
        end
        local totalTime = self:getTimeDelayHelper():getElapsed(self.gameTickTimeDelayHelper.startTime)
        totalTime = (java_idiv(totalTime, 10000))
        self.ANDROID_STRING_ARRAY[11] = self.TOTAL_ONDRAWS
        self.ANDROID_STRING_ARRAY[12] = tostring(self.totalOnDraws)
        self.ANDROID_STRING_ARRAY[13] = self.ONDRAWS_RATE
        self.ANDROID_STRING_ARRAY[14] = tostring(java_idiv(self.totalOnDraws, totalTime))
        return self.ANDROID_STRING_ARRAY
end


function AndroidGameStatistics:toString()
        local totalTime = self:getTimeDelayHelper():getElapsed(self.gameTickTimeDelayHelper.startTime)
        totalTime = (java_idiv(totalTime, 1000))
        if totalTime > 0 then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(BaseGameStatistics.toStringAt(self, totalTime))
            if self.totalOnDraws > 0 then
                stringBuffer:append(self.TOTAL_ONDRAWS)
                stringBuffer:append(tostring(self.totalOnDraws))
                stringBuffer:append(self.ONDRAWS_RATE)
                local drawsOverTime = tostring(java_idiv(self.totalOnDraws, totalTime))
                stringBuffer:append(drawsOverTime)
            end
            return tostring(stringBuffer)
        else
            return self.NOT
        end
end
AndroidGameStatistics.__tostring = function(self) return self:toString() end

return AndroidGameStatistics

