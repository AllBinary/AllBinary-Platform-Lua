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
-- package org.allbinary.bundle.logic.system.loader

local CryptService = {}
package.loaded["org.allbinary.bundle.logic.system.loader.CryptService"] = CryptService

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

local ByteArrayInputStream = java_lazy("java.io.ByteArrayInputStream")
local InputStream = java_lazy("java.io.InputStream")
local Globals = java_lazy("org.allbinary.globals.Globals")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local BasicTextJDialog = java_lazy("org.allbinary.gui.dialog.BasicTextJDialog")
local ExitCloseListener = java_lazy("org.allbinary.gui.dialog.ExitCloseListener")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbCryptUtil = java_lazy("org.allbinary.logic.system.security.AbCryptUtil")
local AbKeys = java_lazy("org.allbinary.logic.system.security.AbKeys")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local AbeLicenseInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory")
local AbeNoLicense = java_lazy("org.allbinary.logic.system.security.licensing.AbeNoLicense")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table CryptService is declared before the requires
CryptService.__index = CryptService
CryptService.className = "CryptService"
CryptService.javaClassName = "org.allbinary.bundle.logic.system.loader.CryptService"

function CryptService:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abCryptUtil = AbCryptUtil.getInstance()
end


function CryptService._jinit(self)
    CryptService._init_fields(self)
        Globals.getInstance():init(require("java.lang.ClassLoader").getSystemClassLoader(), "./")
        self.logUtil:putF(require("allbinary_java").to_string("Set Globals: ") .. require("allbinary_java").to_string(URLGLOBALS.getWebappPath()), self, self.commonStrings.CONSTRUCTOR)
    return self
end

function CryptService.new(...)
    local self = setmetatable({}, CryptService)
    CryptService._jinit(self, ...)
    return self
end


function CryptService:getDecryptedInputStream(abeClientInformation, name, inputStream)
        local try_ok, try_error, try_value = pcall(function()
            local key = AbKeys.getInstance():getKey(abeClientInformation, name)
            local decrypted = self.abCryptUtil:decrypt(inputStream, key)
            do return "__jreturn", ByteArrayInputStream.new(decrypted) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self:showLicenseDialog(abeClientInformation, e)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end


function CryptService:showLicenseDialog(abeClientInformation, e)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
            local basicTextJDialog = BasicTextJDialog.new(tostring(e))
            local try_ok, try_error, try_value = pcall(function()
                local abeLicenseInterface = AbeLicenseInterfaceFactory.getInstance():getLicenseInstance(abeClientInformation)
                if not rawequal(abeLicenseInterface, AbeNoLicense.getInstance()) then
                    if abeLicenseInterface:isValid() then
                        basicTextJDialog:setText("Subscription Invalid")
                    end
                end
            end)
            if not try_ok then
                local e2 = try_error
                if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e2)
            end
            basicTextJDialog:addCloseListener(ExitCloseListener.new())
            basicTextJDialog:setVisible(true)
        end)
        if not try_ok then
            local e3 = try_error
            if type(e3) ~= "table" then e3 = require("java.lang.RuntimeException").new(tostring(e3)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e3)
        end
end

return CryptService

