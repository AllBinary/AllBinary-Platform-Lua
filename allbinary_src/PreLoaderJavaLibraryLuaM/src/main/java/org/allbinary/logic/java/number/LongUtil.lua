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
-- package org.allbinary.logic.java.number

local LongUtil = {}
package.loaded["org.allbinary.logic.java.number.LongUtil"] = LongUtil

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local LongData = java_lazy("org.allbinary.logic.java.number.LongData")

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

-- class table LongUtil is declared before the requires
LongUtil.__index = LongUtil
LongUtil.className = "LongUtil"
LongUtil.javaClassName = "org.allbinary.logic.java.number.LongUtil"


function LongUtil._jinit(self)
    return self
end

function LongUtil.new(...)
    local self = setmetatable({}, LongUtil)
    LongUtil._jinit(self, ...)
    return self
end


function LongUtil.fillIn(end_)
        local frameStringBuffer = StringMaker.new()
        if frameStringBuffer:length() < LongData.MAX_LONG_LENGTH then
            local commonPhoneStrings = CommonPhoneStrings.getInstance()
            local size = LongData.MAX_LONG_LENGTH - frameStringBuffer:length()
            for index = 0, size - 1 do
                frameStringBuffer:append(commonPhoneStrings.ZERO)
            end
        end
        frameStringBuffer:append(end_)
        return tostring(frameStringBuffer)
end

return LongUtil

