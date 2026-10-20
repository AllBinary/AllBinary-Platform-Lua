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

-- local Enumeration = require("java.util.Enumeration")
-- local Hashtable = require("java.util.Hashtable")
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

local ABHashtable = {}
ABHashtable.__index = ABHashtable
ABHashtable.className = "ABHashtable"
setmetatable(ABHashtable, {__index = Hashtable})


function ABHashtable.new()
    local self = setmetatable(Hashtable.new(), ABHashtable)
        -- super(...) made self above
    return self
end


function ABHashtable:size()
        return Hashtable.size(self)
end


function ABHashtable:isEmpty()
        return Hashtable.isEmpty(self)
end


function ABHashtable:elements()
        return Hashtable.elements(self)
end


function ABHashtable:contains(value)
        return Hashtable.contains(self, value)
end


function ABHashtable:containsValue(value)
        return Hashtable.containsValue(self, value)
end


function ABHashtable:containsKey(key)
        return Hashtable.containsKey(self, key)
end


function ABHashtable:get(key)
        return Hashtable.get(self, key)
end


function ABHashtable:clear()
        Hashtable.clear(self)
end


function ABHashtable:clone()
        return Hashtable.clone(self)
end


function ABHashtable:toString()
        return tostring(Hashtable)
end
ABHashtable.__tostring = function(self) return self:toString() end


function ABHashtable:equals(obj)
        return Hashtable.equals(self, obj)
end
ABHashtable.__eq = function(self, other) return self:equals(other) end


function ABHashtable:hashCode()
        return Hashtable.hashCode(self)
end

return ABHashtable

