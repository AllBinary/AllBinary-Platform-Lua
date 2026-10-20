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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SystemHardwareFactory = {}
SystemHardwareFactory.__index = SystemHardwareFactory
SystemHardwareFactory.className = "SystemHardwareFactory"

function SystemHardwareFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.hardwareInterface = NoHardware.getInstance()
end


function SystemHardwareFactory.getInstance()
        return SystemHardwareFactory.instance
end


function SystemHardwareFactory.new()
    local self = setmetatable({}, SystemHardwareFactory)
    self:_init_fields()
    return self
end


-- Java overloaded method: Lua keeps the last definition
function SystemHardwareFactory:getInstance(operatingSystemInterface)
        local try_ok, try_error = pcall(function()
            if self.hardwareInterface == NoHardware.getInstance() then
                self.hardwareInterface = HardwareFactory.getInstance():getInstance(operatingSystemInterface)
            end
            self.logUtil:putF("Found Hardware", self, self.commonStrings.CONSTRUCTOR)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
        return self.hardwareInterface
end


function SystemHardwareFactory.static_toString()
        local systemHardwareFactory = SystemHardwareFactory.getInstance()
        local osBuffer = StringMaker.new()
        osBuffer:append("Hardware Info: \n")
        if systemHardwareFactory.hardwareInterface ~= nil then
            osBuffer:append(tostring(systemHardwareFactory.hardwareInterface))
        else
            osBuffer:append(StringUtil.getInstance().NULL_STRING)
        end
        return tostring(osBuffer)
end

SystemHardwareFactory.instance = SystemHardwareFactory.new()

return SystemHardwareFactory

