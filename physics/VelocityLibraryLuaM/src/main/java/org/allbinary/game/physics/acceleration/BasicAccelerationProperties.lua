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
-- package org.allbinary.game.physics.acceleration


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicAccelerationProperties = {}
BasicAccelerationProperties.__index = BasicAccelerationProperties
BasicAccelerationProperties.className = "BasicAccelerationProperties"

function BasicAccelerationProperties:_init_fields()
    self.forward = 0
    self.reverse = 0
end


function BasicAccelerationProperties.new(forward, reverse)
    local self = setmetatable({}, BasicAccelerationProperties)
    self:_init_fields()
        self:setForward(forward)
        self:setReverse(reverse)
    return self
end


function BasicAccelerationProperties:setReverse(reverse)
        self.reverse = reverse
end


function BasicAccelerationProperties:getReverse()
        return self.reverse
end


function BasicAccelerationProperties:setForward(forward)
        self.forward = forward
end


function BasicAccelerationProperties:getForward()
        return self.forward
end

return BasicAccelerationProperties

