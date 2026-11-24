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

local MidletExitProcessorFactory = {}
package.loaded["org.allbinary.midlet.MidletExitProcessorFactory"] = MidletExitProcessorFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local MIDlet = require("javax.microedition.midlet.MIDlet")
local AppletUtil = java_lazy("org.allbinary.AppletUtil")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Processor = java_lazy("org.allbinary.canvas.Processor")
local MidletExitProcessor = java_lazy("org.allbinary.midlet.MidletExitProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table MidletExitProcessorFactory is declared before the requires
MidletExitProcessorFactory.__index = MidletExitProcessorFactory
MidletExitProcessorFactory.className = "MidletExitProcessorFactory"
MidletExitProcessorFactory.javaClassName = "org.allbinary.midlet.MidletExitProcessorFactory"

function MidletExitProcessorFactory._jinit(self)
    return self
end

function MidletExitProcessorFactory.new()
    return MidletExitProcessorFactory._jinit(setmetatable({}, MidletExitProcessorFactory))
end


function MidletExitProcessorFactory.getInstance()
        return MidletExitProcessorFactory.instance_f
end


function MidletExitProcessorFactory:getExitInstance(midlet)
        if AppletUtil.isAppletLoader(midlet) or J2MEUtil.isJ2ME() then
            return Processor.getInstance()
        else
            return MidletExitProcessor.new(midlet)
        end
end

MidletExitProcessorFactory.instance_f = MidletExitProcessorFactory.new()

return MidletExitProcessorFactory

