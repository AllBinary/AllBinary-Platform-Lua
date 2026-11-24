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
-- package org.allbinary.game.layer

local VehicleProperties = {}
package.loaded["org.allbinary.game.layer.VehicleProperties"] = VehicleProperties

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

local VelocityProperties = java_lazy("org.allbinary.game.physics.velocity.VelocityProperties")
local VehicleFrictionProperties = java_lazy("org.allbinary.game.layer.VehicleFrictionProperties")

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

-- class table VehicleProperties is declared before the requires
VehicleProperties.__index = VehicleProperties
VehicleProperties.className = "VehicleProperties"
VehicleProperties.javaClassName = "org.allbinary.game.layer.VehicleProperties"

function VehicleProperties:_init_fields()
    if self.velocityProperties == nil then self.velocityProperties = nil end
    if self.vehicleFrictionProperties == nil then self.vehicleFrictionProperties = nil end
end


function VehicleProperties._jinit(self, velocityProperties, vehicleFrictionProperties)
    VehicleProperties._init_fields(self)
        self.velocityProperties = velocityProperties
        self.vehicleFrictionProperties = vehicleFrictionProperties
    return self
end

function VehicleProperties.new(...)
    local self = setmetatable({}, VehicleProperties)
    VehicleProperties._jinit(self, ...)
    return self
end


function VehicleProperties:getVehicleFrictionProperties()
        return self.vehicleFrictionProperties
end


function VehicleProperties:setVehicleFrictionProperties(vehicleFrictionProperties)
        self.vehicleFrictionProperties = vehicleFrictionProperties
end


function VehicleProperties:getVelocityProperties()
        return self.velocityProperties
end

return VehicleProperties

