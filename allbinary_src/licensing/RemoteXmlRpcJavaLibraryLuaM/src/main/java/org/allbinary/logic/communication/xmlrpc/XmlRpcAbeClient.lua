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
-- package org.allbinary.logic.communication.xmlrpc

local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local NullXmlRpcHandler = require("org.apache.xmlrpc.NullXmlRpcHandler")
local XmlRpcClient = require("org.apache.xmlrpc.XmlRpcClient")
local XmlRpcHandler = require("org.apache.xmlrpc.XmlRpcHandler")

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

local XmlRpcAbeClient = {}
XmlRpcAbeClient.__index = XmlRpcAbeClient
XmlRpcAbeClient.className = "XmlRpcAbeClient"

function XmlRpcAbeClient:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.remoteMethod = nil
    self.clientInfo = nil
    self.client = NullXmlRpcHandler.NULL_XML_RPC_HANDLER
    self.server = nil
    self.start = 0
    self.maxServers = 0
    self.isDone = nil
    self.START_SERVER = "Start With Server #"
    self.TRYING = "Trying Server #"
    self.SEP = CommonLabels.getInstance().COLON_SEP
    self.CLIENT_INFO = "Client Info: \n"
    self.RESULT = CommonLabels.getInstance().RESULT_ + CommonSeps.getInstance().NEW_LINE
    self.INVALID = "License data is Invalid Trying Other Servers"
    self.EXCEPTION_IN_CLIENT = "Exception in client"
    self.SERVER_REPORTED_ERROR = "Server reported error"
    self.UNKNOWN_ERROR = "Unknown License Retrieval Failure"
    self.TRYING_OTHER_SERVERS = "IOException Trying Other Servers"
    self.HOST_NOT_RESOLVED_MSG = "Not Trying Again Since Host Unresolved"
    self.HOST_NOT_RESOLVED = "Host is unresolved"
    self.myRandomFactory = MyRandomFactory.getInstance()
end


function XmlRpcAbeClient.new(clientInfo, remoteMethod)
    local self = setmetatable({}, XmlRpcAbeClient)
    self:_init_fields()
        self.remoteMethod = remoteMethod
        self.clientInfo = clientInfo
        if clientInfo:getNumberOfLicenseServers() > 1 then
            self.maxServers = clientInfo:getNumberOfLicenseServers() - 2
            self.start = self.myRandomFactory:getAbsoluteNextInt(self.maxServers) + 1
        elseif clientInfo:getNumberOfLicenseServers() == 1 then
            self.maxServers = 0
            self.start = 0
        end
        self.isDone = false
        self.server = self.start
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.START_SERVER)
        stringBuffer:appendint(self:getServer())
        stringBuffer:append(self.SEP)
        stringBuffer:append(clientInfo:getLicenseServer(self:getServer()))
        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.CONSTRUCTOR)
    return self
end


-- throws Exception
function XmlRpcAbeClient:get(anyType)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
        return NullUtil.getInstance().NULL_OBJECT
end


-- throws Exception
function XmlRpcAbeClient:tryAnother(anyType)
        if self:getServer() < self:getMaxServers() then
            self:setServer(self:getServer() + 1)
        else
            self:setServer(0)
        end
        if self:getServer() ~= self:getStart() and not self:isIsDone() then
            return self:get(anyType)
        else
            self:setIsDone(true)
        end
        error(java_exception("Exception", "Tried All Servers But Still Failed"), 0)
end


function XmlRpcAbeClient:getClientInfo()
        return self.clientInfo
end


function XmlRpcAbeClient:getClient()
        return self.client
end


function XmlRpcAbeClient:setClient(client)
        self.client = client
end


function XmlRpcAbeClient:getServer()
        return self.server
end


function XmlRpcAbeClient:setServer(server)
        self.server = server
end


function XmlRpcAbeClient:getStart()
        return self.start
end


function XmlRpcAbeClient:setStart(start)
        self.start = start
end


function XmlRpcAbeClient:getMaxServers()
        return self.maxServers
end


function XmlRpcAbeClient:setMaxServers(maxServers)
        self.maxServers = maxServers
end


function XmlRpcAbeClient:isIsDone()
        return self.isDone
end


function XmlRpcAbeClient:setIsDone(isDone)
        self.isDone = isDone
end


function XmlRpcAbeClient:getRemoteMethod()
        return self.remoteMethod
end

XmlRpcAbeClient.isOnline = true

return XmlRpcAbeClient

