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
-- package org.allbinary.business.init

local TsUtil = require("org.allbinary.TsUtil")
local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbDataInputStream = require("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local FileStreamFactory = require("org.allbinary.logic.io.FileStreamFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local DatabaseEncoder = require("org.allbinary.logic.system.security.crypt.DatabaseEncoder")
local WeakCrypt = require("org.allbinary.logic.system.security.crypt.WeakCrypt")
local CommonLabels = require("org.allbinary.string.CommonLabels")

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

local LicenseInitInfoUtil = {}
LicenseInitInfoUtil.__index = LicenseInitInfoUtil
LicenseInitInfoUtil.className = "LicenseInitInfoUtil"

function LicenseInitInfoUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.INITFILENAME = "licenseinitdata.dat"
    self.ABOUT = "about"
    self.PRIVACY_POLICY = "privacy_policy"
    self.filePath = self.stringUtil.EMPTY_STRING
end

function LicenseInitInfoUtil.new()
    local self = setmetatable({}, LicenseInitInfoUtil)
    self:_init_fields()
    return self
end


function LicenseInitInfoUtil.getInstance()
        return LicenseInitInfoUtil.instance
end


function LicenseInitInfoUtil:setFilePath(filePath)
        self.filePath = filePath
end


-- throws Exception
function LicenseInitInfoUtil:write(initData)
        if self.filePath == self.stringUtil.EMPTY_STRING then
            self.filePath = self.URLGLOBALS:getMainPath() + self.PATH_GLOBALS:getInstance().INIT_PATH
        end
        local try_ok, try_error = pcall(function()
            local tsUtil = TsUtil.getInstance()
            local dataOutputStream = DataOutputStreamFactory.getInstance():getInstance(self.filePath, self.INITFILENAME)
            local licenseIdCrypted = tsUtil:getByteArray(WeakCrypt.new(1):encrypt(initData:getLicenseId()))
            dataOutputStream:writeUTF(DatabaseEncoder.encode(licenseIdCrypted))
            local numberOfLicenseServers = initData:getNumberOfServers()
            dataOutputStream:writeInt(numberOfLicenseServers)
            local licenseServerCrypted = nil
            for index = 0, numberOfLicenseServers - 1 do
                licenseServerCrypted = tsUtil:getByteArray(WeakCrypt.new(3):encrypt(initData:getServer(index)))
                dataOutputStream:writeUTF(DatabaseEncoder.encode(licenseServerCrypted))
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Command Failed: " .. self.INITFILENAME, self, "write", e)
            FileStreamFactory.getInstance():delete(self.filePath, self.INITFILENAME)
            error(e, 0)
        end
end


-- throws Exception
function LicenseInitInfoUtil:read()
        return self:readAgain(0)
end


-- throws Exception
function LicenseInitInfoUtil:readAgain(initializeCounter)
        local METHOD_NAME = "readAgain"
        if self.filePath == self.stringUtil.EMPTY_STRING then
            self.filePath = self.URLGLOBALS:getMainPath() + self.PATH_GLOBALS:getInstance().INIT_PATH
        end
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("LicenseInitInfo File: " .. self.INITFILENAME, self, METHOD_NAME)
            local fileStreamFactory = FileStreamFactory.getInstance()
            local iFile = fileStreamFactory:getFileInputStreamInstance(self.filePath, self.INITFILENAME)
            if iFile ~= nil then
                local iData = AbDataInputStream.new(iFile)
                local initInfo = LicenseInitInfo.new()
                local decodedByteArray = DatabaseEncoder.decode(iData:readUTF())
                local licenseIdDecoded = string.char(table.unpack(decodedByteArray))
                initInfo:setLicenseId(WeakCrypt.new(1):decrypt(licenseIdDecoded))
                local numberOfLicenseServers = iData:readInt()
                local NEXT_FILE = tostring(StringMaker.new():append(CommonLabels.getInstance().NEXT):append(" License Server From File: "))
                local licenseServerDecoded = nil
                for index = 0, numberOfLicenseServers - 1 do
                    decodedByteArray = DatabaseEncoder.decode(iData:readUTF())
                    licenseServerDecoded = string.char(table.unpack(decodedByteArray))
                    initInfo:setServer(WeakCrypt.new(3):decrypt(licenseServerDecoded), index)
                    self.logUtil:putF(NEXT_FILE .. tostring(initInfo:getServer(index)), self, METHOD_NAME)
                end
                return initInfo
            else
                error(java_exception("Exception", "Could Not Load License InitInfo: " .. self.INITFILENAME), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            local try_ok, try_error = pcall(function()
                self.logUtil:put("Command Failed: " .. self.INITFILENAME, self, METHOD_NAME, e)
            end)
            if not try_ok then
                local e2 = try_error
                self.logUtil:put("LicenseInitInfo Read Retry: " .. self.INITFILENAME, self, "readAgain()", e2)
            end
            error(java_exception("Exception", "LicenseInitInfo Read Error: " .. self.INITFILENAME), 0)
        end
end


function LicenseInitInfoUtil:getFilePath()
        return self.filePath
end

LicenseInitInfoUtil.instance = LicenseInitInfoUtil.new()

return LicenseInitInfoUtil

