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
-- package org.allbinary.android.api5

local Activity = require("android.app.Activity")
local TouchScreenTypeFactory = require("org.allbinary.input.motion.button.TouchScreenTypeFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local ActivityFractureUtilAPI1 = require("org.allbinary.android.api1.ActivityFractureUtilAPI1")
local TouchScreenFactory = require("org.allbinary.input.motion.button.TouchScreenFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ActivityFractureUtilAPI5 = {}
ActivityFractureUtilAPI5.__index = ActivityFractureUtilAPI5
ActivityFractureUtilAPI5.className = "ActivityFractureUtilAPI5"
setmetatable(ActivityFractureUtilAPI5, {__index = ActivityFractureUtilAPI1})

function ActivityFractureUtilAPI5:_init_fields()
    self.FEATURE_TOUCHSCREEN_MULTITOUCH = "android.hardware.touchscreen.multitouch"
    self.FEATURE_TOUCHSCREEN = "android.hardware.touchscreen"
    self.FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT = "android.hardware.touchscreen.multitouch.distinct"
end

function ActivityFractureUtilAPI5.new()
    local self = setmetatable(ActivityFractureUtilAPI1.new(), ActivityFractureUtilAPI5)
    self:_init_fields()
    return self
end


function ActivityFractureUtilAPI5.getInstance()
        return ActivityFractureUtilAPI5.instance5
end


function ActivityFractureUtilAPI5:process(activity)
        local touchScreenFactory = TouchScreenFactory.getInstance()
        local touchScreenTypeFactory = TouchScreenTypeFactory.getInstance()
        touchScreenFactory:setTouch(self:isTouch(activity))
        touchScreenFactory:setMultiTouch(self:isMultiTouch(activity))
        touchScreenFactory:setMultiTouchDistinct(self:isMultiTouchDistinct(activity))
        touchScreenTypeFactory:update(activity)
        local commonStrings = CommonStrings.getInstance()
        PreLogUtil.put(tostring(touchScreenFactory), self, commonStrings.PROCESS)
end


function ActivityFractureUtilAPI5:isTouch(activity)
        return self:isFeature(activity, self.FEATURE_TOUCHSCREEN)
end


function ActivityFractureUtilAPI5:isMultiTouch(activity)
        return self:isFeature(activity, self.FEATURE_TOUCHSCREEN_MULTITOUCH)
end


function ActivityFractureUtilAPI5:isMultiTouchDistinct(activity)
        return self:isFeature(activity, self.FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT)
end


function ActivityFractureUtilAPI5:isFeature(activity, property)
        return activity:getPackageManager():hasSystemFeature(property)
end

ActivityFractureUtilAPI5.instance5 = ActivityFractureUtilAPI5.new()

return ActivityFractureUtilAPI5

