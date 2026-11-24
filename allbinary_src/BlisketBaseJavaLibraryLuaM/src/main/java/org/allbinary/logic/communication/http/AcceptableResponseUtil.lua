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
-- package org.allbinary.logic.communication.http

local AcceptableResponseUtil = {}
package.loaded["org.allbinary.logic.communication.http.AcceptableResponseUtil"] = AcceptableResponseUtil

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
local TsUtil = java_lazy("org.allbinary.TsUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AcceptableResponseFactory = java_lazy("org.allbinary.logic.communication.http.AcceptableResponseFactory")

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

-- class table AcceptableResponseUtil is declared before the requires
AcceptableResponseUtil.__index = AcceptableResponseUtil
AcceptableResponseUtil.className = "AcceptableResponseUtil"
AcceptableResponseUtil.javaClassName = "org.allbinary.logic.communication.http.AcceptableResponseUtil"

function AcceptableResponseUtil:_init_fields()
    self.candidateVector = BasicArrayListD.new()
    self.tagNameVector = BasicArrayListD.new()
end

function AcceptableResponseUtil._jinit(self)
    AcceptableResponseUtil._init_fields(self)
    return self
end

function AcceptableResponseUtil.new()
    return AcceptableResponseUtil._jinit(setmetatable({}, AcceptableResponseUtil))
end


function AcceptableResponseUtil.getInstance()
        return AcceptableResponseUtil.instance_f
end


function AcceptableResponseUtil:get(index)
        return self.candidateVector:get(index)
end


function AcceptableResponseUtil:getTagName(index)
        return self.tagNameVector:get(index)
end


function AcceptableResponseUtil:size()
        return self.candidateVector:size()
end

AcceptableResponseUtil.instance_f = AcceptableResponseUtil.new()


do -- Java static initializer
        TsUtil.getInstance():hashCode(AcceptableResponseFactory.getInstance().HTML)
end

return AcceptableResponseUtil

