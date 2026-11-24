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
-- package org.allbinary.game.score.remote

local XmlRpcRemoteHighScoresClient = {}
package.loaded["org.allbinary.game.score.remote.XmlRpcRemoteHighScoresClient"] = XmlRpcRemoteHighScoresClient

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
-- local IOException = require("java.io.IOException")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CryptInterface = java_lazy("org.allbinary.init.crypt.jcehelper.CryptInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = require("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local ExceptionUtil = java_lazy("org.allbinary.logic.java.exception.ExceptionUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local XmlRpcClient = java_lazy("org.apache.xmlrpc.XmlRpcClient")
local XmlRpcException = java_lazy("org.apache.xmlrpc.XmlRpcException")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table XmlRpcRemoteHighScoresClient is declared before the requires
XmlRpcRemoteHighScoresClient.__index = XmlRpcRemoteHighScoresClient
XmlRpcRemoteHighScoresClient.className = "XmlRpcRemoteHighScoresClient"
XmlRpcRemoteHighScoresClient.javaClassName = "org.allbinary.game.score.remote.XmlRpcRemoteHighScoresClient"
setmetatable(XmlRpcRemoteHighScoresClient, {__index = XmlRpcAbeClient})

function XmlRpcRemoteHighScoresClient:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.page == nil then self.page = nil end
end


function XmlRpcRemoteHighScoresClient._jinit(self, clientInfo, page, remoteMethod)
    java_super_init(XmlRpcAbeClient, self, clientInfo, remoteMethod)
    XmlRpcRemoteHighScoresClient._init_fields(self)
        -- super(...) made self above
        self.page = page
        self:setServer(0)
    return self
end

function XmlRpcRemoteHighScoresClient.new(...)
    local self = setmetatable({}, XmlRpcRemoteHighScoresClient)
    XmlRpcRemoteHighScoresClient._jinit(self, ...)
    return self
end


-- throws Exception
function XmlRpcRemoteHighScoresClient:get(anyType, cryptInterface)
        local try_ok, try_error, try_value = pcall(function()
            local param = BasicArrayListD.new()
            local serverUrl = self:getClientInfo():getLicenseServer(self:getServer())
            local index = serverUrl:lastIndexOf("/")
            serverUrl = string.sub(serverUrl, (0) + 1, index + 1) .. self.page
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.TRYING)
            stringBuffer:appendint(java_int(self:getServer()))
            stringBuffer:append(SEP)
            stringBuffer:append(serverUrl)
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.GET)
            local xmlRpcClient = XmlRpcClient.new(serverUrl)
            self:setClient(xmlRpcClient)
            xmlRpcClient:setBasicAuthentication(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING)
            local hashtable = anyType
            self.logUtil:putF(tostring(self.CLIENT_INFO) .. tostring(hashtable), self, self.commonStrings.GET)
            param:add(hashtable)
            local result = xmlRpcClient:executeWithCrypt(self:getRemoteMethod(), param, cryptInterface)
            self.logUtil:putF(tostring(self.RESULT) .. tostring(result), self, self.commonStrings.GET)
            self.isOnline = true
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.TRYING_OTHER_SERVERS + ExceptionUtil.getInstance():getStackTrace(e), self, self.commonStrings.GET, e)
            if not tostring(e):startsWith(self.HOST_NOT_RESOLVED) then
                return self:tryAnother(anyType)
            else
                error(require("java.lang.Exception").new(self.HOST_NOT_RESOLVED_MSG), 0)
            end
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(XmlRpcRemoteHighScoresClient, "get", 2, function(java_a1, java_a2) return true and (java_a2 == nil or java_is(java_a2, "CryptInterface")) end)

return XmlRpcRemoteHighScoresClient

