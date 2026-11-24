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

local AbCrypt = {}
package.loaded["org.allbinary.logic.system.security.crypt.jcehelper.AbCrypt"] = AbCrypt

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

-- local Security = require("java.security.Security")
-- local KeySpec = require("java.security.spec.KeySpec")
-- local Cipher = require("javax.crypto.Cipher")
-- local SecretKey = require("javax.crypto.SecretKey")
-- local SecretKeyFactory = require("javax.crypto.SecretKeyFactory")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local CryptInterface = java_lazy("org.allbinary.init.crypt.jcehelper.CryptInterface")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BouncyCastleProvider = java_lazy("org.bouncycastle.jce.provider.BouncyCastleProvider")
local BaseSecretComposite = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.BaseSecretComposite")
local KeySpecFactory = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory")
local SecretComposite = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.SecretComposite")

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

-- class table AbCrypt is declared before the requires
AbCrypt.__index = AbCrypt
AbCrypt.className = "AbCrypt"
AbCrypt.javaClassName = "org.allbinary.logic.system.security.crypt.jcehelper.AbCrypt"
AbCrypt.java_implements = " CryptInterface "
AbCrypt.java_interfaces = function() return {CryptInterface} end

function AbCrypt:_init_fields()
    self.tsUtil = TsUtil.getInstance()
    self.secretComposite = BaseSecretComposite.NULL_SECRET_COMPOSITE
    if self.algorithm == nil then self.algorithm = nil end
end


function AbCrypt._jinit(self, algorithm)
    AbCrypt._init_fields(self)
        self.algorithm = algorithm
    return self
end

function AbCrypt.new(...)
    local self = setmetatable({}, AbCrypt)
    AbCrypt._jinit(self, ...)
    return self
end


function AbCrypt:init(keyAsString)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local try_ok, try_error, try_value = pcall(function()
                Security.addProvider(BouncyCastleProvider.new())
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
            end
            local key = self.tsUtil:getByteArray(keyAsString)
            local keySpec = KeySpecFactory.getInstance():getInstance(self.algorithm, key)
            local keyFactory = SecretKeyFactory.getInstance(self.algorithm)
            local secretKey = keyFactory:generateSecret(keySpec)
            local cipher = Cipher.getInstance(self.algorithm)
            self.secretComposite = SecretComposite.new(secretKey, cipher, key)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("init Failed", self, commonStrings.INIT, e)
        end
end


function AbCrypt:encrypt(array)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.secretComposite:encrypt(array) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("Encrypt Failed", self, "encrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbCrypt:decrypt(array)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.secretComposite:decrypt(array) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE("decrypt Failed", self, "decrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return AbCrypt

