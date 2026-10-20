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

local ComponentFactory = {}
ComponentFactory.__index = ComponentFactory
ComponentFactory.className = "ComponentFactory"

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

function ComponentFactory.new()
    local self = setmetatable({}, ComponentFactory)
    self:_init_fields()
    return self
end


function ComponentFactory.getInstance()
        return ComponentFactory.instance
end

ComponentFactory.instance = ComponentFactory.new()

return ComponentFactory

