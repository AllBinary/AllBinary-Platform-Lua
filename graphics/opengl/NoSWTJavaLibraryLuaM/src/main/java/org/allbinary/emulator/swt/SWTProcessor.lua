-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.emulator.swt

local Display = require("org.eclipse.swt.widgets.Display")
local NullRunnable = require("org.allbinary.thread.NullRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SWTProcessor = {}
SWTProcessor.__index = SWTProcessor
SWTProcessor.className = "SWTProcessor"

function SWTProcessor:_init_fields()
    self.runnable = NullRunnable.getInstance()
end

function SWTProcessor.new()
    local self = setmetatable({}, SWTProcessor)
    self:_init_fields()
    return self
end


function SWTProcessor.getInstance()
        return SWTProcessor.instance
end


function SWTProcessor:process(display)
        display:sleep()
end

SWTProcessor.instance = SWTProcessor.new()

return SWTProcessor

