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
-- package org.allbinary.logic.system.loader

local AbeFactory = {}
package.loaded["org.allbinary.logic.system.loader.AbeFactory"] = AbeFactory

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
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ConstructorUtil = java_lazy("org.allbinary.logic.java.anyType.ConstructorUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbKeys = java_lazy("org.allbinary.logic.system.security.AbKeys")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbeClassLoader = java_lazy("org.allbinary.logic.system.loader.AbeClassLoader")
local WebappClassLoaderInfo = java_lazy("org.allbinary.logic.system.loader.WebappClassLoaderInfo")

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

-- class table AbeFactory is declared before the requires
AbeFactory.__index = AbeFactory
AbeFactory.className = "AbeFactory"
AbeFactory.javaClassName = "org.allbinary.logic.system.loader.AbeFactory"

function AbeFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.useCustomLoader = false
end


function AbeFactory.getInstance()
        return AbeFactory.instance_f
end


function AbeFactory._jinit(self)
    AbeFactory._init_fields(self)
    return self
end

function AbeFactory.new(...)
    local self = setmetatable({}, AbeFactory)
    AbeFactory._jinit(self, ...)
    return self
end


-- throws LicensingException
function AbeFactory:getInstance_j2(abeClientInformation, className)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self:getClass(abeClientInformation, className):newInstance() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADERERROR) then
                self.logUtil:put("Failure for: " .. className, self, "getInstance(classname)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws LicensingException
function AbeFactory:getInstance_j4(abeClientInformation, className, classes, params)
        local constructor = nil
        local try_ok, try_error, try_value = pcall(function()
            local parent = WebappClassLoaderInfo.getLoader()
            if self.useCustomLoader then
                local loader = AbeClassLoader.new(parent, AbKeys.getInstance():getKey(abeClientInformation, className))
                local myClass = loader:loadClass(className)
                constructor = myClass:getConstructor(classes)
                do return "__jreturn", constructor:newInstance(params) end
            else
                local myClass = parent:loadClass(className)
                constructor = myClass:getConstructor(classes)
                do return "__jreturn", constructor:newInstance(params) end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADERERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Failure for: ")
                stringBuffer:append(className)
                stringBuffer:append(CommonSeps.getInstance().SPACE)
                stringBuffer:append(ConstructorUtil.view(constructor, CommonSeps.getInstance().NEW_LINE))
                self.logUtil:put(tostring(stringBuffer), self, "getInstance(className,params)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbeFactory:getInstance(...)
    local count = select("#", ...)
    if count == 2 then return self:getInstance_j2(...) end
    if count == 4 then return self:getInstance_j4(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
AbeFactory.getInstance__jdispatcher = AbeFactory.getInstance


-- throws LicensingException
function AbeFactory:getClass(abeClientInformation, className)
        local try_ok, try_error, try_value = pcall(function()
            local parent = WebappClassLoaderInfo.getLoader()
            if self.useCustomLoader then
                local loader = AbeClassLoader.new(parent, AbKeys.getInstance():getKey(abeClientInformation, className))
                local c = loader:loadClass(className)
                do return "__jreturn", c end
            else
                local c = parent:loadClass(className)
                do return "__jreturn", c end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADERERROR) then
                self.logUtil:put("Failure for: " .. className, self, "getClass(className)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AbeFactory.instance_f = AbeFactory.new()

return AbeFactory

