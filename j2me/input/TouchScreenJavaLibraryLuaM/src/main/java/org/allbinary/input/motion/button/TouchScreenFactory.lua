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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchScreenFactory = {}
TouchScreenFactory.__index = TouchScreenFactory
TouchScreenFactory.className = "TouchScreenFactory"

function TouchScreenFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.touch = false
    self.multiTouch = false
    self.multiTouchDistinct = false
    self.touchScreenType = TouchScreenTypesFactory.getInstance().NOTOUCH
end


function TouchScreenFactory.new()
    local self = setmetatable({}, TouchScreenFactory)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self:setTouch(true)
            self:setMultiTouch(false)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, TouchScreenFactory.SINGLETON, commonStrings.GET_INSTANCE, e)
        end
    return self
end


function TouchScreenFactory.getInstance()
        return TouchScreenFactory.SINGLETON
end


function TouchScreenFactory:setMultiTouch(multiTouch)
        self.multiTouch = multiTouch
end


function TouchScreenFactory:isMultiTouch()
        return self.multiTouch
end


function TouchScreenFactory:setTouch(touch)
        self.touch = touch
end


function TouchScreenFactory:isTouch()
        return self.touch
end


function TouchScreenFactory:setMultiTouchDistinct(multiTouchDistinct)
        self.multiTouchDistinct = multiTouchDistinct
end


function TouchScreenFactory:isMultiTouchDistinct()
        return self.multiTouchDistinct
end


function TouchScreenFactory:setTouchScreenType(touchScreenType)
        self.touchScreenType = touchScreenType
end


function TouchScreenFactory:getTouchScreenType()
        return self.touchScreenType
end


function TouchScreenFactory:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("TouchScreen: ")
        stringBuffer:appendboolean(self:isTouch())
        stringBuffer:append(" MultiTouch: ")
        stringBuffer:appendboolean(self:isMultiTouch())
        stringBuffer:append(" Distinct MultiTouch: ")
        stringBuffer:appendboolean(self:isMultiTouchDistinct())
        stringBuffer:append(" TouchScreenType: ")
        stringBuffer:append(StringUtil.getInstance():toString(self:getTouchScreenType()))
        return tostring(stringBuffer)
end
TouchScreenFactory.__tostring = function(self) return self:toString() end

TouchScreenFactory.SINGLETON = TouchScreenFactory.new()

return TouchScreenFactory

