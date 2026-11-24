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
-- package org.allbinary.logic.control.validate

local ValidatorBase = {}
package.loaded["org.allbinary.logic.control.validate.ValidatorBase"] = ValidatorBase

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

local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local ValidatorBaseInterface = require("org.allbinary.logic.control.validate.ValidatorBaseInterface")

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

-- class table ValidatorBase is declared before the requires
ValidatorBase.__index = ValidatorBase
ValidatorBase.className = "ValidatorBase"
ValidatorBase.javaClassName = "org.allbinary.logic.control.validate.ValidatorBase"
ValidatorBase.java_implements = " ValidatorBaseInterface "
ValidatorBase.java_interfaces = function() return {ValidatorBaseInterface} end


function ValidatorBase.getInstance()
        return ValidatorBase.instance_f
end


function ValidatorBase._jinit(self)
    return self
end

function ValidatorBase.new(...)
    local self = setmetatable({}, ValidatorBase)
    ValidatorBase._jinit(self, ...)
    return self
end


function ValidatorBase:isValid()
        return BooleanFactory.getInstance().TRUE
end


function ValidatorBase:validationInfo()
        return StringUtil.getInstance().EMPTY_STRING
end


function ValidatorBase:toHashtable()
        return StdUtil.getInstance().NULL_TABLE
end


function ValidatorBase:toList()
        return BasicArrayListUtil.getInstance():getImmutableInstance()
end

ValidatorBase.instance_f = ValidatorBase.new()

return ValidatorBase

