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
-- package org.allbinary.thread

local NullPriorityRunnable = {}
package.loaded["org.allbinary.thread.NullPriorityRunnable"] = NullPriorityRunnable

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

local PriorityRunnable = require("org.allbinary.thread.PriorityRunnable")

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

-- class table NullPriorityRunnable is declared before the requires
NullPriorityRunnable.__index = NullPriorityRunnable
NullPriorityRunnable.className = "NullPriorityRunnable"
NullPriorityRunnable.javaClassName = "org.allbinary.thread.NullPriorityRunnable"
NullPriorityRunnable.java_implements = " PriorityRunnable "
NullPriorityRunnable.java_interfaces = function() return {PriorityRunnable} end

function NullPriorityRunnable._jinit(self)
    return self
end

function NullPriorityRunnable.new()
    return NullPriorityRunnable._jinit(setmetatable({}, NullPriorityRunnable))
end


function NullPriorityRunnable:getPriority()
        return 0
end


function NullPriorityRunnable:isDone()
        return true
end


function NullPriorityRunnable:reset()
end


function NullPriorityRunnable:run()
end

return NullPriorityRunnable

