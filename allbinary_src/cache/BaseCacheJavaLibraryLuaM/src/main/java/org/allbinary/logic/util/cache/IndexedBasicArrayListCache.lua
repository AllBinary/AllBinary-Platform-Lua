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

local JsType = require("jsinterop.annotations.JsType")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local JsProperty = require("jsinterop.annotations.JsProperty")
local BaseBasicArrayListCache = require("org.allbinary.logic.util.cache.BaseBasicArrayListCache")
local CacheInterface = require("org.allbinary.logic.util.cache.CacheInterface")

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

local IndexedBasicArrayListCache = {}
IndexedBasicArrayListCache.__index = IndexedBasicArrayListCache
IndexedBasicArrayListCache.className = "IndexedBasicArrayListCache"
setmetatable(IndexedBasicArrayListCache, {__index = BaseBasicArrayListCache})

function IndexedBasicArrayListCache:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.size = 0
    self.index = 0
end


-- throws Exception
function IndexedBasicArrayListCache.createCache(size)
        local indexedBasicArrayListCache = IndexedBasicArrayListCache.new()
        indexedBasicArrayListCache:init(size)
        return indexedBasicArrayListCache
end


function IndexedBasicArrayListCache.new()
    local self = setmetatable(BaseBasicArrayListCache.new(), IndexedBasicArrayListCache)
    self:_init_fields()
    return self
end


-- throws Exception
function IndexedBasicArrayListCache:init(size)
        if self.size < size then
            self.list:ensureCapacity(size)
            for index = size - 1, self.size, -1 do
                self:addDefault()
            end
            self.size = size
        end
end


function IndexedBasicArrayListCache:getAt(index)
        return self.list.objectArray[index + 1]
end


-- throws Exception
function IndexedBasicArrayListCache:addDefault()
end


-- throws Exception
function IndexedBasicArrayListCache:addObject(anyType)
        self.list:add(anyType)
end


-- throws Exception
function IndexedBasicArrayListCache:add(cacheableInterface)
        self.list:add(cacheableInterface)
end


-- throws Exception
function IndexedBasicArrayListCache:addArray(cacheableInterfaces)
        error(java_exception("Exception", "No Imple"), 0)
end


function IndexedBasicArrayListCache:clear()
        self.index = 0
end

return IndexedBasicArrayListCache

