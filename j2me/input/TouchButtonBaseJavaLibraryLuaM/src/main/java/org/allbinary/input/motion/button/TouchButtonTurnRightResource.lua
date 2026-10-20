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

local TouchButtonTurnRightResource = {}
TouchButtonTurnRightResource.__index = TouchButtonTurnRightResource
TouchButtonTurnRightResource.className = "TouchButtonTurnRightResource"
setmetatable(TouchButtonTurnRightResource, {__index = TouchButtonResource})


function TouchButtonTurnRightResource.getInstance()
        return TouchButtonTurnRightResource.instance
end


function TouchButtonTurnRightResource.new()
    local self = setmetatable(TouchButtonResource.new("/touch_button_turn_right_arrow_64_by_64.png", "/touch_button_turn_right_arrow_hint_64_by_64.png"), TouchButtonTurnRightResource)
        -- super(...) made self above
    return self
end

TouchButtonTurnRightResource.instance = TouchButtonTurnRightResource.new()

return TouchButtonTurnRightResource

