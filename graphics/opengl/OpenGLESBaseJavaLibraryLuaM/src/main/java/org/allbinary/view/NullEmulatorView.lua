-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.view

-- local Displayable = require("javax.microedition.lcdui.Displayable")
-- local MIDlet = require("javax.microedition.midlet.MIDlet")
local EmulatorViewInterface = require("org.allbinary.view.EmulatorViewInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullEmulatorView = {}
NullEmulatorView.__index = NullEmulatorView
NullEmulatorView.className = "NullEmulatorView"

function NullEmulatorView.new()
    local self = setmetatable({}, NullEmulatorView)
    return self
end


function NullEmulatorView:setMidlet(midlet)
end


function NullEmulatorView:onEmulatorInitComplete(midletActivity)
end


function NullEmulatorView:onSetDisplayable(displayable)
end

NullEmulatorView.NULL_EMULATOR_VIEW = NullEmulatorView.new()

return NullEmulatorView

