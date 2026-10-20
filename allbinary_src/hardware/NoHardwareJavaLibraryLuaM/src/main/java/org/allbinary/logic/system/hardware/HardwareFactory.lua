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
-- package org.allbinary.logic.system.hardware

local OperatingSystemInterface = require("org.allbinary.logic.system.os.OperatingSystemInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HardwareFactory = {}
HardwareFactory.__index = HardwareFactory
HardwareFactory.className = "HardwareFactory"

function HardwareFactory:_init_fields()
    self.SINGLETON = NoHardware.getInstance()
end


function HardwareFactory.getInstance()
        return HardwareFactory.instance
end


function HardwareFactory.new()
    local self = setmetatable({}, HardwareFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function HardwareFactory:getInstance(os)
        local try_ok, try_error = pcall(function()
            return self.SINGLETON
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

HardwareFactory.instance = HardwareFactory.new()

return HardwareFactory

