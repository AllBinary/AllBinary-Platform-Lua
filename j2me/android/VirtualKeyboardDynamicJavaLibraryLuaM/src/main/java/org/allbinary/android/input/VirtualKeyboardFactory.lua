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

local AndroidInfoFactory = require("org.allbinary.android.AndroidInfoFactory")
local VirtualKeyboardAPI1 = require("org.allbinary.android.input.api1.VirtualKeyboardAPI1")
local VirtualKeyboardAPI3 = require("org.allbinary.android.input.api3.VirtualKeyboardAPI3")
local Activity = require("android.app.Activity")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VirtualKeyboardFactory = {}
VirtualKeyboardFactory.__index = VirtualKeyboardFactory
VirtualKeyboardFactory.className = "VirtualKeyboardFactory"

function VirtualKeyboardFactory.new()
    local self = setmetatable({}, VirtualKeyboardFactory)
    return self
end


function VirtualKeyboardFactory.init(activity)
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 2 then
            VirtualKeyboardFactory.virtualKeyboard = VirtualKeyboardAPI1.new(activity)
        else
            VirtualKeyboardFactory.virtualKeyboard = VirtualKeyboardAPI3.new(activity)
        end
end


function VirtualKeyboardFactory.getInstance()
        return VirtualKeyboardFactory.virtualKeyboard
end

VirtualKeyboardFactory.virtualKeyboard = VirtualKeyboard.NULL_VIRTUAL_KEYBOARD

return VirtualKeyboardFactory

