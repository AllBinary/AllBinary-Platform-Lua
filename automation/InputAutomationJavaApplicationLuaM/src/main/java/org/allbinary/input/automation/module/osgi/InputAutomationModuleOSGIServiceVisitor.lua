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
-- package org.allbinary.input.automation.module.osgi

local InputAutomationModuleOSGIServiceVisitor = {}
package.loaded["org.allbinary.input.automation.module.osgi.InputAutomationModuleOSGIServiceVisitor"] = InputAutomationModuleOSGIServiceVisitor

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

local InputAutomationModuleService = java_lazy("bundle.input.automation.module.InputAutomationModuleService")
local InputAutomationJFrame = java_lazy("org.allbinary.input.automation.InputAutomationJFrame")
local InputAutomationConfigurationUtil = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil")
local InputAutomationModuleFactoryInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local OSGIServiceInterface = java_lazy("org.allbinary.osgi.OSGIServiceInterface")
local OSGIServiceVisitorInterface = java_lazy("org.allbinary.osgi.OSGIServiceVisitorInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

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

-- class table InputAutomationModuleOSGIServiceVisitor is declared before the requires
InputAutomationModuleOSGIServiceVisitor.__index = InputAutomationModuleOSGIServiceVisitor
InputAutomationModuleOSGIServiceVisitor.className = "InputAutomationModuleOSGIServiceVisitor"
InputAutomationModuleOSGIServiceVisitor.javaClassName = "org.allbinary.input.automation.module.osgi.InputAutomationModuleOSGIServiceVisitor"
InputAutomationModuleOSGIServiceVisitor.java_implements = " OSGIServiceVisitorInterface "
InputAutomationModuleOSGIServiceVisitor.java_interfaces = function() return {OSGIServiceVisitorInterface} end

function InputAutomationModuleOSGIServiceVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function InputAutomationModuleOSGIServiceVisitor._jinit(self)
    InputAutomationModuleOSGIServiceVisitor._init_fields(self)
    return self
end

function InputAutomationModuleOSGIServiceVisitor.new(...)
    local self = setmetatable({}, InputAutomationModuleOSGIServiceVisitor)
    InputAutomationModuleOSGIServiceVisitor._jinit(self, ...)
    return self
end


function InputAutomationModuleOSGIServiceVisitor:visit_j1_1(anyType)
        return self:visit(anyType)
end


function InputAutomationModuleOSGIServiceVisitor:visit_j1_2(osgiServiceInterface)
        local try_ok, try_error, try_value = pcall(function()
            local inputAutomationModuleService = osgiServiceInterface
            local inputAutomationModuleInterfaceArray = inputAutomationModuleService:getInputAutomationModuleInterfaceArray()
            for index = 0, (inputAutomationModuleInterfaceArray.n or #inputAutomationModuleInterfaceArray) - 1 do
                InputAutomationJFrame.getInstance():onAdd(InputAutomationConfigurationUtil.getChangeEvent(inputAutomationModuleInterfaceArray[index + 1]))
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "visit", e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function InputAutomationModuleOSGIServiceVisitor:visit(...)
    local count = select("#", ...)
    if count == 1 then return self:visit_j1(...) end
    error("No method visit takes " .. count .. " arguments")
end
InputAutomationModuleOSGIServiceVisitor.visit__jdispatcher = InputAutomationModuleOSGIServiceVisitor.visit
function InputAutomationModuleOSGIServiceVisitor:visit_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "OSGIServiceInterface")) then return InputAutomationModuleOSGIServiceVisitor.visit_j1_2(self, ...) end
    return InputAutomationModuleOSGIServiceVisitor.visit_j1_1(self, ...)
end

return InputAutomationModuleOSGIServiceVisitor

