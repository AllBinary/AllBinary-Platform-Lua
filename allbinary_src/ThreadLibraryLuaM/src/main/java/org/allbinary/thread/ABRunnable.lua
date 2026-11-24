-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local ABRunnable = {}
package.loaded["org.allbinary.thread.ABRunnable"] = ABRunnable

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

local RunnableInterface = require("org.allbinary.thread.RunnableInterface")

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

-- class table ABRunnable is declared before the requires
ABRunnable.__index = ABRunnable
ABRunnable.className = "ABRunnable"
ABRunnable.javaClassName = "org.allbinary.thread.ABRunnable"
ABRunnable.java_implements = " RunnableInterface "
ABRunnable.java_interfaces = function() return {RunnableInterface} end

function ABRunnable:_init_fields()
    self.running = false
end

function ABRunnable._jinit(self)
    ABRunnable._init_fields(self)
    return self
end

function ABRunnable.new()
    return ABRunnable._jinit(setmetatable({}, ABRunnable))
end


function ABRunnable:setThread(thread)
end


function ABRunnable:isRunning()
        return self.running
end


function ABRunnable:setRunning(running)
        self.running = running
end


function ABRunnable:run()
end


function ABRunnable:getType()
        return -1
end

return ABRunnable

