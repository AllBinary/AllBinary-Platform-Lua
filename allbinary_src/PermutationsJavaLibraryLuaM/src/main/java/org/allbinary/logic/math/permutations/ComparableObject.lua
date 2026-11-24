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

local ComparableObject = {}
package.loaded["org.allbinary.logic.math.permutations.ComparableObject"] = ComparableObject

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
-- java.lang.Comparable has no Lua module
local Comparable = {}

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

-- class table ComparableObject is declared before the requires
ComparableObject.__index = ComparableObject
ComparableObject.className = "ComparableObject"
ComparableObject.javaClassName = "org.allbinary.logic.math.permutations.ComparableObject"
ComparableObject.java_implements = " Comparable "
ComparableObject.java_interfaces = function() return {Comparable} end

function ComparableObject._jinit(self)
    return self
end

function ComparableObject.new()
    return ComparableObject._jinit(setmetatable({}, ComparableObject))
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

