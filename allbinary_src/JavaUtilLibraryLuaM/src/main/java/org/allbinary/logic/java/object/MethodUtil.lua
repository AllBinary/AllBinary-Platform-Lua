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

-- local Method = require("java.lang.reflect.Method")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MethodUtil = {}
MethodUtil.__index = MethodUtil
MethodUtil.className = "MethodUtil"


function MethodUtil.new()
    local self = setmetatable({}, MethodUtil)
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

