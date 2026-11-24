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
-- package org.allbinary.input

local TouchJ2ME = {}
package.loaded["org.allbinary.input.TouchJ2ME"] = TouchJ2ME

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

local AllMotionRecognizer = java_lazy("org.allbinary.input.motion.AllMotionRecognizer")
local BasicMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local GameMotionGestureListener = java_lazy("org.allbinary.input.motion.gesture.observer.GameMotionGestureListener")
local MotionGestureReceiveInterfaceFactory = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

--TouchJ2ME
-- class table TouchJ2ME is declared before the requires
TouchJ2ME.__index = TouchJ2ME
TouchJ2ME.className = "TouchJ2ME"
TouchJ2ME.javaClassName = "org.allbinary.input.TouchJ2ME"

function TouchJ2ME:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.DEVICE_ID = 0
    self.motionRecognizer = AllMotionRecognizer.new()
end


function TouchJ2ME._jinit(self)
    TouchJ2ME._init_fields(self)
        local motionGesturesHandler = self.motionRecognizer:getMotionGestureRecognizer():getMotionGesturesHandler()
        motionGesturesHandler:addListenerInterface(GameMotionGestureListener.new(MotionGestureReceiveInterfaceFactory.getInstance()))
    return self
end

function TouchJ2ME.new(...)
    local self = setmetatable({}, TouchJ2ME)
    TouchJ2ME._jinit(self, ...)
    return self
end


function TouchJ2ME:pointerDragged(x, y)
        local try_ok, try_error, try_value = pcall(function()
            self.motionRecognizer:processDraggedMotionEvent(x, y, self.DEVICE_ID, 0)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "pointerDragged", e)
        end
end


function TouchJ2ME:pointerPressed(x, y)
        local try_ok, try_error, try_value = pcall(function()
            self.motionRecognizer:processStartMotionEvent(x, y, self.DEVICE_ID, 0)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "pointerPressed", e)
        end
end


function TouchJ2ME:pointerReleased(x, y)
        local try_ok, try_error, try_value = pcall(function()
            self.motionRecognizer:processEndMotionEvent(x, y, self.DEVICE_ID, 0)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "pointerReleased", e)
        end
end

return TouchJ2ME

