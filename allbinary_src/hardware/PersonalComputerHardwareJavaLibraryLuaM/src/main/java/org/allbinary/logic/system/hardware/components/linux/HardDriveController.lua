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
-- package org.allbinary.logic.system.hardware.components.linux

local HardDriveController = {}
package.loaded["org.allbinary.logic.system.hardware.components.linux.HardDriveController"] = HardDriveController

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

local HardDriveControllerInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardDriveControllerInterface")
local HardwareComponentInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")

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

-- class table HardDriveController is declared before the requires
HardDriveController.__index = HardDriveController
HardDriveController.className = "HardDriveController"
HardDriveController.javaClassName = "org.allbinary.logic.system.hardware.components.linux.HardDriveController"
HardDriveController.java_implements = " HardwareComponentInterface HardDriveControllerInterface "
HardDriveController.java_interfaces = function() return {HardwareComponentInterface, HardDriveControllerInterface} end

function HardDriveController:_init_fields()
    if self.data == nil then self.data = nil end
end


function HardDriveController._jinit(self, data)
    HardDriveController._init_fields(self)
        self.data = data
    return self
end

function HardDriveController.new(...)
    local self = setmetatable({}, HardDriveController)
    HardDriveController._jinit(self, ...)
    return self
end


function HardDriveController:compareTo(componentInterface)
        return true
end


function HardDriveController:toString()
        return self.data
end
HardDriveController.__tostring = function(self) return self:toString() end

return HardDriveController

