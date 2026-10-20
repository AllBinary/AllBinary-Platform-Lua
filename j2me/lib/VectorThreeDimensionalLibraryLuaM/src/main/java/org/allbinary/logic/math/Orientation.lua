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
-- package org.allbinary.logic.math

local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Orientation = {}
Orientation.__index = Orientation
Orientation.className = "Orientation"

function Orientation:_init_fields()
    self.yaw = BasicDecimal.new(0)
    self.pitch = BasicDecimal.new(0)
    self.roll = BasicDecimal.new(0)
end


function Orientation.getInstance(yaw, pitch, roll)
        Orientation.SINGLETON.yaw:setint(yaw)
        Orientation.SINGLETON.pitch:setint(pitch)
        Orientation.SINGLETON.roll:setint(roll)
        return Orientation.SINGLETON
end


function Orientation.new(yaw, pitch, roll)
    local self = setmetatable({}, Orientation)
    self:_init_fields()
        self.yaw:setint(yaw)
        self.pitch:setint(pitch)
        self.roll:setint(roll)
    return self
end


function Orientation:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Y: ")
        stringBuffer:append(tostring(self.yaw))
        stringBuffer:append(" P: ")
        stringBuffer:append(tostring(self.pitch))
        stringBuffer:append(" R: ")
        stringBuffer:append(tostring(self.roll))
        return tostring(stringBuffer)
end
Orientation.__tostring = function(self) return self:toString() end

Orientation.NONE = Orientation.new(0, 0, 0)
Orientation.SINGLETON = Orientation.new(0, 0, 0)

return Orientation

