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
-- package org.allbinary.logic.java.anyType

local MethodUtil = {}
package.loaded["org.allbinary.logic.java.anyType.MethodUtil"] = MethodUtil

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

-- local Method = require("java.lang.reflect.Method")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ParamsUtil = java_lazy("org.allbinary.logic.java.anyType.ParamsUtil")

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

-- class table MethodUtil is declared before the requires
MethodUtil.__index = MethodUtil
MethodUtil.className = "MethodUtil"
MethodUtil.javaClassName = "org.allbinary.logic.java.anyType.MethodUtil"


function MethodUtil._jinit(self)
    return self
end

function MethodUtil.new(...)
    local self = setmetatable({}, MethodUtil)
    MethodUtil._jinit(self, ...)
    return self
end


function MethodUtil.viewAll(myClass, lineBreak)
        local stringBuffer = StringMaker.new()
        local method = myClass:getMethods()
        stringBuffer:append("Methods: ")
        stringBuffer:append(lineBreak)
        for index = 0, (method.n or #method) - 1 do
            stringBuffer:append(method[index + 1]:getReturnType():getName())
            stringBuffer:append(" ")
            stringBuffer:append(method[index + 1]:getName())
            stringBuffer:append("(")
            ParamsUtil.viewParams(method[index + 1]:getParameterTypes())
            stringBuffer:append(")")
            stringBuffer:append(lineBreak)
        end
        return tostring(stringBuffer)
end

return MethodUtil

