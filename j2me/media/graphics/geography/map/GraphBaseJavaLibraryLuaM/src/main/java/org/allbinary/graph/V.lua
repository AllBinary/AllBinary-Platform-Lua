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

local V = {}
V.__index = V
V.className = "V"

function V.new()
    local self = setmetatable({}, V)
    return self
end


function V:getId()
        return 0
end

return V

