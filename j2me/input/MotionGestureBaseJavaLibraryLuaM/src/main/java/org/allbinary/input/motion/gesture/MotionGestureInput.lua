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
-- package org.allbinary.input.motion.gesture

local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionGestureInput = {}
MotionGestureInput.__index = MotionGestureInput
MotionGestureInput.className = "MotionGestureInput"
setmetatable(MotionGestureInput, {__index = Input})


function MotionGestureInput.new(id, name)
    local self = setmetatable(Input.new(id, name), MotionGestureInput)
        -- super(...) made self above
        local inputFactory = InputFactory.getInstance()
        inputFactory:add(self:getId(), self)
    return self
end

return MotionGestureInput

