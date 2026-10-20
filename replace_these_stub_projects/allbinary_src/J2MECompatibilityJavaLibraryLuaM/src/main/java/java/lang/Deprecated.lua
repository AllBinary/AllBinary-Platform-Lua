-- Generated Code Do Not Modify
-- package java.lang


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--J2SE to J2ME compatibility
local Deprecated = {}
Deprecated.__index = Deprecated
Deprecated.className = "Deprecated"

function Deprecated.new()
    local self = setmetatable({}, Deprecated)
    return self
end

return Deprecated

