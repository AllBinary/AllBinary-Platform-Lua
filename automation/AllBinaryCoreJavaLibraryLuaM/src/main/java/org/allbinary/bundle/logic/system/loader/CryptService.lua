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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local InputStream = require("java.io.InputStream")
local Globals = require("org.allbinary.globals.Globals")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local BasicTextJDialog = require("org.allbinary.gui.dialog.BasicTextJDialog")
local ExitCloseListener = require("org.allbinary.gui.dialog.ExitCloseListener")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbCryptUtil = require("org.allbinary.logic.system.security.AbCryptUtil")
local AbKeys = require("org.allbinary.logic.system.security.AbKeys")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterface = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local AbeLicenseInterfaceFactory = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory")
local AbeNoLicense = require("org.allbinary.logic.system.security.licensing.AbeNoLicense")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
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

local CryptService = {}
CryptService.__index = CryptService
CryptService.className = "CryptService"

function CryptService:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abCryptUtil = AbCryptUtil.getInstance()
end


function CryptService.new()
    local self = setmetatable({}, CryptService)
    self:_init_fields()
        Globals.getInstance():init(getmetatable(self):getClassLoader(), "./")
        self.logUtil:putF("Set Globals: " .. tostring(self.URLGLOBALS:getWebappPath()), self, self.commonStrings.CONSTRUCTOR)
    return self
end


function CryptService:getDecryptedInputStream(abeClientInformation, name, inputStream)
        local try_ok, try_error = pcall(function()
            local key = AbKeys.getInstance():getKey(abeClientInformation, name)
            local decrypted = self.abCryptUtil:decrypt(inputStream, key)
            return ByteArrayInputStream.new(decrypted)
        end)
        if not try_ok then
            local e = try_error
            self:showLicenseDialog(abeClientInformation, e)
        end
        return nil
end


function CryptService:showLicenseDialog(abeClientInformation, e)
        local try_ok, try_error = pcall(function()
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
            local basicTextJDialog = BasicTextJDialog.new(tostring(e))
            local try_ok, try_error = pcall(function()
                local abeLicenseInterface = AbeLicenseInterfaceFactory.getInstance():getLicenseInstance(abeClientInformation)
                if abeLicenseInterface ~= AbeNoLicense.getInstance() then
                    if abeLicenseInterface:isValid() then
                        basicTextJDialog:setText("Subscription Invalid")
                    end
                end
            end)
            if not try_ok then
                local e2 = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e2)
            end
            basicTextJDialog:addCloseListener(ExitCloseListener.new())
            basicTextJDialog:setVisible(true)
        end)
        if not try_ok then
            local e3 = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e3)
        end
end

return CryptService

