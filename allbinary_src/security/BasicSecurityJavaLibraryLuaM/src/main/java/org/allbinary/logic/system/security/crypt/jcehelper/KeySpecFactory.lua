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

-- local KeySpec = require("java.security.spec.KeySpec")
-- local DESKeySpec = require("javax.crypto.spec.DESKeySpec")
-- local DESedeKeySpec = require("javax.crypto.spec.DESedeKeySpec")
local TsUtil = require("org.allbinary.TsUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeySpecFactory = {}
KeySpecFactory.__index = KeySpecFactory
KeySpecFactory.className = "KeySpecFactory"

function KeySpecFactory:_init_fields()
    self.DES = "DES"
    self.DESEDE = "DESede"
    self.BLOWFISH = "Blowfish"
end


function KeySpecFactory.getInstance()
        return KeySpecFactory.instance
end


function KeySpecFactory.new()
    local self = setmetatable({}, KeySpecFactory)
    self:_init_fields()
    return self
end


-- Java overloaded method: Lua keeps the last definition
function KeySpecFactory:getInstance(algorithm, keyData)
        local try_ok, try_error = pcall(function()
            local tsUtil = TsUtil.getInstance()
            if tsUtil:compareTo(algorithm, self.DES) == 0 then
                return DESKeySpec.new(keyData)
            elseif tsUtil:compareTo(algorithm, self.DESEDE) == 0 then
                return DESedeKeySpec.new(keyData)
            else
                error(java_exception("RuntimeException"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            error(java_exception("RuntimeException"), 0)
        end
end

KeySpecFactory.instance = KeySpecFactory.new()

return KeySpecFactory

