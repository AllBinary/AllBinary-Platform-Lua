-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local TransformInfoObjectConfigAndManipulatorFactoryBase = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase"] = TransformInfoObjectConfigAndManipulatorFactoryBase

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

local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local TransformInfoObjectConfigAndManipulatorFactoryInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryInterface")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table TransformInfoObjectConfigAndManipulatorFactoryBase is declared before the requires
TransformInfoObjectConfigAndManipulatorFactoryBase.__index = TransformInfoObjectConfigAndManipulatorFactoryBase
TransformInfoObjectConfigAndManipulatorFactoryBase.className = "TransformInfoObjectConfigAndManipulatorFactoryBase"
TransformInfoObjectConfigAndManipulatorFactoryBase.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase"
TransformInfoObjectConfigAndManipulatorFactoryBase.java_implements = " TransformInfoObjectConfigAndManipulatorFactoryInterface "
TransformInfoObjectConfigAndManipulatorFactoryBase.java_interfaces = function() return {TransformInfoObjectConfigAndManipulatorFactoryInterface} end

function TransformInfoObjectConfigAndManipulatorFactoryBase:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function TransformInfoObjectConfigAndManipulatorFactoryBase._jinit(self)
    TransformInfoObjectConfigAndManipulatorFactoryBase._init_fields(self)
    return self
end

function TransformInfoObjectConfigAndManipulatorFactoryBase.new()
    return TransformInfoObjectConfigAndManipulatorFactoryBase._jinit(setmetatable({}, TransformInfoObjectConfigAndManipulatorFactoryBase))
end


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance_j3_1(abeClientInformation, transformInfoInterface, objectConfigFileAbPath)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance_j2(abeClientInformation, transformInfoInterface)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance_j3_2(abeClientInformation, transformInfoInterface, document)
        error(require("java.lang.RuntimeException").new(), 0)
end
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance(...)
    local count = select("#", ...)
    if count == 3 then return self:getInstance_j3(...) end
    if count == 2 then return self:getInstance_j2(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
TransformInfoObjectConfigAndManipulatorFactoryBase.getInstance__jdispatcher = TransformInfoObjectConfigAndManipulatorFactoryBase.getInstance
function TransformInfoObjectConfigAndManipulatorFactoryBase:getInstance_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or java_is(java_a2, "TransformInfoInterface")) and (java_a3 == nil or java_is(java_a3, "AbPath")) then return TransformInfoObjectConfigAndManipulatorFactoryBase.getInstance_j3_1(self, ...) end
    return TransformInfoObjectConfigAndManipulatorFactoryBase.getInstance_j3_2(self, ...)
end

return TransformInfoObjectConfigAndManipulatorFactoryBase

