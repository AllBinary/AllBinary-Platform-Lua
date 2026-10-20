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
local VirtualKeyboard = require("org.allbinary.android.input.VirtualKeyboard")
local VirtualKeyboardEvent = require("org.allbinary.input.event.VirtualKeyboardEvent")
local VirtualKeyboardEventHandler = require("org.allbinary.input.event.VirtualKeyboardEventHandler")
local VirtualKeyboardEventListenerInterface = require("org.allbinary.input.event.VirtualKeyboardEventListenerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VirtualKeyboardAPI3 = {}
VirtualKeyboardAPI3.__index = VirtualKeyboardAPI3
VirtualKeyboardAPI3.className = "VirtualKeyboardAPI3"
setmetatable(VirtualKeyboardAPI3, {__index = VirtualKeyboard})

function VirtualKeyboardAPI3:_init_fields()
    self.virtualKeyboard = false
    self.activity = nil
    self.showVirtualKeyboardRunnable = nil
    self.hideVirtualKeyboardRunnable = nil
end


function VirtualKeyboardAPI3.new(activity)
    local self = setmetatable(VirtualKeyboard.new(), VirtualKeyboardAPI3)
    self:_init_fields()
        -- super(...) made self above
        self.activity = activity
        self.showVirtualKeyboardRunnable = ShowVirtualKeyboardRunnable.new(self.activity)
        self.hideVirtualKeyboardRunnable = HideVirtualKeyboardRunnable.new(self.activity)
        local virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
        virtualKeyboardEventHandler:removeAllListeners()
        virtualKeyboardEventHandler:addListenerInterface(self)
    return self
end


function VirtualKeyboardAPI3:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function VirtualKeyboardAPI3:onVirtualKeyboardEvent(virtualKeyboardEvent)
        local isShow = virtualKeyboardEvent:getSource()
        if isShow then
            self:showVirtualKeyboard()
        else
            self:hideVirtualKeyboard()
        end
end


function VirtualKeyboardAPI3:forceHide()
        self:hideVirtualKeyboard()
end


function VirtualKeyboardAPI3:hide()
        if self.virtualKeyboard then
            self:forceHide()
        end
end


function VirtualKeyboardAPI3:showVirtualKeyboard()
        self.activity:runOnUiThread(self.showVirtualKeyboardRunnable)
        self.virtualKeyboard = true
end


function VirtualKeyboardAPI3:hideVirtualKeyboard()
        self.activity:runOnUiThread(self.hideVirtualKeyboardRunnable)
        self.virtualKeyboard = false
end

VirtualKeyboardAPI3.MAX_API = Integer.MAX_VALUE
VirtualKeyboardAPI3.MIN_API = 3

return VirtualKeyboardAPI3

