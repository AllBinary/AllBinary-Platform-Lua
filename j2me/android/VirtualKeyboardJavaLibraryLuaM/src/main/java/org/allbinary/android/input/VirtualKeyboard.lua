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
-- package org.allbinary.android.input

local VirtualKeyboardEvent = require("org.allbinary.input.event.VirtualKeyboardEvent")
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

local VirtualKeyboard = {}
VirtualKeyboard.__index = VirtualKeyboard
VirtualKeyboard.className = "VirtualKeyboard"

function VirtualKeyboard.new()
    local self = setmetatable({}, VirtualKeyboard)
    return self
end


function VirtualKeyboard:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function VirtualKeyboard:onVirtualKeyboardEvent(virtualKeyboardEvent)
end


function VirtualKeyboard:forceHide()
end


function VirtualKeyboard:hide()
end

VirtualKeyboard.NULL_VIRTUAL_KEYBOARD = VirtualKeyboard.new()

return VirtualKeyboard

