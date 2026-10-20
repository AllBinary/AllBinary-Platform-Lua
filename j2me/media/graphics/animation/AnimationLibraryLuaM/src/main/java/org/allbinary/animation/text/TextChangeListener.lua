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

local TextChangeListener = {}
TextChangeListener.__index = TextChangeListener
TextChangeListener.className = "TextChangeListener"

function TextChangeListener.new()
    local self = setmetatable({}, TextChangeListener)
    return self
end


function TextChangeListener.getInstance()
        return TextChangeListener.instance
end


function TextChangeListener:onMeasure()
end

TextChangeListener.instance = TextChangeListener.new()

return TextChangeListener

