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
-- package org.allbinary.media.audio

-- local Control = require("javax.sound.sampled.Control")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullJ2SEControl = {}
NullJ2SEControl.__index = NullJ2SEControl
NullJ2SEControl.className = "NullJ2SEControl"
setmetatable(NullJ2SEControl, {__index = Control})


function NullJ2SEControl.new(type)
    local self = setmetatable(Control.new(type), NullJ2SEControl)
        -- super(...) made self above
    return self
end

return NullJ2SEControl

