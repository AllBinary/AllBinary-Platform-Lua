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
-- package bundle.input.automation.module

local InputAutomationModuleService = {}
package.loaded["bundle.input.automation.module.InputAutomationModuleService"] = InputAutomationModuleService

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

local InputAutomationModuleFactoryInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local InputAutomationModuleServiceInterface = require("bundle.input.automation.module.InputAutomationModuleServiceInterface")

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

-- class table InputAutomationModuleService is declared before the requires
InputAutomationModuleService.__index = InputAutomationModuleService
InputAutomationModuleService.className = "InputAutomationModuleService"
InputAutomationModuleService.javaClassName = "bundle.input.automation.module.InputAutomationModuleService"
InputAutomationModuleService.java_implements = " InputAutomationModuleServiceInterface "
InputAutomationModuleService.java_interfaces = function() return {InputAutomationModuleServiceInterface} end

function InputAutomationModuleService:_init_fields()
    if self.inputAutomationModuleInterfaceArray == nil then self.inputAutomationModuleInterfaceArray = nil end
end


function InputAutomationModuleService._jinit(self, inputAutomationModuleInterfaceArray)
    InputAutomationModuleService._init_fields(self)
        self:setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray)
    return self
end

function InputAutomationModuleService.new(...)
    local self = setmetatable({}, InputAutomationModuleService)
    InputAutomationModuleService._jinit(self, ...)
    return self
end


function InputAutomationModuleService:getInputAutomationModuleInterfaceArray()
        return self.inputAutomationModuleInterfaceArray
end


function InputAutomationModuleService:setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray)
        self.inputAutomationModuleInterfaceArray = inputAutomationModuleInterfaceArray
end

return InputAutomationModuleService

