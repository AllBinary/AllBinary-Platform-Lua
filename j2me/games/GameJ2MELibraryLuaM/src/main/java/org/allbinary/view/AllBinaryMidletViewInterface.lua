-- Generated Code Do Not Modify
-- package org.allbinary.view

local GameInitializedListenerInterface = require("org.allbinary.game.configuration.event.GameInitializedListenerInterface")
local DemoGameMidletEventListener = require("org.allbinary.game.midlet.DemoGameMidletEventListener")
local MidletCompositeInterface = require("org.allbinary.midlet.MidletCompositeInterface")
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

-- Java interface
local AllBinaryMidletViewInterface = {}
AllBinaryMidletViewInterface.__index = AllBinaryMidletViewInterface
AllBinaryMidletViewInterface.className = "AllBinaryMidletViewInterface"
setmetatable(AllBinaryMidletViewInterface, {__index = MidletCompositeInterface})


function AllBinaryMidletViewInterface:onResume()
    error("abstract method onResume")
end


function AllBinaryMidletViewInterface:onPause()
    error("abstract method onPause")
end


function AllBinaryMidletViewInterface:onDestroy()
    error("abstract method onDestroy")
end

return AllBinaryMidletViewInterface

