-- Generated Code Do Not Modify
-- package org.allbinary.graph


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local E = {}
E.__index = E
E.className = "E"

function E.new()
    local self = setmetatable({}, E)
    return self
end


function E:newInstance()
        return E.e
end

E.e = E.new()

return E

