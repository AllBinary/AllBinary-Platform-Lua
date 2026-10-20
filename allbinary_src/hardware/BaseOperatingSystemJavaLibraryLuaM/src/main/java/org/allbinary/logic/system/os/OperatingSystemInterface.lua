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
-- package org.allbinary.logic.system.os

local CharacterSet = require("org.allbinary.logic.java.character.CharacterSet")

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
local OperatingSystemInterface = {}
OperatingSystemInterface.__index = OperatingSystemInterface
OperatingSystemInterface.className = "OperatingSystemInterface"


function OperatingSystemInterface:getName()
    error("abstract method getName")
end


function OperatingSystemInterface:getVersion()
    error("abstract method getVersion")
end


function OperatingSystemInterface:getArch()
    error("abstract method getArch")
end


function OperatingSystemInterface:getCharacterSet()
    error("abstract method getCharacterSet")
end


function OperatingSystemInterface:isOverScan()
    error("abstract method isOverScan")
end


function OperatingSystemInterface:getOverScanXPercent()
    error("abstract method getOverScanXPercent")
end


function OperatingSystemInterface:getOverScanYPercent()
    error("abstract method getOverScanYPercent")
end


function OperatingSystemInterface:isScalable()
    error("abstract method isScalable")
end


function OperatingSystemInterface:isAutoHide()
    error("abstract method isAutoHide")
end


function OperatingSystemInterface:toString()
    error("abstract method toString")
end
OperatingSystemInterface.__tostring = function(self) return self:toString() end

return OperatingSystemInterface

