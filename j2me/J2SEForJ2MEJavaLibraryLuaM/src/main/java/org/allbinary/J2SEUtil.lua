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

local J2SEUtil = {}
package.loaded["org.allbinary.J2SEUtil"] = J2SEUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--J2SEForJ2ME
-- class table J2SEUtil is declared before the requires
J2SEUtil.__index = J2SEUtil
J2SEUtil.className = "J2SEUtil"
J2SEUtil.javaClassName = "org.allbinary.J2SEUtil"

function J2SEUtil._jinit(self)
    return self
end

function J2SEUtil.new()
    return J2SEUtil._jinit(setmetatable({}, J2SEUtil))
end


function J2SEUtil.getInstance()
        return J2SEUtil.instance_f
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

J2SEUtil.instance_f = J2SEUtil.new()

return J2SEUtil

