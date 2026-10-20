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

local SuperCrypt = {}
SuperCrypt.__index = SuperCrypt
SuperCrypt.className = "SuperCrypt"


function SuperCrypt.new(key)
    local self = setmetatable({}, SuperCrypt)
    return self
end


function SuperCrypt:encrypt(value)
        return nil
end


function SuperCrypt:decrypt(value)
        return nil
end

SuperCrypt.KEYMAX = 0

return SuperCrypt

