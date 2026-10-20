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

-- local HashMap = require("java.util.HashMap")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
local JsType = require("jsinterop.annotations.JsType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABHashMap = {}
ABHashMap.__index = ABHashMap
ABHashMap.className = "ABHashMap"
setmetatable(ABHashMap, {__index = HashMap})

function ABHashMap.new()
    local self = setmetatable(HashMap.new(), ABHashMap)
    return self
end


function ABHashMap:size()
        return HashMap.size(self)
end


function ABHashMap:isEmpty()
        return HashMap.isEmpty(self)
end


function ABHashMap:get(key)
        return HashMap.get(self, key)
end


function ABHashMap:containsKey(key)
        return HashMap.containsKey(self, key)
end


function ABHashMap:put(key, value)
        return HashMap.put(self, key, value)
end


function ABHashMap:putAll(map)
        HashMap.putAll(self, map)
end


function ABHashMap:remove(key)
        return HashMap.remove(self, key)
end


function ABHashMap:clear()
        HashMap.clear(self)
end


function ABHashMap:containsValue(value)
        return HashMap.containsValue(self, value)
end


function ABHashMap:keySet()
        return HashMap.keySet(self)
end


function ABHashMap:entrySet()
        return HashMap.entrySet(self)
end


function ABHashMap:getOrDefault(key, defaultValue)
        return HashMap.getOrDefault(self, key, defaultValue)
end


function ABHashMap:putIfAbsent(key, value)
        return HashMap.putIfAbsent(self, key, value)
end


function ABHashMap:clone()
        return HashMap.clone(self)
end

return ABHashMap

