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

local XmlRpcAbeClient = {}
package.loaded["org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient"] = XmlRpcAbeClient

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

local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NullXmlRpcHandler = java_lazy("org.apache.xmlrpc.NullXmlRpcHandler")
local XmlRpcClient = java_lazy("org.apache.xmlrpc.XmlRpcClient")
local XmlRpcHandler = java_lazy("org.apache.xmlrpc.XmlRpcHandler")

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

-- class table XmlRpcAbeClient is declared before the requires
XmlRpcAbeClient.__index = XmlRpcAbeClient
XmlRpcAbeClient.className = "XmlRpcAbeClient"
XmlRpcAbeClient.javaClassName = "org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient"

function XmlRpcAbeClient:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.remoteMethod == nil then self.remoteMethod = nil end
    if self.clientInfo == nil then self.clientInfo = nil end
    self.client = NullXmlRpcHandler.NULL_XML_RPC_HANDLER
    if self.server == nil then self.server = nil end
    if self.start == nil then self.start = 0 end
    if self.maxServers == nil then self.maxServers = 0 end
    if self.isDone == nil then self.isDone = nil end
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


function XmlRpcAbeClient._jinit(self, clientInfo, remoteMethod)
    XmlRpcAbeClient._init_fields(self)
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

function XmlRpcAbeClient.new(...)
    local self = setmetatable({}, XmlRpcAbeClient)
    XmlRpcAbeClient._jinit(self, ...)
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
        error(require("java.lang.Exception").new("Tried All Servers But Still Failed"), 0)
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

