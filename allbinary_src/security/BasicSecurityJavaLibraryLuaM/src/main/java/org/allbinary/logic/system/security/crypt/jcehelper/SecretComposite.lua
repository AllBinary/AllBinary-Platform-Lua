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
-- package org.allbinary.logic.system.security.crypt.jcehelper

-- local Cipher = require("javax.crypto.Cipher")
-- local SecretKey = require("javax.crypto.SecretKey")
local ByteUtil = require("org.allbinary.logic.java.byteutil.ByteUtil")
local BaseSecretComposite = require("org.allbinary.logic.system.security.crypt.jcehelper.BaseSecretComposite")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SecretComposite = {}
SecretComposite.__index = SecretComposite
SecretComposite.className = "SecretComposite"
setmetatable(SecretComposite, {__index = BaseSecretComposite})

function SecretComposite:_init_fields()
    self.byteUtil = ByteUtil.getInstance()
    self.cipher = nil
    self.secretKey = nil
    self.key = nil
end


function SecretComposite.new(secretKey, cipher, key)
    local self = setmetatable(BaseSecretComposite.new(), SecretComposite)
    self:_init_fields()
        self.secretKey = secretKey
        self.cipher = cipher
        self.key = key
    return self
end


-- throws Exception
function SecretComposite:encrypt(array)
        array = self:mutilate(array)
        self.cipher:init(Cipher.ENCRYPT_MODE, self.secretKey)
        return self.cipher:doFinal(array)
end


-- throws Exception
function SecretComposite:decrypt(array)
        self.cipher:init(Cipher.DECRYPT_MODE, self.secretKey)
        return self:mutilate(self.cipher:doFinal(array))
end


function SecretComposite:mutilate(array)
        for index = 0, (self.key.n or #self.key) - 1 do
            local value = self.key[index + 1]
            if value < 8 and value > 0 then
                array = self.byteUtil:xorByte(array, value)
            end
        end
        return array
end

return SecretComposite

