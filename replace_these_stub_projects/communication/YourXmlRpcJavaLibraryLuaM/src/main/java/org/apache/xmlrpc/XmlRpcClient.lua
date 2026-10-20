-- Generated Code Do Not Modify
-- package org.apache.xmlrpc

-- local IOException = require("java.io.IOException")
-- local MalformedURLException = require("java.net.MalformedURLException")
-- local URL = require("java.net.URL")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CryptInterface = require("org.allbinary.init.crypt.jcehelper.CryptInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local XmlRpcHandler = require("org.apache.xmlrpc.XmlRpcHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local XmlRpcClient = {}
XmlRpcClient.__index = XmlRpcClient
XmlRpcClient.className = "XmlRpcClient"

function XmlRpcClient:_init_fields()
    self.url = nil
end


function XmlRpcClient.new(url)
    local self = setmetatable({}, XmlRpcClient)
    self:_init_fields()
        self.url = URL.new(url)
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
-- Java overloaded method: Lua keeps the last definition
function XmlRpcClient:execute(method, params, cryptInterface)
        return NullUtil.getInstance().NULL_OBJECT
end

return XmlRpcClient

