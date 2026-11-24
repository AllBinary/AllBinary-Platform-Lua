--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.util.cache

local AbstractArrayListPool = {}
package.loaded["org.allbinary.logic.util.cache.AbstractArrayListPool"] = AbstractArrayListPool

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

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local PoolInterface = require("org.allbinary.logic.util.cache.PoolInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table AbstractArrayListPool is declared before the requires
AbstractArrayListPool.__index = AbstractArrayListPool
AbstractArrayListPool.className = "AbstractArrayListPool"
AbstractArrayListPool.javaClassName = "org.allbinary.logic.util.cache.AbstractArrayListPool"
AbstractArrayListPool.java_implements = " PoolInterface "
AbstractArrayListPool.java_interfaces = function() return {PoolInterface} end

function AbstractArrayListPool:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.buffers = BasicArrayListD.new()
    if self.cacheableInterfaceFactoryInterface == nil then self.cacheableInterfaceFactoryInterface = nil end
end


function AbstractArrayListPool._jinit(self, cacheableInterfaceFactoryInterface)
    AbstractArrayListPool._init_fields(self)
        self.cacheableInterfaceFactoryInterface = cacheableInterfaceFactoryInterface
    return self
end

function AbstractArrayListPool.new(...)
    local self = setmetatable({}, AbstractArrayListPool)
    AbstractArrayListPool._jinit(self, ...)
    return self
end


-- throws Exception
function AbstractArrayListPool:clear()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function AbstractArrayListPool:remove(key)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function AbstractArrayListPool:add(cacheableInterface)
        self.buffers:add(cacheableInterface)
end


-- throws Exception
function AbstractArrayListPool:addArray(cacheableInterfaces)
        for index = 0, (cacheableInterfaces.n or #cacheableInterfaces) - 1 do
            self.buffers:add(cacheableInterfaces[index + 1])
        end
end

return AbstractArrayListPool

