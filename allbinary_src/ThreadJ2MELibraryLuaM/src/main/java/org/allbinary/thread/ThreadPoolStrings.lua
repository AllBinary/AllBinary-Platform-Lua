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

local ThreadPoolStrings = {}
package.loaded["org.allbinary.thread.ThreadPoolStrings"] = ThreadPoolStrings

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

-- class table ThreadPoolStrings is declared before the requires
ThreadPoolStrings.__index = ThreadPoolStrings
ThreadPoolStrings.className = "ThreadPoolStrings"
ThreadPoolStrings.javaClassName = "org.allbinary.thread.ThreadPoolStrings"

function ThreadPoolStrings:_init_fields()
    self.ADD_TASK = "addTask"
    self.START_TASK = "Started Task: "
    self.COMPLETE_TASK = "Completed Task: "
end

function ThreadPoolStrings._jinit(self)
    ThreadPoolStrings._init_fields(self)
    return self
end

function ThreadPoolStrings.new()
    return ThreadPoolStrings._jinit(setmetatable({}, ThreadPoolStrings))
end


function ThreadPoolStrings.getInstance()
        return ThreadPoolStrings.instance_f
end

ThreadPoolStrings.instance_f = ThreadPoolStrings.new()

return ThreadPoolStrings

