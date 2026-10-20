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
-- package org.allbinary


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local J2MEUtil = {}
J2MEUtil.__index = J2MEUtil
J2MEUtil.className = "J2MEUtil"


function J2MEUtil.new()
    local self = setmetatable({}, J2MEUtil)
    return self
end


function J2MEUtil.isJ2ME()
        return true
end


function J2MEUtil.isJ2SE()
        return false
end


function J2MEUtil.isHTML()
        return false
end

return J2MEUtil

