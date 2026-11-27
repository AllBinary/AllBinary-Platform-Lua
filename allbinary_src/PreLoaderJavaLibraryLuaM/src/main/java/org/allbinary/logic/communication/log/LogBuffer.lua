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
-- package org.allbinary.logic.communication.log

local LogBuffer = {}
package.loaded["org.allbinary.logic.communication.log.LogBuffer"] = LogBuffer

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local Log = java_lazy("org.allbinary.logic.communication.log.Log")
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

-- class table LogBuffer is declared before the requires
LogBuffer.__index = LogBuffer
LogBuffer.className = "LogBuffer"
LogBuffer.javaClassName = "org.allbinary.logic.communication.log.LogBuffer"

function LogBuffer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.logEntryVector == nil then self.logEntryVector = nil end
end


function LogBuffer._jinit(self)
    LogBuffer._init_fields(self)
        self.logEntryVector = BasicArrayListD.new()
    return self
end

function LogBuffer.new(...)
    local self = setmetatable({}, LogBuffer)
    LogBuffer._jinit(self, ...)
    return self
end


function LogBuffer:add(log)
        self.logEntryVector:add(log)
end


function LogBuffer:logAll()
        local size = self.logEntryVector:size()
        for index = 0, size - 1 do
            local log = self.logEntryVector:get(index)
            self.logUtil:putL(log)
        end
end

return LogBuffer

