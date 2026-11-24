-- Generated Code Do Not Modify
-- package org.apache.xmlrpc

local XmlRpcClient = {}
package.loaded["org.apache.xmlrpc.XmlRpcClient"] = XmlRpcClient

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

-- local IOException = require("java.io.IOException")
-- local MalformedURLException = require("java.net.MalformedURLException")
-- local URL = require("java.net.URL")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CryptInterface = java_lazy("org.allbinary.init.crypt.jcehelper.CryptInterface")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local XmlRpcHandler = require("org.apache.xmlrpc.XmlRpcHandler")
local XmlRpcException = java_lazy("org.apache.xmlrpc.XmlRpcException")

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

-- class table XmlRpcClient is declared before the requires
XmlRpcClient.__index = XmlRpcClient
XmlRpcClient.className = "XmlRpcClient"
XmlRpcClient.javaClassName = "org.apache.xmlrpc.XmlRpcClient"
XmlRpcClient.java_implements = " XmlRpcHandler "
XmlRpcClient.java_interfaces = function() return {XmlRpcHandler} end

function XmlRpcClient:_init_fields()
    if self.url == nil then self.url = nil end
end


function XmlRpcClient._jinit(self, url)
    XmlRpcClient._init_fields(self)
        self.url = URL.new(url)
    return self
end

function XmlRpcClient.new(...)
    local self = setmetatable({}, XmlRpcClient)
    XmlRpcClient._jinit(self, ...)
    return self
end


function XmlRpcClient:getURL()
        return self.url
end


function XmlRpcClient:setBasicAuthentication(user, password)
end


-- throws XmlRpcException, IOException
function XmlRpcClient:execute(method, params)
        return NullUtil.getInstance().NULL_OBJECT
end


-- throws XmlRpcException, IOException
function XmlRpcClient:executeWithCrypt(method, params, cryptInterface)
        return NullUtil.getInstance().NULL_OBJECT
end

return XmlRpcClient

