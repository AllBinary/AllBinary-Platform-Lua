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
-- package org.allbinary.logic.system.security

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterfaceFactory = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbKeys = {}
AbKeys.__index = AbKeys
AbKeys.className = "AbKeys"

function AbKeys:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AbKeys.getInstance()
        return AbKeys.instance
end


function AbKeys.new()
    local self = setmetatable({}, AbKeys)
    self:_init_fields()
    return self
end


-- throws LicensingException
function AbKeys:getKey(abeClientInformation, keyName)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Getting Key: " .. keyName, self, "getKey")
            if ((keyName < "DirectX 8" and -1) or (keyName > "DirectX 8" and 1) or 0) == 0 or ((keyName < "DirectX" and -1) or (keyName > "DirectX" and 1) or 0) == 0 or ((keyName < "Low Level" and -1) or (keyName > "Low Level" and 1) or 0) == 0 or ((keyName < "System Drivers" and -1) or (keyName > "System Drivers" and 1) or 0) == 0 then
                return "Temp For Input Library"
            end
            return AbeLicenseInterfaceFactory.getInstance():getLicenseInstance(abeClientInformation):getKey(keyName)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

AbKeys.instance = AbKeys.new()

return AbKeys

