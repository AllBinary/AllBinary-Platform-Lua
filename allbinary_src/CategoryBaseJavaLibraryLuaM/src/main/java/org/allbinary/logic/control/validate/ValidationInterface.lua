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

local ValidationInterface = {}
package.loaded["org.allbinary.logic.control.validate.ValidationInterface"] = ValidationInterface

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

local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")

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

-- Java interface
-- class table ValidationInterface is declared before the requires
ValidationInterface.__index = ValidationInterface
ValidationInterface.className = "ValidationInterface"
ValidationInterface.javaClassName = "org.allbinary.logic.control.validate.ValidationInterface"


-- throws Exception
function ValidationInterface:isValid()
    error("abstract method isValid")
end


-- throws Exception
function ValidationInterface:toValidationInfoNode(document)
    error("abstract method toValidationInfoNode")
end


-- throws Exception
function ValidationInterface:toValidationInfoDoc()
    error("abstract method toValidationInfoDoc")
end


-- throws Exception
function ValidationInterface:validationInfo()
    error("abstract method validationInfo")
end

return ValidationInterface

