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

local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbstractArrayListPool = {}
AbstractArrayListPool.__index = AbstractArrayListPool
AbstractArrayListPool.className = "AbstractArrayListPool"

function AbstractArrayListPool:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.buffers = BasicArrayListD.new()
    self.cacheableInterfaceFactoryInterface = nil
end


function AbstractArrayListPool.new(cacheableInterfaceFactoryInterface)
    local self = setmetatable({}, AbstractArrayListPool)
    self:_init_fields()
        self.cacheableInterfaceFactoryInterface = cacheableInterfaceFactoryInterface
    return self
end


-- throws Exception
function AbstractArrayListPool:clear()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function AbstractArrayListPool:remove(key)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
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

