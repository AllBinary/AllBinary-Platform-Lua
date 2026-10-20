-- Generated Code Do Not Modify
-- package org.osgi.framework


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
local ServiceRegistration = {}
ServiceRegistration.__index = ServiceRegistration
ServiceRegistration.className = "ServiceRegistration"


function ServiceRegistration:getReference()
    error("abstract method getReference")
end

return ServiceRegistration

