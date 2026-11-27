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
-- package org.allbinary.business.context.configuration

local ContextConfigurationInterfaceFactory = {}
package.loaded["org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory"] = ContextConfigurationInterfaceFactory

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

local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local ContextConfigurationData = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationData")
local ContextConfigurationInterface = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationInterface")
local ContextConfigurationPathUtil = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationPathUtil")
local ContextConfigurationView = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationView")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table ContextConfigurationInterfaceFactory is declared before the requires
ContextConfigurationInterfaceFactory.__index = ContextConfigurationInterfaceFactory
ContextConfigurationInterfaceFactory.className = "ContextConfigurationInterfaceFactory"
ContextConfigurationInterfaceFactory.javaClassName = "org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory"


function ContextConfigurationInterfaceFactory.getInstance()
        return ContextConfigurationInterfaceFactory.instance_f
end


function ContextConfigurationInterfaceFactory._jinit(self)
    return self
end

function ContextConfigurationInterfaceFactory.new(...)
    local self = setmetatable({}, ContextConfigurationInterfaceFactory)
    ContextConfigurationInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function ContextConfigurationInterfaceFactory:getInstance_j1_1(document)
        local contextConfigurationData = ContextConfigurationData.getInstance()
        local contextConfigurationNode = DomSearchHelper.getNode(contextConfigurationData.NAME, document:getChildNodes())
        return ContextConfigurationView.new(contextConfigurationNode):getContextConfigurationInterface()
end


-- throws Exception
function ContextConfigurationInterfaceFactory:getInstance_j1_2(contextName)
        local abPath = ContextConfigurationPathUtil.getAbPath(contextName)
        local contextConfigurationData = ContextConfigurationData.getInstance()
        local documentString = CryptFileReader.new(contextConfigurationData.UNCRYPTED_EXTENSION, contextConfigurationData.ENCRYPTED_EXTENSION):get(abPath)
        local document = DomDocumentHelper.create(documentString)
        return self:getInstance(document)
end
function ContextConfigurationInterfaceFactory:getInstance(...)
    local count = select("#", ...)
    if count == 1 then return self:getInstance_j1(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
ContextConfigurationInterfaceFactory.getInstance__jdispatcher = ContextConfigurationInterfaceFactory.getInstance
function ContextConfigurationInterfaceFactory:getInstance_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) then return ContextConfigurationInterfaceFactory.getInstance_j1_1(self, ...) end
    return ContextConfigurationInterfaceFactory.getInstance_j1_2(self, ...)
end

ContextConfigurationInterfaceFactory.instance_f = ContextConfigurationInterfaceFactory.new()

return ContextConfigurationInterfaceFactory

