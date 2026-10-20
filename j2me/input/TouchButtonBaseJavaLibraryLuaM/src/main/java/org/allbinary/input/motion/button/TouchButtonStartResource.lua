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
-- package org.allbinary.input.motion.button

local TouchButtonResource = require("org.allbinary.input.motion.button.TouchButtonResource")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonStartResource = {}
TouchButtonStartResource.__index = TouchButtonStartResource
TouchButtonStartResource.className = "TouchButtonStartResource"
setmetatable(TouchButtonStartResource, {__index = TouchButtonResource})


function TouchButtonStartResource.getInstance()
        return TouchButtonStartResource.instance
end


function TouchButtonStartResource.new()
    local self = setmetatable(TouchButtonResource.new("/touch_button_start_64_by_64.png", "/touch_button_start_hint_64_by_64.png"), TouchButtonStartResource)
        -- super(...) made self above
    return self
end

TouchButtonStartResource.instance = TouchButtonStartResource.new()

return TouchButtonStartResource

