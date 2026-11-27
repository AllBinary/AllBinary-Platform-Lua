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

local AbBasicCrypt = {}
package.loaded["org.allbinary.logic.system.security.crypt.jcehelper.AbBasicCrypt"] = AbBasicCrypt

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

-- local Provider = require("java.security.Provider")
-- local Security = require("java.security.Security")
-- local KeySpec = require("java.security.spec.KeySpec")
-- local Cipher = require("javax.crypto.Cipher")
-- local SecretKey = require("javax.crypto.SecretKey")
-- local SecretKeyFactory = require("javax.crypto.SecretKeyFactory")
local CryptInterface = java_lazy("org.allbinary.init.crypt.jcehelper.CryptInterface")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local SunJCE = java_lazy("com.sun.crypto.provider.SunJCE")
local KeySpecFactory = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory")

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

-- class table AbBasicCrypt is declared before the requires
AbBasicCrypt.__index = AbBasicCrypt
AbBasicCrypt.className = "AbBasicCrypt"
AbBasicCrypt.javaClassName = "org.allbinary.logic.system.security.crypt.jcehelper.AbBasicCrypt"
AbBasicCrypt.java_implements = " CryptInterface "
AbBasicCrypt.java_interfaces = function() return {CryptInterface} end

function AbBasicCrypt:_init_fields()
    if self.cipher == nil then self.cipher = nil end
    if self.secretKey == nil then self.secretKey = nil end
    if self.algorithm == nil then self.algorithm = nil end
    if self.key == nil then self.key = nil end
end


function AbBasicCrypt._jinit(self, algorithm, key)
    AbBasicCrypt._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.algorithm = algorithm
            self.key = key:getBytes()
            self:init()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "AbCrypt(alg,key)", e)
        end
    return self
end

function AbBasicCrypt.new(...)
    local self = setmetatable({}, AbBasicCrypt)
    AbBasicCrypt._jinit(self, ...)
    return self
end


function AbBasicCrypt:init()
        local try_ok, try_error, try_value = pcall(function()
            local sunJce = SunJCE.new()
            Security.addProvider(sunJce)
            local keySpec = KeySpecFactory.getInstance():getInstance(self.algorithm, self.key)
            local keyFactory = SecretKeyFactory.getInstance(self.algorithm)
            self.secretKey = keyFactory:generateSecret(keySpec)
            self.cipher = Cipher.getInstance(self.algorithm)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE("init Failed", self, commonStrings.INIT, e)
        end
end


function AbBasicCrypt:encrypt(array)
        local try_ok, try_error, try_value = pcall(function()
            self.cipher:init(Cipher.ENCRYPT_MODE, self.secretKey)
            local ivArray = self.secretKey:getEncoded()
            local encrypted = self.cipher:doFinal(array)
            local result = java_typed_array("B", java_new_array(0, (ivArray.n or #ivArray) + (encrypted.n or #encrypted)))
            PreLogUtil.put("ivArray Length: " .. tostring((ivArray.n or #ivArray)), self, "encrypt")
            for index = 0, (ivArray.n or #ivArray) - 1 do
                result[index + 1] = ivArray[index + 1]
            end
            for index = 0, (encrypted.n or #encrypted) - 1 do
                result[index + (ivArray.n or #ivArray) + 1] = encrypted[index + 1]
            end
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("Encrypt Failed", self, "encrypt", e)
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbBasicCrypt:decrypt(array)
        local try_ok, try_error, try_value = pcall(function()
            self.cipher:init(Cipher.DECRYPT_MODE, self.secretKey)
            local ivArray = java_typed_array("B", java_new_array(0, 8))
            for index = 0, 8 - 1 do
                ivArray[index + 1] = array[index + 1]
            end
            PreLogUtil.put("ivArray Length: " .. tostring((ivArray.n or #ivArray)), self, "encrypt")
            local result = java_typed_array("B", java_new_array(0, (array.n or #array) - (ivArray.n or #ivArray)))
            for index = (ivArray.n or #ivArray), (array.n or #array) - 1 do
                result[index - (ivArray.n or #ivArray) + 1] = array[index + 1]
            end
            local decrypted = self.cipher:doFinal(result)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("decrypt Failed", self, "decrypt", e)
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return AbBasicCrypt

