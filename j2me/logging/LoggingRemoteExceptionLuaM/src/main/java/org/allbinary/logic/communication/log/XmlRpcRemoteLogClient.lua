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
-- package org.allbinary.logic.communication.log

-- local IOException = require("java.io.IOException")
local XmlRpcClient = require("org.apache.xmlrpc.XmlRpcClient")
local XmlRpcException = require("org.apache.xmlrpc.XmlRpcException")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local XmlRpcAbeClient = require("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local NoCrypt = require("org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local XmlRpcRemoteLogClient = {}
XmlRpcRemoteLogClient.__index = XmlRpcRemoteLogClient
XmlRpcRemoteLogClient.className = "XmlRpcRemoteLogClient"
setmetatable(XmlRpcRemoteLogClient, {__index = XmlRpcAbeClient})

function XmlRpcRemoteLogClient:_init_fields()
    self.noCrypt = NoCrypt.new()
end


function XmlRpcRemoteLogClient.new(clientInfo)
    local self = setmetatable(XmlRpcAbeClient.new(clientInfo, "SSLLogServ.logUtil"), XmlRpcRemoteLogClient)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function XmlRpcRemoteLogClient:get(anyType)
        local try_ok, try_error = pcall(function()
            local param = BasicArrayListD.new()
            local serverUrl = self:getClientInfo():getLicenseServer(self:getServer())
            local index = serverUrl:lastIndexOf("/")
            serverUrl = string.sub(serverUrl, (0) + 1, index + 1) .. "logservssl.php"
            local xmlRpcClient = XmlRpcClient.new(serverUrl)
            self:setClient(xmlRpcClient)
            xmlRpcClient:setBasicAuthentication(nil, nil)
            local hashtable = anyType
            param:add(hashtable)
            local result = xmlRpcClient:execute(self:getRemoteMethod(), param, self.noCrypt)
            print(tostring(CommonLabels.getInstance().RESULT_ + CommonSeps.getInstance().NEW_LINE) .. tostring(result))
            return result
        end)
        if not try_ok then
            local e = try_error
            print("IOException Trying Other Servers")
            if not tostring(e):startsWith(self.HOST_NOT_RESOLVED) then
                return self:tryAnother(anyType)
            else
                error(java_exception("Exception", self.HOST_NOT_RESOLVED_MSG), 0)
            end
        end
end

return XmlRpcRemoteLogClient

