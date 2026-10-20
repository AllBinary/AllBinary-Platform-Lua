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
-- package org.allbinary.logic.system.security.licensing

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

local LicensingException = {}
LicensingException.__index = LicensingException
LicensingException.className = "LicensingException"
setmetatable(LicensingException, {__index = Exception})
LicensingException.__tostring = Exception.__tostring

function LicensingException.new(...)
    local count = select("#", ...)
    if count == 0 then return LicensingException._new0(...)
    elseif count == 1 then return LicensingException._new1(...)
    end
end


function LicensingException._new0()
    local self = setmetatable(Exception.new(), LicensingException)
    return self
end


function LicensingException._new1(msg)
    local self = setmetatable(Exception.new(msg), LicensingException)
        -- super(...) made self above
    return self
end

LicensingException.serialVersionUID = 1

return LicensingException

