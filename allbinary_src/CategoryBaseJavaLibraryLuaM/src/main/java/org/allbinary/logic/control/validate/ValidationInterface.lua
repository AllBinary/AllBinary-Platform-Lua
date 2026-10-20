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

local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ValidationInterface = {}
ValidationInterface.__index = ValidationInterface
ValidationInterface.className = "ValidationInterface"


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

