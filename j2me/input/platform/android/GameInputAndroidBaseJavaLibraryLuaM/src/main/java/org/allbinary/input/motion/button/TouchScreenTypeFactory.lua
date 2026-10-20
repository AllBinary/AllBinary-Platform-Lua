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
-- package org.allbinary.input.motion.button

local Activity = require("android.app.Activity")
local Configuration = require("android.content.res.Configuration")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchScreenTypeFactory = {}
TouchScreenTypeFactory.__index = TouchScreenTypeFactory
TouchScreenTypeFactory.className = "TouchScreenTypeFactory"

function TouchScreenTypeFactory.new()
    local self = setmetatable({}, TouchScreenTypeFactory)
    return self
end


function TouchScreenTypeFactory.getInstance()
        return TouchScreenTypeFactory.instance
end


function TouchScreenTypeFactory:update(activity)
        local commonStrings = CommonStrings.getInstance()
        local touchScreenFactory = TouchScreenFactory.getInstance()
        local touchScreenTypesFactory = TouchScreenTypesFactory.getInstance()
        local configuration = activity:getResources():getConfiguration()
        local touchScreen = configuration.touchscreen
        if touchScreen == Configuration.TOUCHSCREEN_FINGER then
            touchScreenFactory:setTouchScreenType(touchScreenTypesFactory.FINGER)
            if not touchScreenFactory:isTouch() then
                PreLogUtil.put("Not Really Exception: This indicates that a touch screen does exist but is not API8 so we will try it", self, commonStrings.PROCESS)
                touchScreenFactory:setTouch(true)
            end
        elseif touchScreen == Configuration.TOUCHSCREEN_STYLUS then
            touchScreenFactory:setTouchScreenType(touchScreenTypesFactory.STYLUS)
            if not touchScreenFactory:isTouch() then
                PreLogUtil.put("Not Really Exception: This indicates that a touch screen does exist but is not API8 so we will try it", self, commonStrings.PROCESS)
                touchScreenFactory:setTouch(true)
            end
        elseif touchScreen == Configuration.TOUCHSCREEN_NOTOUCH then
            touchScreenFactory:setTouchScreenType(touchScreenTypesFactory.NOTOUCH)
        elseif touchScreen == Configuration.TOUCHSCREEN_UNDEFINED then
            touchScreenFactory:setTouchScreenType(touchScreenTypesFactory.UNDEFINED)
        end
end

TouchScreenTypeFactory.instance = TouchScreenTypeFactory.new()

return TouchScreenTypeFactory

