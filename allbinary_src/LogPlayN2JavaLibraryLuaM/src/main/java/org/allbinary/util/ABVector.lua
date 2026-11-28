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

local ABVector = {}
package.loaded["org.allbinary.util.ABVector"] = ABVector

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

local Vector = require("java.util.Vector")
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

-- class table ABVector is declared before the requires
ABVector.__index = ABVector
ABVector.className = "ABVector"
ABVector.javaClassName = "org.allbinary.util.ABVector"
setmetatable(ABVector, {__index = Vector})

function ABVector._jinit(self)
    java_super_init(Vector, self)
    return self
end

function ABVector.new()
    return ABVector._jinit(setmetatable({}, ABVector))
end


function ABVector:ensureCapacity(minCapacity)
        java_super(Vector, "ensureCapacity", 1)(self, minCapacity)
end
java_overload(ABVector, "ensureCapacity", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ABVector:capacity()
        return java_super(Vector, "capacity", 0)(self)
end
java_overload(ABVector, "capacity", 0)


function ABVector:size()
        return java_super(Vector, "size", 0)(self)
end
java_overload(ABVector, "size", 0)


function ABVector:isEmpty()
        return java_super(Vector, "isEmpty", 0)(self)
end
java_overload(ABVector, "isEmpty", 0)


function ABVector:contains(obj)
        return java_super(Vector, "contains", 1)(self, obj)
end
java_overload(ABVector, "contains", 1)


function ABVector:indexOf(obj)
        return java_super(Vector, "indexOf", 1)(self, obj)
end
java_overload(ABVector, "indexOf", 1)


function ABVector:lastIndexOf(obj)
        return java_super(Vector, "lastIndexOf", 1)(self, obj)
end
java_overload(ABVector, "lastIndexOf", 1)


function ABVector:elementAt(index)
        return java_super(Vector, "elementAt", 1)(self, index)
end
java_overload(ABVector, "elementAt", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ABVector:firstElement()
        return java_super(Vector, "firstElement", 0)(self)
end
java_overload(ABVector, "firstElement", 0)


function ABVector:lastElement()
        return java_super(Vector, "lastElement", 0)(self)
end
java_overload(ABVector, "lastElement", 0)


function ABVector:setElementAt(obj, index)
        java_super(Vector, "setElementAt", 2)(self, obj, index)
end
java_overload(ABVector, "setElementAt", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "E")) and type(java_a2) == "number" end)


function ABVector:removeElementAt(index)
        java_super(Vector, "removeElementAt", 1)(self, index)
end
java_overload(ABVector, "removeElementAt", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ABVector:addElement(obj)
        java_super(Vector, "addElement", 1)(self, obj)
end
java_overload(ABVector, "addElement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "E")) end)


function ABVector:insertElementAt(obj, index)
        java_super(Vector, "insertElementAt", 2)(self, obj, index)
end
java_overload(ABVector, "insertElementAt", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "E")) and type(java_a2) == "number" end)


function ABVector:removeElement(obj)
        return java_super(Vector, "removeElement", 1)(self, obj)
end
java_overload(ABVector, "removeElement", 1)


function ABVector:removeAllElements()
        java_super(Vector, "removeAllElements", 0)(self)
end
java_overload(ABVector, "removeAllElements", 0)


function ABVector:clone()
        return java_super(Vector, "clone", 0)(self)
end
java_overload(ABVector, "clone", 0)


function ABVector:toArray()
        return java_super(Vector, "toArray", 0)(self)
end
java_overload(ABVector, "toArray", 0)


function ABVector:set(index, element)
        return java_super(Vector, "set", 2)(self, index, element)
end
java_overload(ABVector, "set", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "E")) end)


function ABVector:add_j1(element)
        return java_super(Vector, "add", 1)(self, element)
end


function ABVector:remove_j1_1(obj)
        return java_super(Vector, "remove", 1)(self, obj)
end


function ABVector:add_j2(index, element)
        java_super(Vector, "add", 2)(self, index, element)
end
function ABVector:add(...)
    local count = select("#", ...)
    if count == 1 then return self:add_j1(...) end
    if count == 2 then return self:add_j2(...) end
    local parent = getmetatable(ABVector).__index
    if parent.add then return parent.add(self, ...) end
    error("No method add takes " .. count .. " arguments")
end
ABVector.add__jdispatcher = ABVector.add


function ABVector:remove_j1_2(index)
        return java_super(Vector, "remove", 1)(self, index)
end
function ABVector:remove(...)
    local count = select("#", ...)
    if count == 1 then return self:remove_j1(...) end
    local parent = getmetatable(ABVector).__index
    if parent.remove then return parent.remove(self, ...) end
    error("No method remove takes " .. count .. " arguments")
end
ABVector.remove__jdispatcher = ABVector.remove
function ABVector:remove_j1(...)
    local java_a1 = ...
    if true and math.type(java_a1) == "integer" then return ABVector.remove_j1_2(self, ...) end
    return ABVector.remove_j1_1(self, ...)
end


function ABVector:clear()
        java_super(Vector, "clear", 0)(self)
end
java_overload(ABVector, "clear", 0)


function ABVector:equals(obj)
        return java_super(Vector, "equals", 1)(self, obj)
end
java_overload(ABVector, "equals", 1)
ABVector.__eq = function(self, other) return self:equals(other) end


function ABVector:hashCode()
        return java_super(Vector, "hashCode", 0)(self)
end
java_overload(ABVector, "hashCode", 0)


function ABVector:toString()
        return tostring(Vector)
end
java_overload(ABVector, "toString", 0)
ABVector.__tostring = function(self) return self:toString() end


function ABVector:removeRange(fromIndex, toIndex)
        java_super(Vector, "removeRange", 2)(self, fromIndex, toIndex)
end
java_overload(ABVector, "removeRange", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)

return ABVector

