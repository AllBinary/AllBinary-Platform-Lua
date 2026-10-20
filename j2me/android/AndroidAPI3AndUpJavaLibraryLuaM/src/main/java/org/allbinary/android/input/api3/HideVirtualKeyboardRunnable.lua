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

local Activity = require("android.app.Activity")
local Context = require("android.content.Context")
local IBinder = require("android.os.IBinder")
local View = require("android.view.View")
local InputMethodManager = require("android.view.inputmethod.InputMethodManager")
local ViewCompositeInterface = require("org.allbinary.android.activity.ViewCompositeInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
-- java.lang.Runnable has no Lua module
local Runnable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HideVirtualKeyboardRunnable = {}
HideVirtualKeyboardRunnable.__index = HideVirtualKeyboardRunnable
HideVirtualKeyboardRunnable.className = "HideVirtualKeyboardRunnable"

function HideVirtualKeyboardRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.activity = nil
end


function HideVirtualKeyboardRunnable.new(activity)
    local self = setmetatable({}, HideVirtualKeyboardRunnable)
    self:_init_fields()
        self.activity = activity
    return self
end


function HideVirtualKeyboardRunnable:run()
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local inputMethodManager = self.activity:getSystemService(Context.INPUT_METHOD_SERVICE)
            local viewCompositeInterface = self.activity
            if viewCompositeInterface == nil then
                ForcedLogUtil.log("Activity Null", self)
            end
            local view = viewCompositeInterface:getView()
            if view:getWindowToken() == nil then
                self.logUtil:putF("Unable to hide virtual keyboard as window token is null - This usually happens during loading when the view is not attached to a window", self, commonStrings.RUN)
                return
            end
            local token = view:getWindowToken()
            inputMethodManager:hideSoftInputFromWindow(token, 0)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
end

return HideVirtualKeyboardRunnable

