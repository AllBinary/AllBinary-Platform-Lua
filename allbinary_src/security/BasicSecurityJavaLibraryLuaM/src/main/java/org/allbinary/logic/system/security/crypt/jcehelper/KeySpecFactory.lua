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
-- package org.allbinary.logic.system.security.crypt.jcehelper

local KeySpecFactory = {}
package.loaded["org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory"] = KeySpecFactory

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

-- local KeySpec = require("java.security.spec.KeySpec")
-- local DESKeySpec = require("javax.crypto.spec.DESKeySpec")
-- local DESedeKeySpec = require("javax.crypto.spec.DESedeKeySpec")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table KeySpecFactory is declared before the requires
KeySpecFactory.__index = KeySpecFactory
KeySpecFactory.className = "KeySpecFactory"
KeySpecFactory.javaClassName = "org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory"

function KeySpecFactory:_init_fields()
    self.DES = "DES"
    self.DESEDE = "DESede"
    self.BLOWFISH = "Blowfish"
end


function KeySpecFactory.getInstance()
        return KeySpecFactory.instance_f
end
KeySpecFactory.getInstance__static = KeySpecFactory.getInstance


function KeySpecFactory._jinit(self)
    KeySpecFactory._init_fields(self)
    return self
end

function KeySpecFactory.new(...)
    local self = setmetatable({}, KeySpecFactory)
    KeySpecFactory._jinit(self, ...)
    return self
end


function KeySpecFactory:getInstance(algorithm, keyData)
        local try_ok, try_error, try_value = pcall(function()
            local tsUtil = TsUtil.getInstance()
            if rawequal(tsUtil:compareTo(algorithm, self.DES), 0) then
                do return "__jreturn", DESKeySpec.new(keyData) end
            elseif rawequal(tsUtil:compareTo(algorithm, self.DESEDE), 0) then
                do return "__jreturn", DESedeKeySpec.new(keyData) end
            else
                error(require("java.lang.RuntimeException").new(), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            error(require("java.lang.RuntimeException").new(), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
KeySpecFactory.getInstance__instance = KeySpecFactory.getInstance
function KeySpecFactory.getInstance(...)
                
    if select("#", ...) == 0 then return KeySpecFactory.getInstance__static() end
                
    return KeySpecFactory.getInstance__instance(...)
                
end

KeySpecFactory.instance_f = KeySpecFactory.new()

return KeySpecFactory

