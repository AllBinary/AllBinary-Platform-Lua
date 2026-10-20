-- Generated Code Do Not Modify
-- package org.eclipse.swt.graphics


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Resource = {}
Resource.__index = Resource
Resource.className = "Resource"

function Resource.new()
    local self = setmetatable({}, Resource)
    return self
end


function Resource:dispose()
end


function Resource:isDisposed()
        return false
end

return Resource

