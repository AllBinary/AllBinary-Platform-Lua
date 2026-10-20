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
-- package org.allbinary.animation.text


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
local TextInterface = {}
TextInterface.__index = TextInterface
TextInterface.className = "TextInterface"


function TextInterface:setTextWithOnMeasure(text, textChangeListener)
    error("abstract method setTextWithOnMeasure")
end


function TextInterface:getText()
    error("abstract method getText")
end


function TextInterface:setText(text)
    error("abstract method setText")
end


function TextInterface:getFontHeight()
    error("abstract method getFontHeight")
end


function TextInterface:getWidth()
    error("abstract method getWidth")
end

return TextInterface

