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
-- package admin.taghelpers

local HelperFactory = {}
package.loaded["admin.taghelpers.HelperFactory"] = HelperFactory

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

local HashMap = java_lazy("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeFactory = java_lazy("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table HelperFactory is declared before the requires
HelperFactory.__index = HelperFactory
HelperFactory.className = "HelperFactory"
HelperFactory.javaClassName = "admin.taghelpers.HelperFactory"

function HelperFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function HelperFactory._jinit(self)
    HelperFactory._init_fields(self)
    return self
end

function HelperFactory.new(...)
    local self = setmetatable({}, HelperFactory)
    HelperFactory._jinit(self, ...)
    return self
end


-- throws LicensingException
function HelperFactory.getInstance_j5_1(abeClientInformation, factoryName, className, hashMap, httpServletRequest)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local params = java_new_array(nil, 2)
            local classes = java_new_array(nil, 2)
            local abeFactory = AbeFactory.getInstance()
            classes[1] = getmetatable(hashMap)
            classes[2] = abeFactory:getClass(abeClientInformation, "javax.servlet.http.HttpServletRequest")
            params[1] = hashMap
            params[2] = httpServletRequest
            local anyType = abeFactory:getInstance(abeClientInformation, className, classes, params)
            do return "__jreturn", anyType end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed To Get Instance Args: HashMap=" .. tostring(hashMap) .. " HttpServletRequest=" .. tostring(httpServletRequest)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                logUtil:put(error, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws LicensingException
function HelperFactory.getInstance_j5_2(abeClientInformation, factoryName, className, hashMap, pageContext)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local params = java_new_array(nil, 2)
            local classes = java_new_array(nil, 2)
            local abeFactory = AbeFactory.getInstance()
            classes[1] = getmetatable(hashMap)
            classes[2] = abeFactory:getClass(abeClientInformation, "javax.servlet.jsp.PageContext")
            params[1] = hashMap
            params[2] = pageContext
            local anyType = abeFactory:getInstance(abeClientInformation, className, classes, params)
            do return "__jreturn", anyType end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local error = "Failed To Get Instance Args: HashMap=" .. tostring(hashMap) .. " PageContext=" .. tostring(pageContext)
                logUtil:put(error, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws LicensingException
function HelperFactory.getInstance_j6(abeClientInformation, factoryName, className, hashMap, specialhashMap, pageContext)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local params = java_new_array(nil, 3)
            local classes = java_new_array(nil, 3)
            local abeFactory = AbeFactory.getInstance()
            classes[1] = getmetatable(hashMap)
            classes[2] = getmetatable(specialhashMap)
            classes[3] = abeFactory:getClass(abeClientInformation, "javax.servlet.jsp.PageContext")
            params[1] = hashMap
            params[2] = specialhashMap
            params[3] = pageContext
            local anyType = abeFactory:getInstance(abeClientInformation, className, classes, params)
            do return "__jreturn", anyType end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local error = "Failed To Get Instance Args: HashMap=" .. tostring(hashMap) .. " PageContext=" .. tostring(pageContext)
                logUtil:put(error, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws LicensingException
function HelperFactory.getInstance_j3(abeClientInformation, factoryName, className)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, className)
            do return "__jreturn", anyType end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, factoryName .. "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function HelperFactory.getInstance(...)
    local count = select("#", ...)
    if count == 5 then return HelperFactory.getInstance_j5(...) end
    if count == 6 then return HelperFactory.getInstance_j6(...) end
    if count == 3 then return HelperFactory.getInstance_j3(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
HelperFactory.getInstance__jdispatcher = HelperFactory.getInstance
function HelperFactory.getInstance_j5(...)
    local java_a1, java_a2, java_a3, java_a4, java_a5 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") and (java_a4 == nil or java_is(java_a4, "HashMap")) and (java_a5 == nil or java_is(java_a5, "HttpServletRequest")) then return HelperFactory.getInstance_j5_1(...) end
    return HelperFactory.getInstance_j5_2(...)
end

return HelperFactory

