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
-- package org.allbinary.business.user.commerce.money.payment

-- java.lang.Exception has no Lua module
local Exception = {}
Exception.__index = Exception
Exception.className = "Exception"
function Exception.new(message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    return setmetatable({message = message, cause = cause}, Exception)
end
function Exception:getMessage() return self.message end
function Exception:getCause() return self.cause end
function Exception:printStackTrace() print(debug.traceback(tostring(self))) end
-- tostring gives the message like Java getMessage
Exception.__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentException = {}
PaymentException.__index = PaymentException
PaymentException.className = "PaymentException"
setmetatable(PaymentException, {__index = Exception})
PaymentException.__tostring = Exception.__tostring


function PaymentException.new(error)
    local self = setmetatable(Exception.new(error), PaymentException)
        -- super(...) made self above
    return self
end

return PaymentException

