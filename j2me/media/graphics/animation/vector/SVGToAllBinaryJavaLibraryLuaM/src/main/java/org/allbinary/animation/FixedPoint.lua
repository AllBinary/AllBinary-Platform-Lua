-- Generated Code Do Not Modify
-- package org.allbinary.animation


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FixedPoint = {}
FixedPoint.__index = FixedPoint
FixedPoint.className = "FixedPoint"

function FixedPoint:_init_fields()
    self.ONE = 1 << 16
end

function FixedPoint.new()
    local self = setmetatable({}, FixedPoint)
    self:_init_fields()
    return self
end


function FixedPoint.getInstance()
        return FixedPoint.instance
end


function FixedPoint:toFixed(val)
        return java_int((val * 65536.0))
end


-- Java overloaded method: Lua keeps the last definition
function FixedPoint:toFixed(val)
        return java_int((val * 65536.0))
end


function FixedPoint:mul(a, b)
        return ((((a * b)) // (1 << (16))))
end


function FixedPoint:div(a, b)
        return (java_idiv(((a) << 16), b))
end


function FixedPoint:toInt(fixed)
        return ((fixed) // (1 << (16)))
end

FixedPoint.instance = FixedPoint.new()

return FixedPoint

