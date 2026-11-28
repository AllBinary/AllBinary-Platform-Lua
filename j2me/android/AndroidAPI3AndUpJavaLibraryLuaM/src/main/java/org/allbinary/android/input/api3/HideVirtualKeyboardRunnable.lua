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
-- package org.allbinary.android.input.api3

local HideVirtualKeyboardRunnable = {}
package.loaded["org.allbinary.android.input.api3.HideVirtualKeyboardRunnable"] = HideVirtualKeyboardRunnable

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
local Context = java_lazy("android.content.Context")
local IBinder = java_lazy("android.os.IBinder")
local View = java_lazy("android.view.View")
local InputMethodManager = java_lazy("android.view.inputmethod.InputMethodManager")
local ViewCompositeInterface = java_lazy("org.allbinary.android.activity.ViewCompositeInterface")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Runnable = require("java.lang.Runnable")

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

-- class table HideVirtualKeyboardRunnable is declared before the requires
HideVirtualKeyboardRunnable.__index = HideVirtualKeyboardRunnable
HideVirtualKeyboardRunnable.className = "HideVirtualKeyboardRunnable"
HideVirtualKeyboardRunnable.javaClassName = "org.allbinary.android.input.api3.HideVirtualKeyboardRunnable"
HideVirtualKeyboardRunnable.java_implements = " Runnable "
HideVirtualKeyboardRunnable.java_interfaces = function() return {Runnable} end

function HideVirtualKeyboardRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.activity == nil then self.activity = nil end
end


function HideVirtualKeyboardRunnable._jinit(self, activity)
    HideVirtualKeyboardRunnable._init_fields(self)
        self.activity = activity
    return self
end

function HideVirtualKeyboardRunnable.new(...)
    local self = setmetatable({}, HideVirtualKeyboardRunnable)
    HideVirtualKeyboardRunnable._jinit(self, ...)
    return self
end


function HideVirtualKeyboardRunnable:run()
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local inputMethodManager = self.activity:getSystemService(Context.INPUT_METHOD_SERVICE)
            local viewCompositeInterface = self.activity
            if rawequal(viewCompositeInterface, nil) then
                ForcedLogUtil.log("Activity Null", self)
            end
            local view = viewCompositeInterface:getView()
            if rawequal(view:getWindowToken(), nil) then
                self.logUtil:putF("Unable to hide virtual keyboard as window token is null - This usually happens during loading when the view is not attached to a window", self, commonStrings.RUN)
                do return "__jreturn" end
            end
            local token = view:getWindowToken()
            inputMethodManager:hideSoftInputFromWindow(token, 0)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return HideVirtualKeyboardRunnable

