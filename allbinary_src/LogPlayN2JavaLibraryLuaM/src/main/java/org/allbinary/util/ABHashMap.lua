-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.util

local ABHashMap = {}
package.loaded["org.allbinary.util.ABHashMap"] = ABHashMap

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

local HashMap = require("java.util.HashMap")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
local JsType = java_lazy("jsinterop.annotations.JsType")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table ABHashMap is declared before the requires
ABHashMap.__index = ABHashMap
ABHashMap.className = "ABHashMap"
ABHashMap.javaClassName = "org.allbinary.util.ABHashMap"
setmetatable(ABHashMap, {__index = HashMap})

function ABHashMap._jinit(self)
    java_super_init(HashMap, self)
    return self
end

function ABHashMap.new()
    return ABHashMap._jinit(setmetatable({}, ABHashMap))
end


function ABHashMap:size()
        return java_super(HashMap, "size", 0)(self)
end
java_overload(ABHashMap, "size", 0)


function ABHashMap:isEmpty()
        return java_super(HashMap, "isEmpty", 0)(self)
end
java_overload(ABHashMap, "isEmpty", 0)


function ABHashMap:get(key)
        return java_super(HashMap, "get", 1)(self, key)
end
java_overload(ABHashMap, "get", 1)


function ABHashMap:containsKey(key)
        return java_super(HashMap, "containsKey", 1)(self, key)
end
java_overload(ABHashMap, "containsKey", 1)


function ABHashMap:put(key, value)
        return java_super(HashMap, "put", 2)(self, key, value)
end
java_overload(ABHashMap, "put", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "K")) and (java_a2 == nil or java_is(java_a2, "V")) end)


function ABHashMap:putAll(map)
        java_super(HashMap, "putAll", 1)(self, map)
end
java_overload(ABHashMap, "putAll", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Map")) end)


function ABHashMap:remove(key)
        return java_super(HashMap, "remove", 1)(self, key)
end
java_overload(ABHashMap, "remove", 1)


function ABHashMap:clear()
        java_super(HashMap, "clear", 0)(self)
end
java_overload(ABHashMap, "clear", 0)


function ABHashMap:containsValue(value)
        return java_super(HashMap, "containsValue", 1)(self, value)
end
java_overload(ABHashMap, "containsValue", 1)


function ABHashMap:keySet()
        return java_super(HashMap, "keySet", 0)(self)
end
java_overload(ABHashMap, "keySet", 0)


function ABHashMap:entrySet()
        return java_super(HashMap, "entrySet", 0)(self)
end
java_overload(ABHashMap, "entrySet", 0)


function ABHashMap:getOrDefault(key, defaultValue)
        return java_super(HashMap, "getOrDefault", 2)(self, key, defaultValue)
end
java_overload(ABHashMap, "getOrDefault", 2, function(java_a1, java_a2) return true and (java_a2 == nil or java_is(java_a2, "V")) end)


function ABHashMap:putIfAbsent(key, value)
        return java_super(HashMap, "putIfAbsent", 2)(self, key, value)
end
java_overload(ABHashMap, "putIfAbsent", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "K")) and (java_a2 == nil or java_is(java_a2, "V")) end)


function ABHashMap:clone()
        return java_super(HashMap, "clone", 0)(self)
end
java_overload(ABHashMap, "clone", 0)

return ABHashMap

