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

-- local Provider = require("java.security.Provider")
-- local Security = require("java.security.Security")
-- local KeySpec = require("java.security.spec.KeySpec")
-- local Cipher = require("javax.crypto.Cipher")
-- local SecretKey = require("javax.crypto.SecretKey")
-- local SecretKeyFactory = require("javax.crypto.SecretKeyFactory")
local CryptInterface = require("org.allbinary.init.crypt.jcehelper.CryptInterface")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbBasicCrypt = {}
AbBasicCrypt.__index = AbBasicCrypt
AbBasicCrypt.className = "AbBasicCrypt"

function AbBasicCrypt:_init_fields()
    self.cipher = nil
    self.secretKey = nil
    self.algorithm = nil
    self.key = nil
end


function AbBasicCrypt.new(algorithm, key)
    local self = setmetatable({}, AbBasicCrypt)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.algorithm = algorithm
            self.key = key:getBytes()
            self:init()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "AbCrypt(alg,key)", e)
        end
    return self
end


function AbBasicCrypt:init()
        local try_ok, try_error = pcall(function()
            local sunJce = SunJCE.new()
            Security.addProvider(sunJce)
            local keySpec = KeySpecFactory.getInstance():getInstance(self.algorithm, self.key)
            local keyFactory = SecretKeyFactory.getInstance(self.algorithm)
            self.secretKey = keyFactory:generateSecret(keySpec)
            self.cipher = Cipher.getInstance(self.algorithm)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE("init Failed", self, commonStrings.INIT, e)
        end
end


function AbBasicCrypt:encrypt(array)
        local try_ok, try_error = pcall(function()
            self.cipher:init(Cipher.ENCRYPT_MODE, self.secretKey)
            local ivArray = self.secretKey:getEncoded()
            local encrypted = self.cipher:doFinal(array)
            local result = java_new_array(0, (ivArray.n or #ivArray) + (encrypted.n or #encrypted))
            PreLogUtil.put("ivArray Length: " .. tostring((ivArray.n or #ivArray)), self, "encrypt")
            for index = 0, (ivArray.n or #ivArray) - 1 do
                result[index + 1] = ivArray[index + 1]
            end
            for index = 0, (encrypted.n or #encrypted) - 1 do
                result[index + (ivArray.n or #ivArray) + 1] = encrypted[index + 1]
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("Encrypt Failed", self, "encrypt", e)
            return nil
        end
end


function AbBasicCrypt:decrypt(array)
        local try_ok, try_error = pcall(function()
            self.cipher:init(Cipher.DECRYPT_MODE, self.secretKey)
            local ivArray = java_new_array(0, 8)
            for index = 0, 8 - 1 do
                ivArray[index + 1] = array[index + 1]
            end
            PreLogUtil.put("ivArray Length: " .. tostring((ivArray.n or #ivArray)), self, "encrypt")
            local result = java_new_array(0, (array.n or #array) - (ivArray.n or #ivArray))
            for index = (ivArray.n or #ivArray), (array.n or #array) - 1 do
                result[index - (ivArray.n or #ivArray) + 1] = array[index + 1]
            end
            local decrypted = self.cipher:doFinal(result)
            return result
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("decrypt Failed", self, "decrypt", e)
            return nil
        end
end

return AbBasicCrypt

