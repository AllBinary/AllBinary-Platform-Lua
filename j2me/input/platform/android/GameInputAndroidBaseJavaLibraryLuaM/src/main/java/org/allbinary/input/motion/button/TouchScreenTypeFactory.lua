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

local TouchScreenTypeFactory = {}
package.loaded["org.allbinary.input.motion.button.TouchScreenTypeFactory"] = TouchScreenTypeFactory

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

local Activity = java_lazy("android.app.Activity")
local Configuration = java_lazy("android.content.res.Configuration")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")

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

-- class table TouchScreenTypeFactory is declared before the requires
TouchScreenTypeFactory.__index = TouchScreenTypeFactory
TouchScreenTypeFactory.className = "TouchScreenTypeFactory"
TouchScreenTypeFactory.javaClassName = "org.allbinary.input.motion.button.TouchScreenTypeFactory"

function TouchScreenTypeFactory._jinit(self)
    return self
end

function TouchScreenTypeFactory.new()
    return TouchScreenTypeFactory._jinit(setmetatable({}, TouchScreenTypeFactory))
end


function TouchScreenTypeFactory.getInstance()
        return TouchScreenTypeFactory.instance_f
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

TouchScreenTypeFactory.instance_f = TouchScreenTypeFactory.new()

return TouchScreenTypeFactory

