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

local TsUtil = require("org.allbinary.TsUtil")
local CryptInterface = require("org.allbinary.init.crypt.jcehelper.CryptInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local ByteUtil = require("org.allbinary.logic.java.byteutil.ByteUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicCrypt = {}
BasicCrypt.__index = BasicCrypt
BasicCrypt.className = "BasicCrypt"

function BasicCrypt:_init_fields()
    self.byteUtil = ByteUtil.getInstance()
    self.key = nil
end


function BasicCrypt.new(keyAsString)
    local self = setmetatable({}, BasicCrypt)
    self:_init_fields()
        local key = NullUtil.getInstance().NULL_BYTE_ARRAY
        local try_ok, try_error = pcall(function()
            key = TsUtil.getInstance():getByteArray(keyAsString)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "AbCrypt(alg,key)", e)
        end
        self.key = key
    return self
end


function BasicCrypt:encrypt(array)
        local try_ok, try_error = pcall(function()
            return self:mutilate(array)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("Encrypt Failed", self, "encrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
end


function BasicCrypt:decrypt(array)
        local try_ok, try_error = pcall(function()
            return self:mutilate(array)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("decrypt Failed", self, "decrypt", e)
            return NullUtil.getInstance().NULL_BYTE_ARRAY
        end
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

