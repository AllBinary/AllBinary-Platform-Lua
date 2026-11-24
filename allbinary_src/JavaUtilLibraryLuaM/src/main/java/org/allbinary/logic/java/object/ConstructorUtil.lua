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

local ConstructorUtil = {}
package.loaded["org.allbinary.logic.java.anyType.ConstructorUtil"] = ConstructorUtil

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

-- local Constructor = require("java.lang.reflect.Constructor")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table ConstructorUtil is declared before the requires
ConstructorUtil.__index = ConstructorUtil
ConstructorUtil.className = "ConstructorUtil"
ConstructorUtil.javaClassName = "org.allbinary.logic.java.anyType.ConstructorUtil"


function ConstructorUtil._jinit(self)
    return self
end

function ConstructorUtil.new(...)
    local self = setmetatable({}, ConstructorUtil)
    ConstructorUtil._jinit(self, ...)
    return self
end


function ConstructorUtil.viewAll(myClass, lineBreak)
        local stringBuffer = StringMaker.new()
        local constructor = myClass:getConstructors()
        stringBuffer:append("Constructors: ")
        stringBuffer:append(lineBreak)
        for index = 0, (constructor.n or #constructor) - 1 do
            stringBuffer:append(ConstructorUtil.view(constructor[index + 1], lineBreak))
        end
        return tostring(stringBuffer)
end


function ConstructorUtil.view(constructor, lineBreak)
        if constructor ~= nil then
            local commonSeps = CommonSeps.getInstance()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(constructor:getName())
            local classes = constructor:getParameterTypes()
            for index = 0, (classes.n or #classes) - 1 do
                stringBuffer:append(commonSeps.SPACE)
                stringBuffer:append(classes[index + 1]:getName())
                stringBuffer:append(commonSeps.COLON)
                stringBuffer:appendint(index)
            end
            stringBuffer:append(lineBreak)
            return tostring(stringBuffer)
        else
            return "Constructor Null"
        end
end

return ConstructorUtil

