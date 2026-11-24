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
-- package org.allbinary.thread

local ThreadUtil = {}
package.loaded["org.allbinary.thread.ThreadUtil"] = ThreadUtil

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

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

-- class table ThreadUtil is declared before the requires
ThreadUtil.__index = ThreadUtil
ThreadUtil.className = "ThreadUtil"
ThreadUtil.javaClassName = "org.allbinary.thread.ThreadUtil"

function ThreadUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.JOIN = "join"
end

function ThreadUtil._jinit(self)
    ThreadUtil._init_fields(self)
    return self
end

function ThreadUtil.new()
    return ThreadUtil._jinit(setmetatable({}, ThreadUtil))
end


function ThreadUtil.getInstance()
        return ThreadUtil.instance_f
end


function ThreadUtil:isRunning(thread)
        if thread ~= nil and thread:isAlive() then
            return true
        else
            return false
        end
end


-- throws Exception
function ThreadUtil:join(thread)
        if ThreadUtil.getInstance():isRunning(thread) then
            self.logUtil:putF("Waiting for Thread To Join/End", self, self.JOIN)
            thread:join()
        end
end

ThreadUtil.instance_f = ThreadUtil.new()

return ThreadUtil

