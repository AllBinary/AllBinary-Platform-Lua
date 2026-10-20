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
-- package org.allbinary.logic.system.hardware.components.interfaces


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local CpuInterface = {}
CpuInterface.__index = CpuInterface
CpuInterface.className = "CpuInterface"


function CpuInterface:getProcessor()
    error("abstract method getProcessor")
end


function CpuInterface:getVendorId()
    error("abstract method getVendorId")
end


function CpuInterface:getCpuFamily()
    error("abstract method getCpuFamily")
end


function CpuInterface:getModel()
    error("abstract method getModel")
end


function CpuInterface:getModelName()
    error("abstract method getModelName")
end


function CpuInterface:getStepping()
    error("abstract method getStepping")
end


function CpuInterface:getCpuSpeed()
    error("abstract method getCpuSpeed")
end


function CpuInterface:getCacheSize()
    error("abstract method getCacheSize")
end


function CpuInterface:compareTo(cpuInterface)
    error("abstract method compareTo")
end

return CpuInterface

