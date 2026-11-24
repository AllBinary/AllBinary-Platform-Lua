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

local TouchScreenFactory = {}
package.loaded["org.allbinary.input.motion.button.TouchScreenFactory"] = TouchScreenFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TouchScreenType = java_lazy("org.allbinary.input.motion.button.TouchScreenType")
local TouchScreenTypesFactory = java_lazy("org.allbinary.input.motion.button.TouchScreenTypesFactory")

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

-- class table TouchScreenFactory is declared before the requires
TouchScreenFactory.__index = TouchScreenFactory
TouchScreenFactory.className = "TouchScreenFactory"
TouchScreenFactory.javaClassName = "org.allbinary.input.motion.button.TouchScreenFactory"

function TouchScreenFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.touch == nil then self.touch = false end
    if self.multiTouch == nil then self.multiTouch = false end
    if self.multiTouchDistinct == nil then self.multiTouchDistinct = false end
    self.touchScreenType = TouchScreenTypesFactory.getInstance().NOTOUCH
end


function TouchScreenFactory._jinit(self)
    TouchScreenFactory._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self:setTouch(true)
            self:setMultiTouch(false)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, TouchScreenFactory.SINGLETON, commonStrings.GET_INSTANCE, e)
        end
    return self
end

function TouchScreenFactory.new(...)
    local self = setmetatable({}, TouchScreenFactory)
    TouchScreenFactory._jinit(self, ...)
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

