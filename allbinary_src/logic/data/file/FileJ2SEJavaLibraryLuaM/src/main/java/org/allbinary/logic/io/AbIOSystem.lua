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
-- package org.allbinary.logic.io


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbIOSystem = {}
AbIOSystem.__index = AbIOSystem
AbIOSystem.className = "AbIOSystem"

function AbIOSystem:_init_fields()
    self.type = "java.io"
end

function AbIOSystem.new()
    local self = setmetatable({}, AbIOSystem)
    self:_init_fields()
    return self
end


function AbIOSystem.getInstance()
        return AbIOSystem.instance
end


function AbIOSystem:getType()
        return self.type
end


function AbIOSystem:isType(type)
        if ((self.type < type and -1) or (self.type > type and 1) or 0) == 0 then
            return true
        else
            return false
        end
end

AbIOSystem.instance = AbIOSystem.new()

return AbIOSystem

