-- Generated Code Do Not Modify
-- package org.bouncycastle.jce.provider

-- local Provider = require("java.security.Provider")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BouncyCastleProvider = {}
BouncyCastleProvider.__index = BouncyCastleProvider
BouncyCastleProvider.className = "BouncyCastleProvider"
setmetatable(BouncyCastleProvider, {__index = Provider})


function BouncyCastleProvider.new()
    local self = setmetatable(Provider.new(BouncyCastleProvider.PROVIDER_NAME, 1.41, BouncyCastleProvider.info), BouncyCastleProvider)
        -- super(...) made self above
    return self
end


function BouncyCastleProvider:setParameter(parameterName, parameter)
end

BouncyCastleProvider.info = "BouncyCastle Security Provider v1.41"
BouncyCastleProvider.PROVIDER_NAME = "BC"

return BouncyCastleProvider

