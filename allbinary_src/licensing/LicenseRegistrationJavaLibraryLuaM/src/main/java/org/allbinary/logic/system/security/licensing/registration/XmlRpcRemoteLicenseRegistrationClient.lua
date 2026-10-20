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
-- package org.allbinary.logic.system.security.licensing.registration

-- local IOException = require("java.io.IOException")
local XmlRpcClient = require("org.apache.xmlrpc.XmlRpcClient")
local XmlRpcException = require("org.apache.xmlrpc.XmlRpcException")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CryptInterface = require("org.allbinary.init.crypt.jcehelper.CryptInterface")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = require("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local ExceptionUtil = require("org.allbinary.logic.java.exception.ExceptionUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

local XmlRpcRemoteLicenseRegistrationClient = {}
XmlRpcRemoteLicenseRegistrationClient.__index = XmlRpcRemoteLicenseRegistrationClient
XmlRpcRemoteLicenseRegistrationClient.className = "XmlRpcRemoteLicenseRegistrationClient"
setmetatable(XmlRpcRemoteLicenseRegistrationClient, {__index = XmlRpcAbeClient})

function XmlRpcRemoteLicenseRegistrationClient:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.PAGE = "licenseregistrationserverssl.php"
end


function XmlRpcRemoteLicenseRegistrationClient.new(clientInfo)
    local self = setmetatable(XmlRpcAbeClient.new(clientInfo, "LicenseRegistrationServer.process"), XmlRpcRemoteLicenseRegistrationClient)
    self:_init_fields()
        -- super(...) made self above
        self:setServer(0)
    return self
end


-- throws Exception
function XmlRpcRemoteLicenseRegistrationClient:get(anyType, cryptInterface)
        local try_ok, try_error = pcall(function()
            local server = self:getClientInfo():getLicenseServer(self:getServer())
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.TRYING)
            stringBuffer:appendint(java_int(self:getServer()))
            stringBuffer:append(SEP)
            stringBuffer:append(server)
            self.logUtil:putF(tostring(CommonLabels.getInstance().START_LABEL) .. tostring(stringBuffer), self, self.commonStrings.GET)
            local param = BasicArrayListD.new()
            local serverUrl = self:getClientInfo():getLicenseServer(self:getServer())
            local index = serverUrl:lastIndexOf("/")
            serverUrl = string.sub(serverUrl, (0) + 1, index + 1) .. self.PAGE
            local xmlRpcClient = XmlRpcClient.new(serverUrl)
            self:setClient(xmlRpcClient)
            xmlRpcClient:setBasicAuthentication(nil, nil)
            local hashtable = anyType
            self.logUtil:putF(tostring(self.CLIENT_INFO) .. tostring(hashtable), self, self.commonStrings.GET)
            param:add(hashtable)
            local result = xmlRpcClient:execute(self:getRemoteMethod(), param, cryptInterface)
            self.logUtil:putF(tostring(self.RESULT) .. tostring(result), self, self.commonStrings.GET)
            self.isOnline = true
            return result
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF(self.TRYING_OTHER_SERVERS + ExceptionUtil.getInstance():getStackTrace(e), self, self.commonStrings.GET)
            if not tostring(e):startsWith(self.HOST_NOT_RESOLVED) then
                return self:tryAnother(anyType)
            else
                error(java_exception("Exception", self.HOST_NOT_RESOLVED_MSG), 0)
            end
        end
end

return XmlRpcRemoteLicenseRegistrationClient

