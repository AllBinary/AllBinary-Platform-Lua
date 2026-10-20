-- Generated Code Do Not Modify
-- package org.allbinary.view

-- local Displayable = require("javax.microedition.lcdui.Displayable")
-- local MIDlet = require("javax.microedition.midlet.MIDlet")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local EmulatorViewInterface = {}
EmulatorViewInterface.__index = EmulatorViewInterface
EmulatorViewInterface.className = "EmulatorViewInterface"


function EmulatorViewInterface:setMidlet(midlet)
    error("abstract method setMidlet")
end


function EmulatorViewInterface:onEmulatorInitComplete(midletActivity)
    error("abstract method onEmulatorInitComplete")
end


function EmulatorViewInterface:onSetDisplayable(displayable)
    error("abstract method onSetDisplayable")
end

return EmulatorViewInterface

