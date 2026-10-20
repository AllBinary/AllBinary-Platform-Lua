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

local TouchButtonGenericActionResource = {}
TouchButtonGenericActionResource.__index = TouchButtonGenericActionResource
TouchButtonGenericActionResource.className = "TouchButtonGenericActionResource"
setmetatable(TouchButtonGenericActionResource, {__index = TouchButtonResource})


function TouchButtonGenericActionResource.getInstance()
        return TouchButtonGenericActionResource.instance
end


function TouchButtonGenericActionResource.new()
    local self = setmetatable(TouchButtonResource.new("/touch_button_generic_action_64_by_64.png", "/touch_button_generic_action_hint_64_by_64.png"), TouchButtonGenericActionResource)
        -- super(...) made self above
    return self
end

TouchButtonGenericActionResource.instance = TouchButtonGenericActionResource.new()

return TouchButtonGenericActionResource

