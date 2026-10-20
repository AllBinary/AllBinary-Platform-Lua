-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

-- local HashMap = require("java.util.HashMap")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--J2SEForJ2ME
local J2SEUtil = {}
J2SEUtil.__index = J2SEUtil
J2SEUtil.className = "J2SEUtil"

function J2SEUtil.new()
    local self = setmetatable({}, J2SEUtil)
    return self
end


function J2SEUtil.getInstance()
        return J2SEUtil.instance
end


function J2SEUtil:getHashMapAsArray(hashMap)
        local objectArray = hashMap:keySet():toArray()
        return objectArray
end


function J2SEUtil:getMapAsArray(map)
        local objectArray = map:keySet():toArray()
        return objectArray
end


function J2SEUtil:getSetAsArray(set)
        local objectArray = set:toArray()
        return objectArray
end

J2SEUtil.instance = J2SEUtil.new()

return J2SEUtil

