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
-- package org.allbinary.logic.math.permutations

local TsUtil = require("org.allbinary.TsUtil")
-- java.lang.Comparable has no Lua module
local Comparable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ComparableObject = {}
ComparableObject.__index = ComparableObject
ComparableObject.className = "ComparableObject"

function ComparableObject.new()
    local self = setmetatable({}, ComparableObject)
    return self
end


function ComparableObject:compareTo(anyType)
        if TsUtil.getInstance():hashCode(self) < TsUtil.getInstance():hashCode(anyType) then
            return -1
        elseif TsUtil.getInstance():hashCode(self) > TsUtil.getInstance():hashCode(anyType) then
            return 1
        end
        return 0
end

return ComparableObject

