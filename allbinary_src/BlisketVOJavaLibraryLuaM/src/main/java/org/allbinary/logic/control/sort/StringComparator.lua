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
-- package org.allbinary.logic.control.sort

-- local Comparator = require("java.util.Comparator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StringComparator = {}
StringComparator.__index = StringComparator
StringComparator.className = "StringComparator"


function StringComparator.new()
    local self = setmetatable({}, StringComparator)
    return self
end


function StringComparator:compare(anyType, object2)
        local string = anyType
        local string2 = object2
        return ((string < string2 and -1) or (string > string2 and 1) or 0)
end

return StringComparator

