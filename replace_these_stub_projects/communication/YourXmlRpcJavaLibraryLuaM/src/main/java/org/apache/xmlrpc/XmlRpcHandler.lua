-- Generated Code Do Not Modify
-- package org.apache.xmlrpc

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local XmlRpcHandler = {}
XmlRpcHandler.__index = XmlRpcHandler
XmlRpcHandler.className = "XmlRpcHandler"


-- throws Exception
function XmlRpcHandler:execute(method, params)
    error("abstract method execute")
end

return XmlRpcHandler

