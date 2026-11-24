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

local BasicCrypt = {}
package.loaded["org.allbinary.logic.system.security.crypt.jcehelper.BasicCrypt"] = BasicCrypt

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local CryptInterface = java_lazy("org.allbinary.init.crypt.jcehelper.CryptInterface")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local ByteUtil = java_lazy("org.allbinary.logic.java.byteutil.ByteUtil")
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

-- class table BasicCrypt is declared before the requires
BasicCrypt.__index = BasicCrypt
BasicCrypt.className = "BasicCrypt"
BasicCrypt.javaClassName = "org.allbinary.logic.system.security.crypt.jcehelper.BasicCrypt"
BasicCrypt.java_implements = " CryptInterface "
BasicCrypt.java_interfaces = function() return {CryptInterface} end

function BasicCrypt:_init_fields()
    self.byteUtil = ByteUtil.getInstance()
    if self.key == nil then self.key = nil end
end


function BasicCrypt._jinit(self, keyAsString)
    BasicCrypt._init_fields(self)
        local key = NullUtil.getInstance().NULL_BYTE_ARRAY
        local try_ok, try_error, try_value = pcall(function()
            key = TsUtil.getInstance():getByteArray(keyAsString)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "AbCrypt(alg,key)", e)
        end
        self.key = key
    return self
end

function BasicCrypt.new(...)
    local self = setmetatable({}, BasicCrypt)
    BasicCrypt._jinit(self, ...)
    return self
end


function BasicCrypt:encrypt(array)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self:mutilate(array) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("Encrypt Failed", self, "encrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicCrypt:decrypt(array)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self:mutilate(array) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("decrypt Failed", self, "decrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicCrypt:mutilate(array)
        local value = 0
        for index = 0, (self.key.n or #self.key) - 1 do
            value = self.key[index + 1]
            array = self.byteUtil:xor(array, value)
        end
        return array
end

return BasicCrypt

