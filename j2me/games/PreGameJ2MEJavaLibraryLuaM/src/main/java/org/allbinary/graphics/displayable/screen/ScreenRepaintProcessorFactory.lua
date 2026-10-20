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
-- package org.allbinary.graphics.displayable.screen

-- local Displayable = require("javax.microedition.lcdui.Displayable")
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

local ScreenRepaintProcessorFactory = {}
ScreenRepaintProcessorFactory.__index = ScreenRepaintProcessorFactory
ScreenRepaintProcessorFactory.className = "ScreenRepaintProcessorFactory"


function ScreenRepaintProcessorFactory.getInstance()
        return ScreenRepaintProcessorFactory.instance
end


function ScreenRepaintProcessorFactory.new()
    local self = setmetatable({}, ScreenRepaintProcessorFactory)
    return self
end


function ScreenRepaintProcessorFactory:create(displayable)
        if not J2MEUtil.isJ2ME() then
            return ScreenRepaintProcessor.new(displayable)
        else
            return Processor.getInstance()
        end
end

ScreenRepaintProcessorFactory.instance = ScreenRepaintProcessorFactory.new()

return ScreenRepaintProcessorFactory

