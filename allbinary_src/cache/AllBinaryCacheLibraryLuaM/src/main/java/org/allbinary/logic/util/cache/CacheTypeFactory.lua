-- Generated Code Do Not Modify
-- package org.allbinary.logic.util.cache

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CacheTypeFactory = {}
CacheTypeFactory.__index = CacheTypeFactory
CacheTypeFactory.className = "CacheTypeFactory"

function CacheTypeFactory:_init_fields()
    self.NO_CACHE = CacheType.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING)
    self.CACHE = CacheType.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING)
    self.SET = CacheType.new(StringUtil.getInstance().EMPTY_STRING, "Set")
    self.CACHE_VECTOR = CacheType.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING)
end

function CacheTypeFactory.new()
    local self = setmetatable({}, CacheTypeFactory)
    self:_init_fields()
    return self
end


function CacheTypeFactory.getInstance()
        return CacheTypeFactory.instance
end

CacheTypeFactory.instance = CacheTypeFactory.new()

return CacheTypeFactory

