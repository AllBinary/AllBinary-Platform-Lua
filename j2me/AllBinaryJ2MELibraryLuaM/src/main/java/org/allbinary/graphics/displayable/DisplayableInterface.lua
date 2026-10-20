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
-- package org.allbinary.graphics.displayable

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

-- Java interface
local DisplayableInterface = {}
DisplayableInterface.__index = DisplayableInterface
DisplayableInterface.className = "DisplayableInterface"


function DisplayableInterface:addCommand(cmd)
    error("abstract method addCommand")
end


function DisplayableInterface:getHeight()
    error("abstract method getHeight")
end


function DisplayableInterface:getWidth()
    error("abstract method getWidth")
end


function DisplayableInterface:removeCommand(cmd)
    error("abstract method removeCommand")
end


function DisplayableInterface:setCommandListener(l)
    error("abstract method setCommandListener")
end

return DisplayableInterface

