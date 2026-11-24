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
-- package org.allbinary.emulator.swt

local SWTProcessorUtil = {}
package.loaded["org.allbinary.emulator.swt.SWTProcessorUtil"] = SWTProcessorUtil

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

local SWTProcessor = java_lazy("org.allbinary.emulator.swt.SWTProcessor")

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

-- class table SWTProcessorUtil is declared before the requires
SWTProcessorUtil.__index = SWTProcessorUtil
SWTProcessorUtil.className = "SWTProcessorUtil"
SWTProcessorUtil.javaClassName = "org.allbinary.emulator.swt.SWTProcessorUtil"

function SWTProcessorUtil:_init_fields()
    self.swtProcessor = SWTProcessor.getInstance()
end

function SWTProcessorUtil._jinit(self)
    SWTProcessorUtil._init_fields(self)
    return self
end

function SWTProcessorUtil.new()
    return SWTProcessorUtil._jinit(setmetatable({}, SWTProcessorUtil))
end


function SWTProcessorUtil.getInstance()
        return SWTProcessorUtil.instance_f
end

SWTProcessorUtil.instance_f = SWTProcessorUtil.new()

return SWTProcessorUtil

