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

local IndexedBasicArrayListCache = {}
package.loaded["org.allbinary.logic.util.cache.IndexedBasicArrayListCache"] = IndexedBasicArrayListCache

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local BaseBasicArrayListCache = require("org.allbinary.logic.util.cache.BaseBasicArrayListCache")
local CacheInterface = require("org.allbinary.logic.util.cache.CacheInterface")
local CacheableInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterface")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table IndexedBasicArrayListCache is declared before the requires
IndexedBasicArrayListCache.__index = IndexedBasicArrayListCache
IndexedBasicArrayListCache.className = "IndexedBasicArrayListCache"
IndexedBasicArrayListCache.javaClassName = "org.allbinary.logic.util.cache.IndexedBasicArrayListCache"
setmetatable(IndexedBasicArrayListCache, {__index = BaseBasicArrayListCache})
IndexedBasicArrayListCache.java_implements = " CacheInterface "
IndexedBasicArrayListCache.java_interfaces = function() return {CacheInterface} end

function IndexedBasicArrayListCache:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.size_f = 0
    self.index = 0
end


-- throws Exception
function IndexedBasicArrayListCache.createCache(size)
        local indexedBasicArrayListCache = IndexedBasicArrayListCache.new()
        indexedBasicArrayListCache:init(size)
        return indexedBasicArrayListCache
end


function IndexedBasicArrayListCache._jinit(self)
    java_super_init(BaseBasicArrayListCache, self)
    IndexedBasicArrayListCache._init_fields(self)
    return self
end

function IndexedBasicArrayListCache.new(...)
    local self = setmetatable({}, IndexedBasicArrayListCache)
    IndexedBasicArrayListCache._jinit(self, ...)
    return self
end


-- throws Exception
function IndexedBasicArrayListCache:init(size)
        if self.size_f < size then
            self.list:ensureCapacity(size)
            for index = size - 1, self.size_f, -1 do
                self:addDefault()
            end
            self.size_f = size
        end
end
java_overload(IndexedBasicArrayListCache, "init", 1, function(java_a1) return true and type(java_a1) == "number" end)


function IndexedBasicArrayListCache:getAt(index)
        return self.list.objectArray[index + 1]
end
java_overload(IndexedBasicArrayListCache, "getAt", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function IndexedBasicArrayListCache:addDefault()
end
java_overload(IndexedBasicArrayListCache, "addDefault", 0)


-- throws Exception
function IndexedBasicArrayListCache:addObject(anyType)
        self.list:add(anyType)
end
java_overload(IndexedBasicArrayListCache, "addObject", 1)


-- throws Exception
function IndexedBasicArrayListCache:add(cacheableInterface)
        self.list:add(cacheableInterface)
end
java_overload(IndexedBasicArrayListCache, "add", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CacheableInterface")) end)


-- throws Exception
function IndexedBasicArrayListCache:addArray(cacheableInterfaces)
        error(require("java.lang.Exception").new("No Imple"), 0)
end
java_overload(IndexedBasicArrayListCache, "addArray", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function IndexedBasicArrayListCache:clear()
        self.index = 0
end
java_overload(IndexedBasicArrayListCache, "clear", 0)

return IndexedBasicArrayListCache

