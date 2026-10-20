-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.util

-- local Hashtable = require("java.util.Hashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABHashtable = {}
ABHashtable.__index = ABHashtable
ABHashtable.className = "ABHashtable"
setmetatable(ABHashtable, {__index = Hashtable})

function ABHashtable.new(...)
    local count = select("#", ...)
    if count == 1 then return ABHashtable._new1(...)
    elseif count == 0 then return ABHashtable._new0(...)
    end
end


function ABHashtable._new1(initialCapacity)
    local self = setmetatable(Hashtable.new(initialCapacity), ABHashtable)
        -- super(...) made self above
    return self
end


function ABHashtable._new0()
    local self = setmetatable(Hashtable.new(), ABHashtable)
        -- super(...) made self above
    return self
end

return ABHashtable

