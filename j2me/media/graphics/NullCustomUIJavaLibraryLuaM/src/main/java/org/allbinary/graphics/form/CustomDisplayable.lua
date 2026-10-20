-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomDisplayable = {}
CustomDisplayable.__index = CustomDisplayable
CustomDisplayable.className = "CustomDisplayable"

function CustomDisplayable.new()
    local self = setmetatable({}, CustomDisplayable)
    return self
end


function CustomDisplayable:setTitle(title)
end

return CustomDisplayable

