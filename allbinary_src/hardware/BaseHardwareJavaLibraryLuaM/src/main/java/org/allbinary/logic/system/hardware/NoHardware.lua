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

local NoHardware = {}
package.loaded["org.allbinary.logic.system.hardware.NoHardware"] = NoHardware

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

local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local HardwareComponentInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local NoHardwareComponent = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.NoHardwareComponent")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local HardwareInterface = require("org.allbinary.logic.system.hardware.HardwareInterface")

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

-- class table NoHardware is declared before the requires
NoHardware.__index = NoHardware
NoHardware.className = "NoHardware"
NoHardware.javaClassName = "org.allbinary.logic.system.hardware.NoHardware"
NoHardware.java_implements = " HardwareInterface "
NoHardware.java_interfaces = function() return {HardwareInterface} end

function NoHardware._jinit(self)
    return self
end

function NoHardware.new()
    return NoHardware._jinit(setmetatable({}, NoHardware))
end


function NoHardware.getInstance()
        return NoHardware.instance_f
end


function NoHardware:getComponent(index)
        return NoHardwareComponent.getInstance()
end


function NoHardware:toString()
        return "No Hardware"
end
NoHardware.__tostring = function(self) return self:toString() end


function NoHardware:compareTo(hardwareInterface)
        return true
end


function NoHardware:difference(hardwareInterface)
        return StdUtil.getInstance().NULL_TABLE
end

NoHardware.instance_f = NoHardware.new()

return NoHardware

