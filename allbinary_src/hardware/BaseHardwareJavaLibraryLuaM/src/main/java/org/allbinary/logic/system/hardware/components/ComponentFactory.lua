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
-- package org.allbinary.logic.system.hardware.components

local ComponentFactory = {}
package.loaded["org.allbinary.logic.system.hardware.components.ComponentFactory"] = ComponentFactory

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

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Component = java_lazy("org.allbinary.logic.system.hardware.components.Component")

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

-- class table ComponentFactory is declared before the requires
ComponentFactory.__index = ComponentFactory
ComponentFactory.className = "ComponentFactory"
ComponentFactory.javaClassName = "org.allbinary.logic.system.hardware.components.ComponentFactory"

function ComponentFactory:_init_fields()
    self.VGA = Component.new("VGA")
    self.IDE = Component.new("IDE")
    self.SCSI = Component.new("SCSI")
    self.BRIDGE = Component.new("bridge")
    self.ETHERNET = Component.new("Ethernet")
    self.USB = Component.new("USB")
    self.MULTIMEDIA = Component.new("Multimedia")
    self.PCI = Component.new("PCI")
    self.RAID = Component.new("RAID")
    self.SMBUS = Component.new("SMBus")
    self.PIC = Component.new("PIC")
    self.Class = Component.new("Class")
    self.UNKNOWN = Component.new(CommonStrings.getInstance().UNKNOWN)
end

function ComponentFactory._jinit(self)
    ComponentFactory._init_fields(self)
    return self
end

function ComponentFactory.new()
    return ComponentFactory._jinit(setmetatable({}, ComponentFactory))
end


function ComponentFactory.getInstance()
        return ComponentFactory.instance_f
end

ComponentFactory.instance_f = ComponentFactory.new()

return ComponentFactory

