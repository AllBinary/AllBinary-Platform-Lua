--
-- AllBinary Open License Version 1
-- Copyright (c) 2009 AllBinary
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
-- package org.allbinary.android.input.motion

local MotionEventProcessor = require("org.allbinary.android.input.motion.MotionEventProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoMotionEventProcessor = {}
NoMotionEventProcessor.__index = NoMotionEventProcessor
NoMotionEventProcessor.className = "NoMotionEventProcessor"
setmetatable(NoMotionEventProcessor, {__index = MotionEventProcessor})

function NoMotionEventProcessor.new()
    local self = setmetatable(MotionEventProcessor.new(), NoMotionEventProcessor)
    return self
end


function NoMotionEventProcessor.getInstance()
        return NoMotionEventProcessor.SINGLETON
end

NoMotionEventProcessor.SINGLETON = MotionEventProcessor.new()

return NoMotionEventProcessor

