-- Generated Code Do Not Modify
-- package org.allbinary.logic.util.cache

local CacheTypeFactory = {}
package.loaded["org.allbinary.logic.util.cache.CacheTypeFactory"] = CacheTypeFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CacheType = java_lazy("org.allbinary.logic.util.cache.CacheType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CacheTypeFactory is declared before the requires
CacheTypeFactory.__index = CacheTypeFactory
CacheTypeFactory.className = "CacheTypeFactory"
CacheTypeFactory.javaClassName = "org.allbinary.logic.util.cache.CacheTypeFactory"

function CacheTypeFactory:_init_fields()
    self.NO_CACHE = CacheType.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING)
    self.CACHE = CacheType.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING)
    self.SET = CacheType.new(StringUtil.getInstance().EMPTY_STRING, "Set")
    self.CACHE_VECTOR = CacheType.new(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING)
end

function CacheTypeFactory._jinit(self)
    CacheTypeFactory._init_fields(self)
    return self
end

function CacheTypeFactory.new()
    return CacheTypeFactory._jinit(setmetatable({}, CacheTypeFactory))
end


function CacheTypeFactory.getInstance()
        return CacheTypeFactory.instance_f
end

CacheTypeFactory.instance_f = CacheTypeFactory.new()

return CacheTypeFactory

