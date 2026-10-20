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
-- package org.allbinary.input


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--TouchAndroid
local TouchJ2ME = {}
TouchJ2ME.__index = TouchJ2ME
TouchJ2ME.className = "TouchJ2ME"


function TouchJ2ME.new()
    local self = setmetatable({}, TouchJ2ME)
    return self
end


function TouchJ2ME:pointerDragged(x, y)
end


function TouchJ2ME:pointerPressed(x, y)
end


function TouchJ2ME:pointerReleased(x, y)
end

return TouchJ2ME

