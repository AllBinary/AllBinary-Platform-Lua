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
-- package org.allbinary.midlet

-- local MIDlet = require("javax.microedition.midlet.MIDlet")
local AppletUtil = require("org.allbinary.AppletUtil")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local Processor = require("org.allbinary.canvas.Processor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MidletExitProcessorFactory = {}
MidletExitProcessorFactory.__index = MidletExitProcessorFactory
MidletExitProcessorFactory.className = "MidletExitProcessorFactory"

function MidletExitProcessorFactory.new()
    local self = setmetatable({}, MidletExitProcessorFactory)
    return self
end


function MidletExitProcessorFactory.getInstance()
        return MidletExitProcessorFactory.instance
end


function MidletExitProcessorFactory:getExitInstance(midlet)
        if AppletUtil.isAppletLoader(midlet) or J2MEUtil.isJ2ME() then
            return Processor.getInstance()
        else
            return MidletExitProcessor.new(midlet)
        end
end

MidletExitProcessorFactory.instance = MidletExitProcessorFactory.new()

return MidletExitProcessorFactory

