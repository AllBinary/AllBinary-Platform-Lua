-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2007 AllBinary 
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

local CacheInterfaceFactory = {}
package.loaded["org.allbinary.logic.util.cache.CacheInterfaceFactory"] = CacheInterfaceFactory

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

local CacheInterface = java_lazy("org.allbinary.logic.util.cache.CacheInterface")
local CachePolicy = java_lazy("org.allbinary.logic.util.cache.CachePolicy")
local CacheType = java_lazy("org.allbinary.logic.util.cache.CacheType")

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

-- class table CacheInterfaceFactory is declared before the requires
CacheInterfaceFactory.__index = CacheInterfaceFactory
CacheInterfaceFactory.className = "CacheInterfaceFactory"
CacheInterfaceFactory.javaClassName = "org.allbinary.logic.util.cache.CacheInterfaceFactory"


function CacheInterfaceFactory._jinit(self)
    return self
end

function CacheInterfaceFactory.new(...)
    local self = setmetatable({}, CacheInterfaceFactory)
    CacheInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function CacheInterfaceFactory.getInstance(cacheType, cachePolicy)
        error(require("java.lang.Exception").new(require("allbinary_java").to_string("No such ") .. require("allbinary_java").to_string(tostring(cacheType))), 0)
end

return CacheInterfaceFactory

