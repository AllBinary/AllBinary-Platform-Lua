-- Generated Code Do Not Modify
-- package org.allbinary.logic.control.crypt


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Encoder = {}
Encoder.__index = Encoder
Encoder.className = "Encoder"


function Encoder.new()
    local self = setmetatable({}, Encoder)
    return self
end


function Encoder.encode(value)
        return nil
end


function Encoder.decode(value)
        return nil
end

return Encoder

