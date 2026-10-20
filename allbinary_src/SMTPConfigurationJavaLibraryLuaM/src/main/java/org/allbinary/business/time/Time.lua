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
-- package org.allbinary.business.time


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Time = {}
Time.__index = Time
Time.className = "Time"

function Time:_init_fields()
    self.timeLong = nil
end

function Time.new(...)
    local count = select("#", ...)
    if count == 1 then return Time._new1(...)
    elseif count == 1 then return Time._new1(...)
    end
end


function Time._new1(time)
    local self = setmetatable({}, Time)
    self:_init_fields()
        self.timeLong = time
    return self
end


function Time._new1(time)
    local self = setmetatable({}, Time)
    self:_init_fields()
        self.timeLong = time
    return self
end


function Time:getLong()
        return self.timeLong
end


function Time:getlong()
        return math.tointeger(self.timeLong // 1)
end


function Time:toString()
        return tostring(self:getLong())
end
Time.__tostring = function(self) return self:toString() end

return Time

