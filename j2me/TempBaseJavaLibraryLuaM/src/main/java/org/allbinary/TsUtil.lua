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

local TsUtil = {}
package.loaded["org.allbinary.TsUtil"] = TsUtil

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

--TempBase
-- class table TsUtil is declared before the requires
TsUtil.__index = TsUtil
TsUtil.className = "TsUtil"
TsUtil.javaClassName = "org.allbinary.TsUtil"

function TsUtil._jinit(self)
    return self
end

function TsUtil.new()
    return TsUtil._jinit(setmetatable({}, TsUtil))
end


function TsUtil.getInstance()
        return TsUtil.instance_f
end


function TsUtil:longBitsToDouble(bits)
        return require("java.lang.Double").longBitsToDouble(bits)
end


function TsUtil:intBitsToFloat(bits)
        return require("java.lang.Float").intBitsToFloat(bits)
end


function TsUtil:hashCode(anyType)
        return anyType:hashCode()
end


-- throws InterruptedException
function TsUtil:waitFor(any, timeoutMillis)
        local anyType = any
        anyType:wait(timeoutMillis)
end


function TsUtil:compareTo(a, b)
        return ((a < b and -1) or (a > b and 1) or 0)
end

TsUtil.instance_f = TsUtil.new()

return TsUtil

