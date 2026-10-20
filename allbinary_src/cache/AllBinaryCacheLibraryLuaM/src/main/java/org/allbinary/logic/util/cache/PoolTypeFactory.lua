-- Generated Code Do Not Modify
-- package org.allbinary.logic.util.cache


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PoolTypeFactory = {}
PoolTypeFactory.__index = PoolTypeFactory
PoolTypeFactory.className = "PoolTypeFactory"

function PoolTypeFactory:_init_fields()
    self.VECTOR_POOL = PoolType.new(CacheTypeFactory.getInstance().NO_CACHE)
end

function PoolTypeFactory.new()
    local self = setmetatable({}, PoolTypeFactory)
    self:_init_fields()
    return self
end


function PoolTypeFactory.getInstance()
        return PoolTypeFactory.instance
end

PoolTypeFactory.instance = PoolTypeFactory.new()

return PoolTypeFactory

