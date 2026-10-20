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

-- local Security = require("java.security.Security")
-- local KeySpec = require("java.security.spec.KeySpec")
-- local Cipher = require("javax.crypto.Cipher")
-- local SecretKey = require("javax.crypto.SecretKey")
-- local SecretKeyFactory = require("javax.crypto.SecretKeyFactory")
local TsUtil = require("org.allbinary.TsUtil")
local CryptInterface = require("org.allbinary.init.crypt.jcehelper.CryptInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BouncyCastleProvider = require("org.bouncycastle.jce.provider.BouncyCastleProvider")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbCrypt = {}
AbCrypt.__index = AbCrypt
AbCrypt.className = "AbCrypt"

function AbCrypt:_init_fields()
    self.tsUtil = TsUtil.getInstance()
    self.secretComposite = BaseSecretComposite.NULL_SECRET_COMPOSITE
    self.algorithm = nil
end


function AbCrypt.new(algorithm)
    local self = setmetatable({}, AbCrypt)
    self:_init_fields()
        self.algorithm = algorithm
    return self
end


function AbCrypt:init(keyAsString)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local try_ok, try_error = pcall(function()
                Security.addProvider(BouncyCastleProvider.new())
            end)
            if not try_ok then
                local e = try_error
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
            PreLogUtil.putOE("init Failed", self, commonStrings.INIT, e)
        end
end


function AbCrypt:encrypt(array)
        local try_ok, try_error = pcall(function()
            return self.secretComposite:encrypt(array)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("Encrypt Failed", self, "encrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
end


function AbCrypt:decrypt(array)
        local try_ok, try_error = pcall(function()
            return self.secretComposite:decrypt(array)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("decrypt Failed", self, "decrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
end

return AbCrypt

