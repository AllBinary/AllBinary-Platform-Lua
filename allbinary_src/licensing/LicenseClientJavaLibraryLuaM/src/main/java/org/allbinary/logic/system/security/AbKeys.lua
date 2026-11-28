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

local AbKeys = {}
package.loaded["org.allbinary.logic.system.security.AbKeys"] = AbKeys

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")

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

-- class table AbKeys is declared before the requires
AbKeys.__index = AbKeys
AbKeys.className = "AbKeys"
AbKeys.javaClassName = "org.allbinary.logic.system.security.AbKeys"

function AbKeys:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AbKeys.getInstance()
        return AbKeys.instance_f
end


function AbKeys._jinit(self)
    AbKeys._init_fields(self)
    return self
end

function AbKeys.new(...)
    local self = setmetatable({}, AbKeys)
    AbKeys._jinit(self, ...)
    return self
end


-- throws LicensingException
function AbKeys:getKey(abeClientInformation, keyName)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(require("allbinary_java").to_string("Getting Key: ") .. require("allbinary_java").to_string(keyName), self, "getKey")
            if rawequal(((keyName < "DirectX 8" and -1) or (keyName > "DirectX 8" and 1) or 0), 0) or rawequal(((keyName < "DirectX" and -1) or (keyName > "DirectX" and 1) or 0), 0) or rawequal(((keyName < "Low Level" and -1) or (keyName > "Low Level" and 1) or 0), 0) or rawequal(((keyName < "System Drivers" and -1) or (keyName > "System Drivers" and 1) or 0), 0) then
                do return "__jreturn", "Temp For Input Library" end
            end
            do return "__jreturn", AbeLicenseInterfaceFactory.getInstance():getLicenseInstance(abeClientInformation):getKey(keyName) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AbKeys.instance_f = AbKeys.new()

return AbKeys

