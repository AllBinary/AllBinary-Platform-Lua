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
-- package org.allbinary.game.input


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
local KeyInterface = {}
KeyInterface.__index = KeyInterface
KeyInterface.className = "KeyInterface"


function KeyInterface:keyPressed(keyCode)
    error("abstract method keyPressed")
end


function KeyInterface:keyReleased(keyCode)
    error("abstract method keyReleased")
end


function KeyInterface:keyPressedByDevice(keyCode, deviceId)
    error("abstract method keyPressedByDevice")
end


function KeyInterface:keyReleasedByDevice(keyCode, deviceId)
    error("abstract method keyReleasedByDevice")
end

return KeyInterface

