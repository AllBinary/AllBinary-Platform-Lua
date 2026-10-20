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
-- package org.allbinary.business.time.modified

local Time = require("org.allbinary.business.time.Time")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimeLastModified = {}
TimeLastModified.__index = TimeLastModified
TimeLastModified.className = "TimeLastModified"
setmetatable(TimeLastModified, {__index = Time})

function TimeLastModified.new(...)
    local count = select("#", ...)
    if count == 1 then return TimeLastModified._new1(...)
    elseif count == 1 then return TimeLastModified._new1(...)
    end
end


function TimeLastModified._new1(time)
    local self = setmetatable(Time.new(time), TimeLastModified)
        -- super(...) made self above
    return self
end


function TimeLastModified._new1(time)
    local self = setmetatable(Time.new(time), TimeLastModified)
        -- super(...) made self above
    return self
end

return TimeLastModified

