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
-- package org.allbinary.input.automation.osgi

local InputAutomationServiceFactory = {}
package.loaded["org.allbinary.input.automation.osgi.InputAutomationServiceFactory"] = InputAutomationServiceFactory

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

local Bundle = java_lazy("org.osgi.framework.Bundle")
local ServiceFactory = java_lazy("org.osgi.framework.ServiceFactory")
local ServiceRegistration = java_lazy("org.osgi.framework.ServiceRegistration")
local InputAutomationJFrame = java_lazy("org.allbinary.input.automation.InputAutomationJFrame")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table InputAutomationServiceFactory is declared before the requires
InputAutomationServiceFactory.__index = InputAutomationServiceFactory
InputAutomationServiceFactory.className = "InputAutomationServiceFactory"
InputAutomationServiceFactory.javaClassName = "org.allbinary.input.automation.osgi.InputAutomationServiceFactory"
InputAutomationServiceFactory.java_implements = " ServiceFactory "
InputAutomationServiceFactory.java_interfaces = function() return {ServiceFactory} end

function InputAutomationServiceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function InputAutomationServiceFactory._jinit(self)
    InputAutomationServiceFactory._init_fields(self)
    return self
end

function InputAutomationServiceFactory.new(...)
    local self = setmetatable({}, InputAutomationServiceFactory)
    InputAutomationServiceFactory._jinit(self, ...)
    return self
end


function InputAutomationServiceFactory.getInstance()
        return InputAutomationServiceFactory.inputAutomationServiceFactory
end


function InputAutomationServiceFactory:getService(bundle, registration)
        self.logUtil:putF(self.commonStrings.START, self, "getService")
        return InputAutomationJFrame.getInstance()
end


function InputAutomationServiceFactory:ungetService(bundle, registration, service)
end

InputAutomationServiceFactory.inputAutomationServiceFactory = InputAutomationServiceFactory.new()

return InputAutomationServiceFactory

