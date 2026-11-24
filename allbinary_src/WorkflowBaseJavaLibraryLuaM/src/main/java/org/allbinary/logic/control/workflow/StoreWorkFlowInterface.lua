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
-- package org.allbinary.logic.control.workflow

local StoreWorkFlowInterface = {}
package.loaded["org.allbinary.logic.control.workflow.StoreWorkFlowInterface"] = StoreWorkFlowInterface

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

local WorkFlowInterface = require("org.allbinary.logic.control.workflow.WorkFlowInterface")

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

--extends ValidationComponentInterface, ValidationInterface, ComponentInterface, DomNodeInterface, DataMappingInterface
-- Java interface
-- class table StoreWorkFlowInterface is declared before the requires
StoreWorkFlowInterface.__index = StoreWorkFlowInterface
StoreWorkFlowInterface.className = "StoreWorkFlowInterface"
StoreWorkFlowInterface.javaClassName = "org.allbinary.logic.control.workflow.StoreWorkFlowInterface"
setmetatable(StoreWorkFlowInterface, {__index = WorkFlowInterface})
StoreWorkFlowInterface.java_interfaces = function() return {WorkFlowInterface} end


-- throws Exception
function StoreWorkFlowInterface:getStoreName()
    error("abstract method getStoreName")
end

return StoreWorkFlowInterface

