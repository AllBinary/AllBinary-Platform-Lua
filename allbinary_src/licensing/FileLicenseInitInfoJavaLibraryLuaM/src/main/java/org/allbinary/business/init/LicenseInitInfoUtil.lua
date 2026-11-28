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

local LicenseInitInfoUtil = {}
package.loaded["org.allbinary.business.init.LicenseInitInfoUtil"] = LicenseInitInfoUtil

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbDataInputStream = java_lazy("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = java_lazy("org.allbinary.logic.io.AbFileInputStream")
local DataOutputStreamFactory = java_lazy("org.allbinary.logic.io.DataOutputStreamFactory")
local FileStreamFactory = java_lazy("org.allbinary.logic.io.FileStreamFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local DatabaseEncoder = java_lazy("org.allbinary.logic.system.security.crypt.DatabaseEncoder")
local WeakCrypt = java_lazy("org.allbinary.logic.system.security.crypt.WeakCrypt")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local LicenseInitInfo = java_lazy("org.allbinary.business.init.LicenseInitInfo")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table LicenseInitInfoUtil is declared before the requires
LicenseInitInfoUtil.__index = LicenseInitInfoUtil
LicenseInitInfoUtil.className = "LicenseInitInfoUtil"
LicenseInitInfoUtil.javaClassName = "org.allbinary.business.init.LicenseInitInfoUtil"

function LicenseInitInfoUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.INITFILENAME = "licenseinitdata.dat"
    self.ABOUT = "about"
    self.PRIVACY_POLICY = "privacy_policy"
    self.filePath = self.stringUtil.EMPTY_STRING
end

function LicenseInitInfoUtil._jinit(self)
    LicenseInitInfoUtil._init_fields(self)
    return self
end

function LicenseInitInfoUtil.new()
    return LicenseInitInfoUtil._jinit(setmetatable({}, LicenseInitInfoUtil))
end


function LicenseInitInfoUtil.getInstance()
        return LicenseInitInfoUtil.instance_f
end


function LicenseInitInfoUtil:setFilePath(filePath)
        self.filePath = filePath
end


-- throws Exception
function LicenseInitInfoUtil:write(initData)
        if rawequal(self.filePath, self.stringUtil.EMPTY_STRING) then
            self.filePath = URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().INIT_PATH
        end
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(require("allbinary_java").to_string("Command Failed: ") .. require("allbinary_java").to_string(self.INITFILENAME), self, "write", e)
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
        if rawequal(self.filePath, self.stringUtil.EMPTY_STRING) then
            self.filePath = URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().INIT_PATH
        end
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(require("allbinary_java").to_string("LicenseInitInfo File: ") .. require("allbinary_java").to_string(self.INITFILENAME), self, METHOD_NAME)
            local fileStreamFactory = FileStreamFactory.getInstance()
            local iFile = fileStreamFactory:getFileInputStreamInstance(self.filePath, self.INITFILENAME)
            if not rawequal(iFile, nil) then
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
                    self.logUtil:putF(require("allbinary_java").to_string(NEXT_FILE) .. require("allbinary_java").to_string(initInfo:getServer(index)), self, METHOD_NAME)
                end
                do return "__jreturn", initInfo end
            else
                error(require("java.lang.Exception").new(require("allbinary_java").to_string("Could Not Load License InitInfo: ") .. require("allbinary_java").to_string(self.INITFILENAME)), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local try_ok, try_error, try_value = pcall(function()
                self.logUtil:put(require("allbinary_java").to_string("Command Failed: ") .. require("allbinary_java").to_string(self.INITFILENAME), self, METHOD_NAME, e)
            end)
            if not try_ok then
                local e2 = try_error
                if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
                self.logUtil:put(require("allbinary_java").to_string("LicenseInitInfo Read Retry: ") .. require("allbinary_java").to_string(self.INITFILENAME), self, "readAgain()", e2)
            end
            error(require("java.lang.Exception").new(require("allbinary_java").to_string("LicenseInitInfo Read Error: ") .. require("allbinary_java").to_string(self.INITFILENAME)), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function LicenseInitInfoUtil:getFilePath()
        return self.filePath
end

LicenseInitInfoUtil.instance_f = LicenseInitInfoUtil.new()

return LicenseInitInfoUtil

