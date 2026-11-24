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
-- package org.allbinary.persistance

local PlatformRecordIdUtil = {}
package.loaded["org.allbinary.persistance.PlatformRecordIdUtil"] = PlatformRecordIdUtil

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

local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

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

-- class table PlatformRecordIdUtil is declared before the requires
PlatformRecordIdUtil.__index = PlatformRecordIdUtil
PlatformRecordIdUtil.className = "PlatformRecordIdUtil"
PlatformRecordIdUtil.javaClassName = "org.allbinary.persistance.PlatformRecordIdUtil"

function PlatformRecordIdUtil:_init_fields()
    self.PLATFORM_SHORT_NAME = "AVN"
end

function PlatformRecordIdUtil._jinit(self)
    PlatformRecordIdUtil._init_fields(self)
    return self
end

function PlatformRecordIdUtil.new()
    return PlatformRecordIdUtil._jinit(setmetatable({}, PlatformRecordIdUtil))
end


function PlatformRecordIdUtil.getInstance()
        return PlatformRecordIdUtil.instance_f
end


function PlatformRecordIdUtil:getRecordId(abeClientInformation, baseRecordId)
        return tostring(StringMaker.new():append(abeClientInformation:toShortString()):append(CommonSeps.getInstance().UNDERSCORE):append(self.PLATFORM_SHORT_NAME):append(baseRecordId))
end

PlatformRecordIdUtil.instance_f = PlatformRecordIdUtil.new()

return PlatformRecordIdUtil

