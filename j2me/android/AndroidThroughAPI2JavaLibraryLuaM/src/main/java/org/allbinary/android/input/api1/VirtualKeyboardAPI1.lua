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
-- package org.allbinary.android.input.api1

local VirtualKeyboard = require("org.allbinary.android.input.VirtualKeyboard")
local VirtualKeyboardEventListenerInterface = require("org.allbinary.input.event.VirtualKeyboardEventListenerInterface")
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

local VirtualKeyboardAPI1 = {}
VirtualKeyboardAPI1.__index = VirtualKeyboardAPI1
VirtualKeyboardAPI1.className = "VirtualKeyboardAPI1"
setmetatable(VirtualKeyboardAPI1, {__index = VirtualKeyboard})


function VirtualKeyboardAPI1.new(activity)
    local self = setmetatable(VirtualKeyboard.new(), VirtualKeyboardAPI1)
    return self
end

VirtualKeyboardAPI1.MIN_API = 1
VirtualKeyboardAPI1.MAX_API = 2

return VirtualKeyboardAPI1

