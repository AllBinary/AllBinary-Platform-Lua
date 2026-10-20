--
-- AllBinary Open License Version 1
-- Copyright (c) 2022 AllBinary
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
-- package org.allbinary.graphics.displayable.screen

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AboutCommandProcessor = {}
AboutCommandProcessor.__index = AboutCommandProcessor
AboutCommandProcessor.className = "AboutCommandProcessor"

function AboutCommandProcessor.new()
    local self = setmetatable({}, AboutCommandProcessor)
    return self
end


function AboutCommandProcessor.getInstance()
        return AboutCommandProcessor.instance
end


function AboutCommandProcessor:process(midletCommandListener, command, canvas)
        midletCommandListener:commandAction(command, canvas)
end

AboutCommandProcessor.instance = AboutCommandProcessor.new()

return AboutCommandProcessor

